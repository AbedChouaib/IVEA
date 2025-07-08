import tensorflow as tf
from keras.layers import  TimeDistributed, Flatten,Conv3D, MaxPooling3D, Layer, Multiply
from keras.models import Model
from keras import Sequential, layers, activations
import os
import numpy as np
import shutil
from keras.callbacks import CSVLogger, EarlyStopping
from keras.losses import categorical_crossentropy
import json
from datetime import datetime

class eViT_modelv2:
    """
    Class model:
    1) Creating or loading  Transformer model.
    2) Freezing certain layers (backbone).
    3) Saving and versioning the model.
    """

    def __init__(self,
                 base_out_dir,
                 input_shape,
                 num_classes,
                 dropout_rate=0.0,
                 learning_rate=0.0003,
                 patience=5,
                 batch_size=100,
                 max_epochs=100,
                 params = None):
        """
        Initialize with your chosen hyperparameters, paths, etc.
        """
        self.out_dir = base_out_dir
        self.file_name = params["file_name"]
        self.input_shape = input_shape
        self.num_classes = num_classes
        self.dropout_rate = dropout_rate
        self.learning_rate = learning_rate
        self.patience = patience
        self.batch_size = batch_size
        self.max_epochs = max_epochs
        self.params = params
        self.model = None
        self.model_tag = ""
        # For logging/tracking
        self.log_name = "training.log"
        print(f"--> Number of GPUs Available: {len(tf.config.list_physical_devices('GPU'))}, {tf.config.list_physical_devices('GPU')}")

    def initialize_model(self, new_training=True, existing_model_path=None):
        """
        Create a fresh model or load an existing one. 
        Optionally freeze layers except the classification head.
        """
        if not new_training:    
            if existing_model_path and os.path.exists(existing_model_path):
                print(f">> Loading existing model from: {existing_model_path}")
                self.model = tf.keras.models.load_model(existing_model_path)
                # Update num_classes based on loaded model's last layer output
                self.num_classes = self.model.layers[-1].output_shape[-1]
            else:
                print("Aborting, model path doesn't exist, please check again!")
        else:
            print(">> Training a new eViT model from scratch...")
            self.model = self._build_trans_model()

        # (Re)compile the model
        self.model.compile(
            optimizer=tf.keras.optimizers.Adam(learning_rate=self.learning_rate),
            loss="categorical_crossentropy",
            metrics=["accuracy"]
        )
        print(self.model.summary())


    def refine_existing_class(self, freeze_backbone=True, unfreeze_transformer2=False,
                              out_dir_tag="_refine", batch_size = 10, epoch = 10):
        """
        Fine-tune the model to refine on existing classes.
        By default, it freezes the backbone, but you can unfreeze certain layers.
        We are offering the 2nd transformer layer to freeze (experimental).

        Args:
            freeze_backbone (bool): If True, freeze the backbone layers.
            unfreeze_transformer2 (bool): If True, specifically unfreeze the 2nd Transformer layer.
            out_dir_tag (str): Suffix for the output directory name when saving refined model.
        """
        self.batch_size = batch_size
        self.max_epochs = epoch
        self.model_tag = out_dir_tag
        # Freeze or unfreeze layers
        if freeze_backbone:
            self._freeze_backbone_layers()
        if unfreeze_transformer2:
            self._unfreeze_transformer_layer_2()

            
    def train_model(self, x_train, y_train):
        """
        Main training function. Normalizes data, trains, saves model with versioned name.
        x.shape = (Batch_size: None, frames:x.shape[1], Width:x.shape[2], Height:x.shape[3], Channels:x.shape[4])
        """
        tf.random.set_seed(123)
        # Normalize per sample
        x_train = self.normalize_batch(x_train)

        # Create a unique save directory for this training run
        save_path = self.get_unique_directoryname(self.out_dir, f"{self.file_name}_tf2.10.1-{self.model_tag}v")
        json_path = os.path.join(save_path, 'model_config.json')
        # Setup callbacks
        early_stopping = EarlyStopping(monitor='loss', patience=self.patience)
        csv_logger = CSVLogger(os.path.join(save_path, self.log_name))

        print(f"--> Training up to {self.max_epochs} epochs with batch size={self.batch_size}")
        self.model.fit(
            x=x_train,
            y=y_train,
            epochs=self.max_epochs,
            batch_size=self.batch_size,
            verbose=1,
            shuffle=True,
            callbacks=[early_stopping, csv_logger]
        )

        current_time = datetime.now().strftime("%Y-%m-%d_%H:%M:%S")
        print(f"--- Training completed at {current_time} ---")

        # Save final model
        tf.keras.models.save_model(self.model, save_path)
        print(f"--- Model saved at {save_path} ---")

        # Optional: save config as JSON
        if self.params is not None:
            json_path = os.path.join(save_path, 'model_config.json')
            self.save_parameters_to_json(self.params, json_path)

    # ---------------------------------------------------------------- #
    #                HELPER INTERNAL METHODS                           #
    # ---------------------------------------------------------------- #

    def _build_trans_model(self):
        """
        Build your custom 3D + Transformer model as you had it. 
        (Copied from your existing get_trans_model, but inside the class.)
        """
        # from your code:
        encoder = Encoder3D(filters=32, kernel_size=(3, 3, 3), padding='same')  # was filters=8
        num_heads = 8
        inputs = layers.Input(shape=self.input_shape)

        x = encoder(inputs)
        x = TimeDistributed(Flatten())(x)
        x = TimeDistributed(layers.Dense(64, activation=activations.gelu))(x)
        sequence_length = x.shape[1]
        key_dim = x.shape[2]
        dense_dim = key_dim * 2

        x = PositionalEmbedding(sequence_length, key_dim, name="frame_position_embedding")(x)

        for i in range(2):
            x = TransformerEncoder(
                key_dim, 
                dense_dim, 
                num_heads, 
                sequence_length, 
                self.dropout_rate, 
                name=f"transformer_layer_{i+1}"
            )(x)

        x = Flatten()(x)
        x = layers.Dense(64, activation=activations.gelu)(x)
        outputs = layers.Dense(self.num_classes, activation="softmax")(x)

        model = Model(inputs=inputs, outputs=outputs)
        return model

    def _freeze_backbone_layers(self):
        """
        Freeze all layers except the final few. Adjust the slicing if you want 
        a more fine-grained freeze logic.
        """
        # Example: freeze everything except the last 1 or 2 layers
        # Identify which layers are 'backbone' vs. 'head'.
        for layer in self.model.layers[:-2]:  
            layer.trainable = False

        print(">> Backbone layers are now frozen. Trainable layers:")
        for layer in self.model.layers:
            print(layer.name, layer.trainable)


    def _unfreeze_transformer_layer_2(self):
        """
        Unfreeze the second Transformer block (transformer_layer_2).
        This is just an example that identifies the layer by name and sets it trainable=True.
        """
        # For example, your second transformer layer might be named "transformer_layer_2"
        # or "transformer_layer_2_1". Adjust as needed.
        for layer in self.model.layers:
            # If a layer's name starts with "transformer_layer_2", unfreeze it
            if layer.name.startswith("transformer_layer_2"):
                layer.trainable = True
                print(f"--- Unfreezing layer: {layer.name}")

        print(">> After unfreezing transformer_layer_2, current trainable layers:")
        for layer in self.model.layers:
            print("   ", layer.name, layer.trainable)
            
    
    # def add_new_classes(self, num_new_classes=1):
    #     """
    #     Expand the final Dense layer to accommodate new classes.
    #     Example: if old_num_classes=10, user wants +2 => new_total=12
    #     """
    #     old_num_classes = self.num_classes
    #     new_total_classes = old_num_classes + num_new_classes

    #     # Keep everything except the last Dense layer
    #     x = self.model.layers[-2].output
    #     new_output = layers.Dense(new_total_classes, activation="softmax", name="expanded_output")(x)
    #     self.model = Model(inputs=self.model.input, outputs=new_output)
    #     self.num_classes = new_total_classes

    #     self.model.compile(
    #         optimizer=tf.keras.optimizers.Adam(learning_rate=self.learning_rate),
    #         loss="categorical_crossentropy",
    #         metrics=["accuracy"]
    #     )
    #     print(f">> Model expanded from {old_num_classes} classes to {new_total_classes} classes.")
    #     print(self.model.summary())
    
          
    def get_unique_directoryname(self, baseDir, dirname):
        counter = 1
        while True:
            full_dirname = f"{dirname}_{counter}"
            full_path = os.path.join(baseDir, full_dirname)
            if not os.path.exists(full_path):
                os.makedirs(full_path)
                return full_path
            else:
                counter += 1

  
    def normalize_batch(self, batch):
        """
        Per-sample 0..1 normalization
        """
        mins = np.min(batch, axis=(1, 2, 3, 4), keepdims=True)
        maxs = np.max(batch, axis=(1, 2, 3, 4), keepdims=True)
        denominators = np.where((maxs - mins) == 0, 1, maxs - mins)
        normalized_batch = (batch - mins) / denominators
        assert np.all(normalized_batch >= 0) and np.all(normalized_batch <= 1)
        return normalized_batch


    def move_file(self, source_file, destination_dir, filename):
        if not os.path.isfile(source_file):
            return False
        
        destination_file = os.path.join(destination_dir, filename)
        
        try:
            shutil.move(source_file, destination_file)
            return True
        except Exception as e:
            print(f"Error occurred while moving file: {e}")
            return False
        

    def save_parameters_to_json(self, params, filepath):
        with open(filepath, 'w') as f:
            json.dump(params, f, indent=4)

    
class Conv2Plus1D(Layer):
    def __init__(self, filters, kernel_size, padding, name_prefix=""):
        super().__init__()
        self.spatial_conv = layers.Conv3D(
            filters=filters,
            activation=activations.relu,
            kernel_size=(1, kernel_size[1], kernel_size[2]),
            padding=padding,
            strides=(1, 1, 1),
            name=f"{name_prefix}_spatial_conv"
        )
        self.temporal_conv = layers.Conv3D(
            filters=filters,
            activation=activations.relu,
            kernel_size=(kernel_size[0], 1, 1),
            padding=padding,
            strides=(1, 1, 1),
            name=f"{name_prefix}_temporal_conv"
        )

    def call(self, x):
        x = self.spatial_conv(x)
        x = self.temporal_conv(x)
        return x
    
    
class PositionalEmbedding(tf.keras.layers.Layer):
    """ inputs.shape: (batch_size, frames, num_features)"""
    def __init__(self, sequence_length, output_dim, **kwargs):
        super().__init__(**kwargs)
        self.position_embeddings = tf.keras.layers.Embedding(
            input_dim=sequence_length, output_dim=output_dim
        )

    def call(self, inputs):
        inputs = tf.cast(inputs, self.compute_dtype)
        length = tf.shape(inputs)[1]  # get shape information
        positions = tf.range(length, dtype=tf.int32)  # creating sequences
        embedded_positions = self.position_embeddings(positions)
        return inputs + embedded_positions
    
    
class TransformerEncoder(layers.Layer):
    def __init__(self, key_dim, dense_dim, num_heads, sequence_length, dropout, **kwargs):
        super().__init__(**kwargs)
        self.key_dim = key_dim
        self.dense_dim = dense_dim
        self.num_heads = num_heads
        self.sequence_length = sequence_length
        self.dropout = dropout
        self.attention = layers.MultiHeadAttention(
            num_heads=num_heads, key_dim=key_dim, dropout=self.dropout
        ) 
        self.dense_proj = Sequential(
            [
                layers.Dense(dense_dim, activation=activations.gelu),
                layers.Dense(key_dim),
            ]
        )

    def call(self, inputs, mask=None):
        attention_output = self.attention(inputs, inputs, attention_mask=mask)
        proj_input  = inputs + attention_output # self.layernorm_1(inputs + attention_output)
        proj_output = self.dense_proj(proj_input)
        return  proj_input + proj_output
           
    
class SpatialConv(Layer):
    def __init__(self, kernel_size, name_prefix=""):
        super().__init__()
        self.kernel_size = kernel_size
        self.name_prefix = name_prefix

    def build(self, input_shape):
        self.conv = Conv3D(
            filters=1,
            kernel_size=self.kernel_size,
            padding='same',
            activation=activations.gelu,
            name=f"{self.name_prefix}_attention_conv"
        )

    def call(self, inputs):
        exps = self.conv(inputs)
        scaled_features = Multiply(name=f"{self.name_prefix}_multiply")([inputs, exps])
        return scaled_features

       
    
class Encoder3D(Layer):
    def __init__(self, filters, kernel_size, padding):
        super().__init__()
        self.filters = filters
        self.kernel_size = kernel_size
        self.padding = padding
        self.spatial_attention = SpatialConv(kernel_size = self.kernel_size, name_prefix="spatial_conv")

    def build(self, input_shape):
        self.conv3d = Conv2Plus1D(filters=self.filters, kernel_size=self.kernel_size, padding=self.padding, name_prefix="conv3D_1")
        self.conv3d2 = Conv2Plus1D(filters=self.filters*2, kernel_size=self.kernel_size, padding=self.padding, name_prefix="conv3D_2")
        self.conv3d3 = Conv2Plus1D(filters=self.filters*4, kernel_size=self.kernel_size, padding=self.padding, name_prefix="conv3D_3")
        self.pooling3d = MaxPooling3D(pool_size=(1, 2, 2), padding='same', name="pooling3d_1")
        self.pooling3d2 = MaxPooling3D(pool_size=(1, 2, 2), padding='same', name="pooling3d_2")
        self.pooling3d3 = MaxPooling3D(pool_size=(2, 2, 2), padding='same', name="pooling3d_3")

    def call(self, inputs):
        x = self.spatial_attention(inputs)
        x = self.conv3d(x)
        x = self.pooling3d(x)
        
        x = self.conv3d2(x)
        x = self.pooling3d2(x)
        
        x = self.conv3d3(x)
        x = self.pooling3d3(x)
        
        return x
    

class CustomModelCheckpoint(tf.keras.callbacks.Callback):
    def __init__(self, model, checkpoint_filepath):
        self.model = model
        self.best_val_accuracy = float("-inf")
        self.best_epoch = 0
        self.checkpoint_filepath = checkpoint_filepath

    def on_epoch_end(self, epoch, logs=None):
        if (epoch + 1) % 10 == 0: 
            current_val_accuracy = logs.get("accuracy")
            if current_val_accuracy is not None and current_val_accuracy > self.best_val_accuracy:
                self.best_val_accuracy = current_val_accuracy
                self.best_epoch = epoch + 1
                self.model.save(self.checkpoint_filepath)
                
