import numpy as np
from skimage.transform import resize
import os
import tkinter as tk
from tkinter import filedialog
from tifffile import imread,imwrite
from tkinter import ttk
import tkinter as tk
from tkinter import ttk, PhotoImage
from read_imagej_rois import imagej_rois
import matplotlib.pyplot as plt
from eViT_modelv2 import eViT_modelv2 as eViTmodel
from tooltip import ToolTip as tool_tip
import read_config as config_mapper
from data_augmentation import DataAugmentor
import h5py
import ctypes
import random
import threading
import json
# ======================
'''
This script is used to collect data and initialize the eViT neural network with the correct parameters. Author: Abed Chouaib

'''
# =========================

class IVEA_main:
    def __init__(self, root):
        self.cancel_ = False
        self.progressbar = None
        self.progress_label = None
        self.window_status = None
        self.root = parent
        self.root.title("Training app")  # (Author: Abed A. Chouaib)
        self.root.geometry("550x250")  # <<<<<<<<<<<<<<<<<<<<<<<<<<<<< window.
        
        try:
            icon = PhotoImage(file='IVEA_logo_x128d.png')
            self.root.iconphoto(False, icon)
        except FileNotFoundError:
            print("Image file not found. Please check the file path.")
        except Exception as e:
            print(f"An error occurred: {e}")
        
        # self.root.iconbitmap('IVEA logo x128d.png')
        root.resizable(False, False)
        self.color_hex_bg = "#181818"
        butt_width = 8
        # ======================== Region load Prefs ========================
        self.trained_model_path = tk.StringVar(value="")
        self.selected_trained_model_name = tk.StringVar(value="")
        self.inputDir_last_path = tk.StringVar(value="")
        self.dataset_last_path = tk.StringVar(value="")
        self.new_training = False # this boolean is used to create a new model
        self.model_map = {}
        self.preferences = {}
        self.load_preferences()
        self.restor_intial_pref()
        # ======================== end ========================
        
        # ======================== Region extract parameters ========================
        self.outDir = ""
        self.inDir = ""
        self.x_name = "x_train"
        self.y_name = "y_train"
        self.debug = False  # this boolean is used to debug the flow of the data
        
        self.ensure_directories_exist()
        self.default_config_file_path = 'settings/ivea_default_config.json' # config file path, change it if needed
        self.granu_config_file_path = 'settings/ivea_GranuData_config.json'
        self.neuro_config_file_path = 'settings/ivea_NeuroData_config.json'
        if not self.default_config_file_path:
            print(">>>Error: IVEA didn't find the default configuration file (ivea_default_config.json) in the settings directory in the project root directory!")
            print(">>> Please make sure that this file exist to start the software (settings/ivea_default_config.json)")
            return
        
        self.memory_dataset_neurons = "data/memory/neurons_memory_c10.h5"
        self.memory_dataset_random = "data/memory/CTL-CC-INS1_memory_c11.h5"
        # ==================== Config Args ====================
        self.config_args = config_mapper.read_config( self.default_config_file_path)
        self.batch_size = self.config_args.batch_size 
        self.dropout_rate = self.config_args.dropout_rate
        self.call_patience = self.config_args.call_patience
        self.learning_rate = self.config_args.learning_rate
        self.existing_dataset = self.config_args.dataset_path
        self.epoch_num = self.config_args.epoch_num
        self.IVEA_Rad = self.config_args.patch_size
        self.num_augmentation = self.config_args.num_augmentation
        self.augment_data = self.config_args.augment_data
        self.label = self.config_args.class_tag
        self.zip_file_label = self.config_args.roi_file_tag
        self.outfile_name = self.config_args.outfile_dataset_name
        self.model_tag_name = "eViT_"+self.config_args.model_type
        self.model_type = self.config_args.model_type
        self.model_name = self.config_args.model_name
        self.num_fusion = len(self.config_args.positive_classes) # get class count
        self.num_randomClasses = len(self.config_args.negative_classes) # get class count
        self.timeseries = self.config_args.timeseries
        self.more_frames = self.config_args.more_frames
        self.class_nolabel = self.config_args.class_nolabel 
        self.radius_nolabel = self.config_args.radius_nolabel 
        self.fileExtension = self.config_args.file_extension
        self.save_data = self.config_args.save_data
        self.scale_radius_to = self.config_args.scale_radius_to # 16 static, resize patch to this value
        self.outputDir = self.check_dir_path(self.config_args.output_dir)
        # ==================== ====================
        self.combine_data = False 
        self.memory_data_path = self.memory_dataset_random
        self.cancel_ = False
        self.training_thread = None 
        
        if self.timeseries % 2 != 0:
            self.timeseries -= 1
            
        self.read_frames = int(self.timeseries/2)
        
        self.num_classes = self.num_fusion + self.num_randomClasses
        
        self.params = {
                "num_fusion": self.num_fusion,
                "num_classes": self.num_classes,
                "timeseries": self.timeseries,
                "more_frames": self.more_frames,
                "patch_radius": self.scale_radius_to,
                "file_name": self.model_tag_name,
                "model_type": self.model_type,
                "model_name": self.config_args.model_name
                }
        # ==================== Label fields ====================
        # Import Directories Panel
        row_ = 1
        fields_panel = tk.Frame(root)
        fields_panel.configure(background=self.color_hex_bg)
        fields_panel.grid(row=row_, column=0, columnspan=4, padx=10, pady=10, sticky="w")
        row_ = 0
        # pxy = [10, 1]
        # ========== Input fields ==========
        row_ = 1
        # pxy = [10, 3]
        # ========== String input field ==========
        row_ = 2
        # ==================== End ====================
        # print("--> Loading TensorFlow version: ", tf.__version__)
        # ========== Directory selection button ==========
        self.import_panel = tk.Frame(root)
        self.import_panel.configure(background=self.color_hex_bg)
        self.import_panel.grid(row=0, column=0, columnspan=3, padx=10, pady=10, sticky="w")
        # Input Directory
        row_ = 0
        self.inputDir = tk.StringVar()
        inputDir_label = tk.Label(self.import_panel, text="Videos directory (tiff):", justify="left", background=self.color_hex_bg,
                                  foreground="white")
        inputDir_label.grid(row=row_, column=0, padx=10, pady=10, sticky="w")
        inputDir_entry = tk.Entry(self.import_panel, textvariable=self.inputDir, width=42)
        inputDir_entry.grid(row=row_, column=1, padx=10, pady=10, sticky="w")
        inputDir_button = tk.Button(self.import_panel, text="Import", command=self.import_butt, width=butt_width,
                                    background=self.color_hex_bg, foreground="white")
        inputDir_button.grid(row=row_, column=2, padx=10, pady=10)
        
        inputDir_entry.insert(0,self.inputDir_last_path.get())
        self.inputDir.set(self.inputDir_last_path.get())
        # Output Directory
        row_ = 1
        self.current_dataset = tk.StringVar()
        self.cDataset_label = tk.Label(self.import_panel, text="Your Current Dataset:", justify="left", background=self.color_hex_bg,
                                   foreground="white")
        self.cDataset_label.grid(row=row_, column=0, padx=10, pady=10, sticky="w")
        self.cDataset_entry = tk.Entry(self.import_panel, textvariable=self.current_dataset, width=42)
        self.cDataset_entry.grid(row=row_, column=1, padx=10, pady=10, sticky="w")
        self.cDataset_button = tk.Button(self.import_panel, text="Import", command=self.Out_butt, width=butt_width,
                                     background=self.color_hex_bg, foreground="white")
        self.cDataset_button.grid(row=row_, column=2, padx=10, pady=10)
        self.cDataset_entry.insert(0,self.dataset_last_path.get())
        
        row_ = 2
        tk.Label(
            self.import_panel, text="Select Model:", justify="left",
            background=self.color_hex_bg, foreground="white"
        ).grid(row=row_, column=0, padx=10, pady=10, sticky="w")

        # Create a combobox which holds the model choices
        self.model_combobox = ttk.Combobox(
            self.import_panel,
            textvariable=self.selected_trained_model_name,  # this variable will store the 'model_name' or "Train new model"
            state="readonly"
        )
        self.model_combobox.grid(row=2, column=1, padx=10, pady=10, sticky="w")
        
        # get combobox with discovered models (and "Train new model")
        self.populate_model_list()

        # link user selection with the combobox
        self.model_combobox.bind("<<ComboboxSelected>>", self.on_model_selection)

        # restore previousl selected preference
        self.restore_last_selected_model()

        row_ = 3
        button_frame = tk.Frame(root)
        button_frame.configure(background=self.color_hex_bg)
        delay = 300
        duration = 20000
        # New "Combine data" button 
        combine_data_button = tk.Button(
            button_frame, text="Combine datasets", command=self.combine_export, width=butt_width * 2,
            background=self.color_hex_bg, foreground="white"
        )
        combine_data_button.pack(side=tk.LEFT, padx=(5, 10), pady=1)  # Slight padding for consistent spacing
        tool_tip(combine_data_button, text= "Extend an existing dataset for a larger project, only use when you plan to make your own new model" +
                 "\nThis button extract data from videos directory and combine it with existing datasets.h5 and export one new dataset."
                 +"\nPlease provide the existing dataset.h5 path to the JSON config file under the dataset_path name.",
                 delay=delay, duration=duration)
        # "Export data" button
        create_dataset = tk.Button(
            button_frame, text="Create dataset", command=self.start_data_collection_thread, width=butt_width * 2,
            background=self.color_hex_bg, foreground="white"
        )
        create_dataset.pack(side=tk.LEFT, padx=10, pady=1)
        tool_tip(create_dataset, text="Use this button to create your own dataset for training/refinement." +
                 "\nThis button facilitates the creation of a new dataset from the videos directory while integrating it with an existing memory data.",
                 delay=delay, duration=duration)
        # "Train model" button
        train_model_directly = tk.Button(
            button_frame, text="Train model", command=self.start_training_thread, width=butt_width * 2,
            background=self.color_hex_bg, foreground="white"
        )
        train_model_directly.pack(side=tk.LEFT, padx=10, pady=1)
        tool_tip(train_model_directly, text="This button is used to train the model on a preexisting dataset and save the model to the designated output directory."
                 +"\nDefault output directroy is the project root directory /output"
                 +"\nThe model will train on the provided dataset from the current dataset path if provided else it will search the JSON config file for dataset_path.",
                 delay=delay, duration=duration)
        # "Cancel" button
        cancel_button2 = tk.Button(
            button_frame, text="Cancel", command=self.cancel, width=butt_width,
            background=self.color_hex_bg, foreground="white"
        )
        cancel_button2.pack(side=tk.LEFT, padx=(10, 5), pady=1)  # Consistent right padding

        # Place the button frame in the grid
        button_frame.grid(row=row_, column=2, columnspan=2, padx=0, pady=1)
        

        if os.name == 'nt':
            window_id = root.winfo_id() 
            self.force_dark_title_bar(window_id)
            root.update()  
            root.after_idle(root.update_idletasks)
            
            
        self.check_last_model_selection() 
           
    # ==================== Listener ====================
    # def load_model(self):
    #     # directory = filedialog.askopenfilename()
    #     directory = filedialog.askdirectory()
    #     self.trained_model_path.set(directory)

    def import_butt(self):
        directory = filedialog.askdirectory()
        self.inputDir_last_path.set(directory)
        self.inputDir.set(directory)
        self.save_preferences()

    def Out_butt(self):
        # Open file dialog for selecting only .h5 files
        file_path = filedialog.askopenfilename(
            title="Select H5 File",
            filetypes=[("HDF5 Files", "*.h5")],  # only show .h5 files
            defaultextension=".h5" 
        )

        if file_path:
            self.dataset_last_path.set(file_path)
            self.current_dataset.set(file_path)
            self.save_preferences()

    def cancel(self):
        self.root.destroy()
        return None

    # ==================== End ====================

    # ==================== Start Analysis ====================
        
    def export_data(self):
        if not self.outfile_name:
            self.outfile_name = self.get_last_directory_name(self.inputDir.get())
            
        extension = ".tif"
        ext_Rois = ["zip", "roi"]
        
        if not self.fileExtension:  # check empty or None
            extension = ""
        else:
            extension = f".{self.fileExtension.lstrip('.')}"
          
        self.inDir = self.inputDir.get()
        self.outDir = self.outputDir
        
        x_files, x_names = self.get_files(self.inDir, extension)
        x_Rois, rois_names = self.get_files(self.inDir, ext_Rois)    
                  
        if self.combine_data:
            if self.existing_dataset:
                print("Loading existing data please wait")
                train_data = self.load_train_data(self.existing_dataset, self.x_name, self.y_name)
                x_train = np.array(train_data[self.x_name])
                y_train = np.array(train_data[self.y_name])
                x_train = x_train.tolist()
                y_train = y_train.tolist()
            else:
                print("                         >>> Warning NO dataset file found! <<<                         " + 
                      "\n>>> Please check if dataset_path entry in the config file points to a valid file location.")
                x_train = []
                y_train = []
        else:
            print(">>> Initializing x_train and y_train lists")
            x_train = []
            y_train = []


                
            # --------------- end ---------------
        control_image_write = 1
        print(f">>> dir path: {self.inDir} | x_files count: {len(x_files)}")
        
        for file_idx, file in enumerate(x_files):
            im_stack = imread(file).astype(np.float32)
            file_name = x_names[file_idx]
            dict_roi = []
            for roi_idx, roi_name in enumerate(rois_names):
                roi_file = x_Rois[roi_idx]
                # --------------- Checking correct paths ---------------
                temp_ROIname = roi_file.replace(self.zip_file_label, "")
                temp_ROIname = temp_ROIname.replace(extension, "")
                temp_ROIname = temp_ROIname.replace(".zip", "")
                temp_ROIname = temp_ROIname.replace(".roi", "")
                temp_filename = file.replace(extension, "")
                # print(f"file: {temp_filename} <==> ROI {temp_ROIname}")
                # --------------- end ---------------
                if temp_filename == temp_ROIname:
                    print(f">>> roi_file is: {roi_file}")
                    # Load ROIs whether they were .zip or .roi
                    dict_roi = imagej_rois.read_rois(roi_file)
                    for i in range(len(dict_roi)):
                        roi_ID = dict_roi[i]['name']
                        radius = int(dict_roi[i]['r']) # ideal r = 6
                        voxel = [dict_roi[i]['x'], dict_roi[i]['y'], dict_roi[i]['frame']]
                        # print(f"file: {temp_filename} <==> ROI {temp_ROIname}")
                        # print(f"==> length: {len(dict_roi)}, names: {roi_ID}, x: {voxel[0]}, y: {voxel[1]}, frames: {voxel[2]}, r: {radius}")
                        
                        # ===================== #Region create y(i) =====================
                        class_id, class_sign = self.parse_roi_id(roi_ID=roi_ID, shift_ID_value=self.num_fusion, label=self.label)
                         
                        if self.IVEA_Rad is not None:
                            if class_id is not None:
                                radius = self.IVEA_Rad
                                
                        if class_id is None:
                            if self.class_nolabel is not None:
                                class_id = self.class_nolabel
                                class_sign = class_id
                                radius = self.radius_nolabel
                            else:
                                continue
                            
                        # ===================== =====================
                        label_result = self.config_args.map_label_info(class_sign)
                        if label_result is None:
                           continue
                       
                        class_id, radius = label_result
                        var_radius = np.random.randint( max(6, radius - 2), radius + 3) # varying radius
                                # ===================== ===================== 
                                # ===================== #End ===================== 
                        # ===================== #End =====================
                        
                        mtrx_3d = self.get_timeseries_data(im_stack = im_stack, voxel = voxel,
                                                           timeseries = self.read_frames, rad = radius,
                                                           scale_radius=self.scale_radius_to, file_name = file, 
                                                           roi_file = roi_file, add_frames=self.more_frames)
                        
                        if self.augment_data:
                            temp_aug = self.temporal_augment_frames( mtrx_3d=mtrx_3d.copy(), lower_f=self.read_frames, add_frames=self.more_frames, min_frames=8)
                        
                        mtrx_3d = np.expand_dims(mtrx_3d, axis=0) 
                        
                        if self.augment_data:
                            mtrx_3d = np.concatenate((mtrx_3d, np.expand_dims(temp_aug, axis=0)), axis=0)
                        
                        if self.augment_data:
                            # if class_sign >= 0:    # and class_sign >= 0
                                # Augment positive classes [-2, 2] <<<<<<<<<<<<<<<<<<<<<< TODO: 
                                for offset in [-2, 2]:
                                    voxel2 = [voxel[0], voxel[1], voxel[2] + offset]
                                    tempSeries = self.get_timeseries_data(
                                        im_stack=im_stack, voxel=voxel2, timeseries=self.read_frames,
                                        rad=var_radius, scale_radius=self.scale_radius_to,
                                        file_name=file, roi_file=roi_file, add_frames=self.more_frames
                                    )
                                    tempSeries = self.rotate_image(tempSeries)
                                    mtrx_3d = np.concatenate((mtrx_3d, np.expand_dims(tempSeries, axis=0)), axis=0)
                            
                            # else:
                            #     tempSeries = self.get_timeseries_data(im_stack = im_stack, voxel = voxel,
                            #                                 timeseries = self.read_frames, rad = var_radius,
                            #                                 scale_radius=self.scale_image_rad, file_name = file,
                            #                                 roi_file = roi_file, add_frames=self.more_frames)
                            #     tempSeries = self.rotate_image(tempSeries)
                            #     mtrx_3d = np.concatenate((mtrx_3d, np.expand_dims(tempSeries, axis=0))  , axis=0)
                                

                        # Append data to x_train and y_train
                        for j in range(mtrx_3d.shape[0]):
                            x_sample = mtrx_3d[j, ...]
                            y_train_c = np.zeros(shape=(self.num_classes,), dtype=int)    
                            y_train_c[class_id] = 1
                            x_train.append(x_sample)
                            y_train.append(y_train_c)
                            
                            if self.debug:
                                if control_image_write < 50:
                                    # print(f"==>{control_image_write} {i}_{j} , less than 0: {class_id}, sign: {class_sign}, y: {y_train_c}, y_train: {y_train[-1]}")
                                    cname = os.path.join(
                                        self.outDir, f"Img_{roi_idx}_v{i}_e{j}, id{class_id}, s{class_sign}.tif"
                                    )
                                    imwrite(cname, np.squeeze(x_sample), dtype=np.float32)
                                control_image_write += 1
                                        
                    
                    break # break the inner loop when the file is already fetched
        
        if not self.combine_data:
            print(f">>> x_train.shape: {len(x_train)}, y_train.shape: {len(y_train)}") 
            x_train, y_train = self.check_and_append_memory_data(x_train=x_train,
                                              y_train=y_train, 
                                              x_name=self.x_name,
                                              y_name=self.y_name,
                                              model_path = self.trained_model_path.get(),
                                              memory_data_path=self.memory_data_path)
            
        x_train = np.array(x_train, dtype=np.float32)
        y_train = np.array(y_train, dtype=np.float32)
        
        if self.save_data:
            train_status = "new" if self.export_data else "comb"
            compact_name = (
                f"{self.outfile_name}_c{self.num_classes}r{self.IVEA_Rad}_sc{self.scale_radius_to}"
                f"_f{self.num_fusion}_t{self.read_frames * 2}_m{self.more_frames}_{train_status}"
            )
            new_dataset_path = self.get_unique_filename(self.outDir, compact_name)
            with h5py.File(new_dataset_path, 'w') as hf:
                hf.create_dataset(self.x_name, data=x_train, dtype='float32', chunks=True)
                hf.create_dataset(self.y_name, data=y_train, dtype='float32', chunks=True)
                # Save metadata as attributes at the root level
                hf.attrs['num_fusion'] = self.num_fusion
                hf.attrs['num_classes'] = self.num_classes
                hf.attrs['timeseries'] = self.timeseries
                hf.attrs['more_frames'] = self.more_frames
                hf.attrs['patch_radius'] = self.scale_radius_to
                hf.attrs['more_frames'] = self.more_frames
                
            print(f">>> x_train.shape: {len(x_train)}, y_train.shape: {len(y_train)}")
            
        self.cDataset_entry.delete(0, 'end')
        self.cDataset_entry.insert(0,new_dataset_path)
        self.dataset_last_path.set(new_dataset_path)
        self.save_preferences()
        print(">>> ============== complete =============== <<<")
        return x_train, y_train
    
    
    def combine_export(self):
        self.combine_data = True
        self.start_data_collection_thread()
    
    def start_training_thread(self):
        """
        This method creates and starts a separate thread 
        to run the 'train_model' method, 
        so the GUI stays responsive.
        """
        self.cancel_ = False
        # If there's an existing thread, you could optionally check or join it
        if self.training_thread and self.training_thread.is_alive():
            print("Currently active. Please wait until it is complete....")
            return

        # Create and start a new thread
        self.training_thread = threading.Thread(target=self.train_model, daemon=True)
        self.training_thread.start()
   
    def start_data_collection_thread(self):
        self.cancel_ = False
        # If there's an existing thread, you could optionally check or join it
        if self.training_thread and self.training_thread.is_alive():
            print("Currently active. Please wait until it is complete....")
            return

        self.training_thread = threading.Thread(target=self.export_data, daemon=True)
        self.training_thread.start()     
            
    def train_model(self):
        self.current_dataset = self.cDataset_entry.get()
        dataset_path = ""
        if self.current_dataset:
            dataset_path = self.current_dataset
        else:
            dataset_path = self.existing_dataset
        
        if not dataset_path:
            print("Please enter a valid dataset path to train the model on it")
            return
         
        train_data = self.load_train_data(dataset_path, self.x_name, self.y_name) # nFixed_FBEs_dataset.h5_c12_r16_new_2
        x_train = np.array(train_data[self.x_name])
        y_train = np.array(train_data[self.y_name]) 
        
        x_train = np.expand_dims(x_train, axis=-1) # add the channels dimension
        print(f">>> x_train: {x_train.shape}, y_train: {y_train.shape}")
        num_classes = y_train.shape[-1]
        # y_train = np.squeeze(y_train, axis=1) # one-hot encoder label
        # nSamples = x_train.shape[0]
        timeseries = x_train.shape[1]
        image_size = x_train.shape[2]
        num_channels = x_train.shape[-1]
        input_shape = (timeseries, image_size, image_size, num_channels)
        print(f">>> batch_size, timeseries, image_size, image_size, num_channels  [{x_train.shape}]")
        print(f">>> y_train  [{y_train.shape}, ex: {y_train[0]}]")
        
        trainer = eViTmodel(
            base_out_dir=self.outputDir,
            input_shape=input_shape, # (frames, w, h, c) 
            num_classes=num_classes, 
            dropout_rate=self.dropout_rate,
            learning_rate=self.learning_rate,
            patience=self.call_patience,
            batch_size=self.batch_size,
            max_epochs=self.epoch_num,
            params = self.params
        )
        
        trainer.initialize_model(
            new_training=self.new_training, 
            existing_model_path=self.trained_model_path.get()
        )

        if not self.new_training:
            self.params["model_name"] = self.selected_trained_model_name.get() # model_type
            self.params["model_type"] = self.model_type
            trainer.refine_existing_class(
                freeze_backbone=True,
                unfreeze_transformer2=False, # Unfreeze the 2nd Transformer layer
                out_dir_tag="_refine",
                batch_size = self.batch_size,
                epoch=self.epoch_num
            )
            
        trainer.train_model(x_train, y_train)
        
        return None


    def parse_channel_string(self, channel_string):
        channel_value = channel_string.get()
        split_numbers = channel_value.split("-")
        if len(split_numbers) == 1:
            return [0, 0]
        else:
            num1 = int(split_numbers[0])
            num2 = int(split_numbers[1])

            if num1 == 0 or num2 == 0:
                return [0, 0]
            else:
                return [num1, num2]
  
    
    def get_files(self, path, extensions):
        files = []
        names = []
        if isinstance(extensions, str):
            extensions = [extensions]  # Convert single extension string to list
        
        # Recursively search through directories and subdirectories
        for root, _, filenames in os.walk(path):
            for file in filenames:
                for ext in extensions:
                    if file.endswith(ext):
                        files.append(os.path.join(root, file))
                        names.append(os.path.splitext(file)[0])  # Get the file name without extension
                        break
        
        return files, names
    
    
    def check_values(self, field, value):
        field_value = field.get()
        x = value
        if field_value is not None:
            try:
                x = float(field_value)
            except ValueError:
                print(">>> Error: Invalid diameter value")
        return x
    
    def parse_roi_id(self, roi_ID, shift_ID_value, label):
        temp = roi_ID.split(label)
        if len(temp) > 1:
            last_part = temp[-1]
            try:
                integer_value = int(last_part)
                if integer_value >= 0:
                    return integer_value, integer_value
                else:
                    # add the class ID as fusion + non fusion
                    return np.abs(integer_value) + shift_ID_value -1, integer_value

            except ValueError:
                return None, None
        else:
            return None, None
        
    # ==================== End ====================

    # ==================== #Region Progress Bar ====================
    def pro_window(self):
        self.window_status = tk.Tk()
        self.window_status.geometry("240x120")
        self.window_status.resizable(False, False)
        self.window_status.title("Progress Bar")
        self.progressbar = ttk.Progressbar(self.window_status, length=180, mode='determinate')
        self.progressbar.pack(pady=10)
        self.progress_label = tk.Label(self.window_status, text="Progress: 0%")
        self.progress_label.pack(pady=1)
        self.cancel_button = ttk.Button(self.window_status, text="Cancel", command=self.cancel_progress_bar)
        self.cancel_button.pack(pady=5)
        pass

    def cancel_progress_bar(self):
        self.window_status
        self.cancel = True
        self.window_status.destroy()

    def update_progress(self, progress):
        self.progressbar['value'] = progress
        if progress == 100:
            self.progress_label.config(text="Progress completed.")
            self.cancel_button.config(text="Done")
        else:
            self.progress_label.config(text="Progress: {}%".format(progress))
            self.window_status.update()

    # ==================== #Region Get time series data ====================
    def get_timeseries_data(self, im_stack, voxel, timeseries, rad, scale_radius, file_name, roi_file, add_frames=0):
        limit_radius = scale_radius > 0
        Cy = voxel[0]  # Cx in ImageJ is Cy in Python 
        Cx = voxel[1]  # Cy in ImageJ is Cx in Python 
        frame = voxel[2]
        kernel = rad * 2
        if limit_radius:
            kernel_scale = scale_radius * 2
        else:
            kernel_scale = kernel

        # Define frames before and after
        lower_f = timeseries
        upper_f = timeseries + add_frames  # Add additional frames after

        # Total number of frames = lower_f (before) + upper_f (after)
        total_frames = lower_f + upper_f

        dim = (total_frames, kernel_scale, kernel_scale)
        mtrx_3d = np.zeros(dim, dtype=np.float32)

        # Adjust frame index so that we don't go out of bounds
        # if frame < lower_f:
        #     frame = lower_f
        # elif frame >= im_stack.shape[0] - upper_f:
        #     frame = im_stack.shape[0] - upper_f

        # Extract frames from (frame - lower_f) to (frame + upper_f - 1)
        start_frame = frame - lower_f
        end_frame = frame + upper_f

        for idx, i in enumerate(range(start_frame, end_frame)):
            temp = np.zeros((kernel, kernel), dtype=np.float32)
            # Calculate the start and end indices for cropping
            if 0 <= i < im_stack.shape[0]:
                im_x_start = int(max(0, Cx - rad))
                im_x_end = int(min(im_stack.shape[1], Cx + rad))
                im_y_start = int(max(0, Cy - rad))
                im_y_end = int(min(im_stack.shape[2], Cy + rad))

                # Calculate cropping within temp
                crop_x_start = int(max(0, rad - Cx))
                crop_x_end = crop_x_start + (im_x_end - im_x_start)
                crop_y_start = int(max(0, rad - Cy))
                crop_y_end = crop_y_start + (im_y_end - im_y_start)

                if crop_x_start < crop_x_end and crop_y_start < crop_y_end:
                    temp[crop_x_start:crop_x_end, crop_y_start:crop_y_end] = im_stack[i, im_x_start:im_x_end, im_y_start:im_y_end]
                else:
                    # Handle the case where the cropping region is empty
                    print(f">>> Skipping {file_name}, voxel:({voxel}) -- im_stack({im_x_start}, {im_x_end}, {im_y_start}, {im_y_end}) -- "
                        f"temp({crop_x_start}, {crop_x_end}, {crop_y_start}, {crop_y_end}) im_stack dim({im_stack.shape[0]}, {im_stack.shape[1]}, {im_stack.shape[2]})")
                    print(f">>> at roi file {roi_file} <<<")
                    return None

                # If the limit_radius condition is met and rad != scale_radius, resize
            if limit_radius and rad != scale_radius:
                temp = resize(temp, (kernel_scale, kernel_scale), order=1, mode='constant', anti_aliasing=False)

            mtrx_3d[idx] = temp

        return mtrx_3d


    def temporal_augment_frames(self, mtrx_3d, lower_f, add_frames, min_frames=5):
        """
        Randomly crops frames from the start or the end, replacing them with zeros, 
        while ensuring that at least `min_frames` before and after the event frame remain.
        
        Args:
            mtrx_3d (np.ndarray): The timeseries data of shape (total_frames, H, W).
            lower_f (int): Number of frames before the event frame.
            upper_f (int): Number of frames after the event frame.
            min_frames (int): Minimum frames to keep before and after the event frame.
            
        Returns:
            np.ndarray: The augmented mtrx_3d with some frames zeroed out.
        """
        upper_f = lower_f + add_frames
        # Validate inputs
        total_frames = mtrx_3d.shape[0]
        if lower_f + upper_f != total_frames:
            raise ValueError("The sum of `lower_f` and `upper_f` must equal the number of frames in `mtrx_3d`.")

        if min_frames > lower_f or min_frames > upper_f:
            raise ValueError("`min_frames` must be less than or equal to both `lower_f` and `upper_f`.")

        # Determine maximum frames we can remove
        max_remove_before = max(0, lower_f - min_frames)
        max_remove_after = max(0, upper_f - min_frames)

        # Randomly choose whether to crop from before or after
        crop_from_before = random.choice([True, False])

        if crop_from_before and max_remove_before > 0:
            # Remove frames from the start
            frames_to_remove = random.randint(1, max_remove_before)
            mtrx_3d[:frames_to_remove] = 0.0
        elif not crop_from_before and max_remove_after > 0:
            # Remove frames from the end
            frames_to_remove = random.randint(1, max_remove_after)
            mtrx_3d[-frames_to_remove:] = 0.0

        return mtrx_3d

    def extract_features(self, matrix_3d, mask, n_regions, timeseries):
        regions = np.zeros((n_regions, timeseries))
        e_mask = np.expand_dims(mask, axis=2)
        e_mask = np.tile(e_mask, (1, 1, timeseries))
        e_mask_T = np.transpose(e_mask, (2, 0, 1))
        for i in range(n_regions):
            label_mask = (e_mask_T == i+1)
            masked_matrix = matrix_3d * label_mask
            # Compute mean only for non-zero pixels
            sum_values = np.sum(masked_matrix, axis=(1, 2))
            count_values = np.count_nonzero(masked_matrix, axis=(1, 2))
            means_per_z = np.where(count_values > 0, sum_values / count_values, 0)  # Avoid division by zero
            
            regions[i] = means_per_z

        mx = np.max(regions) #TODO: turn on/off normalization
        mn = np.min(regions)
        regions = (regions - mn) / (mx - mn)
        return regions

    def flatten_array(self, regions, n_regions, timeseries):
        timeseries, n_regions = regions.shape
        # Reshape the regions array to (timeseries, 1, n_regions)
        reshaped_array = regions.reshape(timeseries, 1, n_regions)
        # Stack the reshaped array along the second axis to create regions
        regions = reshaped_array.repeat(n_regions, axis=1)
        flattened_regions = regions.flatten()

        return flattened_regions

    def load_train_data(self, file_path, x_name, y_name):
        """
        Loads data from an h5py file and returns a dictionary containing x and y data.
        Args:
            file_path (str): Path to the h5py file.
            x_name (str): Name of the dataset containing x data.
            y_name (str): Name of the dataset containing y data.

        Returns:
            dict: A dictionary containing the loaded data.
        """
        with h5py.File(file_path, "r") as hf:
            data = {"x_train": hf[x_name][:], "y_train": hf[y_name][:]}

        return data
    
    
    def get_unique_filename(self, outDir, filename):
        """
        Get a unique filename by appending a counter if the filename already exists.
        
        Returns:
        - full_path (str): Full path to the unique filename.
        """
        counter = 0
        name, ext = os.path.splitext(filename)
        ext = ext or ".h5"  # Ensure the extension defaults to .h5 if not provided
        
        while True:
            if counter == 0:
                full_filename = f"{name}{ext}"  # No counter for the first attempt
            else:
                full_filename = f"{name}_{counter}{ext}"
            full_path = os.path.join(outDir, full_filename)
            
            if not os.path.exists(full_path):
                return full_path
            else:
                counter += 1
    
    
    def rotate_image(self, mtrx_3d):
        """Rotate each frame in mtrx_3d by the same angle theta."""
        theta = np.random.randint(1, 4)
        rotated_image = np.rot90(mtrx_3d, k=theta, axes=(1, 2))  # Rotate all frames simultaneously
        return rotated_image
    
    
    def force_dark_title_bar(self, window_id):
        try:
            hwnd = ctypes.windll.user32.GetParent(window_id)  # Get window handle
            ctypes.windll.dwmapi.DwmSetWindowAttribute(hwnd, 20, ctypes.byref(ctypes.c_int(1)), ctypes.sizeof(ctypes.c_int))
        except Exception as e:
            print(f"Could not apply dark title bar: {e}")
    
    def check_dir_path(self, dir_path):
        if dir_path == "" or not os.path.isdir(dir_path):
            dir_path = os.path.join(os.getcwd(), "output")
            os.makedirs(dir_path, exist_ok=True)
        return dir_path
            
    
    def get_model_type(self, model_path):
        """
        Reads model_config.json and returns:
          1 if model_type is 'stationary',
          0 if model_type is 'random',
         -1 otherwise.
        """
        config_path = os.path.join(model_path, 'model_config.json')
        # Check if the config file exists
        if not os.path.isfile(config_path):
            raise FileNotFoundError(f"'{config_path}' not found.")

        # Read the JSON file
        with open(config_path, 'r') as file:
            config = json.load(file)

        # Verify and return the corresponding value
        self.model_type = config.get('model_type')
        if self.model_type == 'stationary':
            self.load_config_file(self.neuro_config_file_path)
            self.memory_data_path= self.memory_dataset_neurons
            return 1
        elif self.model_type == 'random':
            self.load_config_file(self.granu_config_file_path)
            self.memory_data_path= self.memory_dataset_random
            return 0
        else:
            self.load_config_file(self.default_config_file_path)
            # print(f">>> Warning Invalid 'model_type': {self.model_type}. "
            #       f"Expected 'stationary' or 'random' <<<")
            return -1
    

    def check_and_append_memory_data(self, 
                                    x_train, 
                                    y_train, 
                                    model_path, 
                                    x_name="x_train", y_name="y_train",
                                    memory_data_path = "data/memory/CTL-CC-INS1_memory_c11.h5"):
        """
        Checks the model type based on model_path. Loads an appropriate memory_data.h5
        file (depending on the model type). For each class, if the current user-labeled 
        sample count is below the memory_datas sample count, appends enough samples 
        from memory_data to match it.

        Returns:
            updated x_train, updated y_train after possible appends.
        """
        if not model_path:
            return x_train, y_train

        # print(f">>> model type {model_type}, x.shape {len(x_train)}, y.shape {len(y_train)}")
        # print(f">>> model path {model_path}")
         
        memory_data = self.load_train_data(memory_data_path, x_name, y_name)
        memory_x = memory_data[x_name]
        memory_y = memory_data[y_name]

        x_train = np.asarray(x_train)
        y_train = np.asarray(y_train)

        num_classes = memory_y.shape[1]

        for c in range(num_classes):
            user_class_count = np.sum(y_train[:, c] == 1)
            memory_class_indices = np.where(memory_y[:, c] == 1)[0]
            memory_class_count = len(memory_class_indices)

            if user_class_count < memory_class_count:
                needed = memory_class_count - user_class_count
                chosen_indices = memory_class_indices[:needed]

                x_to_append = memory_x[chosen_indices]
                y_to_append = memory_y[chosen_indices]

                x_train = np.concatenate([x_train, x_to_append], axis=0)
                y_train = np.concatenate([y_train, y_to_append], axis=0)


        return x_train, y_train


    # ============================== models update region ==============================
    def ensure_directories_exist(self):
        """
        Ensures that ./settings and ./data/models directories exist.
        If they don't, creates them.
        """
        # Get the directory of this Python file
        project_root = os.path.dirname(os.path.abspath(__file__))
        
        # settings directory
        settings_dir = os.path.join(project_root, "settings")
        os.makedirs(settings_dir, exist_ok=True)

        # data/models directory
        data_dir = os.path.join(project_root, "data")
        models_dir = os.path.join(data_dir, "models")
        os.makedirs(models_dir, exist_ok=True)
        
        return project_root, settings_dir, models_dir

    # ------------------------------------------------------------------
    # Loading & Saving Preferences
    # ------------------------------------------------------------------
    def load_preferences(self):
        """
        Loads preferences from ./settings/IVEA_preference.json (if it exists)
        and stores the result in self.preferences (a dict).
        """
        project_root, settings_dir, _ = self.ensure_directories_exist()
        pref_file = os.path.join(settings_dir, "IVEA_preference.json")
        
        if os.path.isfile(pref_file):
            try:
                with open(pref_file, "r", encoding="utf-8") as f:
                    self.preferences = json.load(f)
            except Exception as e:
                print(f"Error loading preferences: {e}")
                self.preferences = {}
        else:
            self.preferences = {}

    def save_preferences(self):
        """
        Saves current selection to ./settings/IVEA_preference.json:
          - trained_model_path
          - selected_trained_model_name
          - new_training
        """
        project_root, settings_dir, _ = self.ensure_directories_exist()
        pref_file = os.path.join(settings_dir, "IVEA_preference.json")

        # Update relevant info in self.preferences
        self.preferences["trained_model_path"] = self.trained_model_path.get()
        self.preferences["selected_trained_model_name"] = self.selected_trained_model_name.get()
        self.preferences["new_training"] = self.new_training 
        self.preferences["inputDir_last_path"] = self.inputDir_last_path.get()
        self.preferences["dataset_last_path"] = self.dataset_last_path.get()
        
        try:
            with open(pref_file, "w", encoding="utf-8") as f:
                json.dump(self.preferences, f, indent=4)
        except Exception as e:
            print(f"Error saving preferences: {e}")

    # ------------------------------------------------------------------
    # Model Combobox Management
    # ------------------------------------------------------------------
    def populate_model_list(self):
        """
        Reads model_config.json in each subdirectory of ./data/models,
        extracts the "model_name" field, and populates the Combobox with:
        
        1) "Train new model"  (maps to None)
        2) discovered "model_name" from each subdir’s model_config.json
        """
        _, _, models_dir = self.ensure_directories_exist()

        # Start with the special option
        model_options = ["Train new model"]
        self.model_map.clear()  
        self.model_map["Train new model"] = None
        
        # Iterate over the directories in models_dir
        if os.path.isdir(models_dir):
            for item in os.listdir(models_dir):
                full_path = os.path.join(models_dir, item)
                if not os.path.isdir(full_path):
                    continue  # skip files, only look at directories

                config_path = os.path.join(full_path, "model_config.json")
                if not os.path.isfile(config_path):
                    continue  # skip if no config file

                # Load model_config.json
                try:
                    with open(config_path, "r", encoding="utf-8") as file:
                        config = json.load(file)
                except Exception as e:
                    print(f"Error reading {config_path}: {e}")
                    continue

                # Get the model_name from JSON
                model_name = config.get("model_name", os.path.basename(full_path))
                # You could also call get_model_type(full_path) if needed:
                #   model_type_idx = self.get_model_type(full_path)
                #   # use it if you want logic based on the model_type
                
                # Add to combobox list
                model_options.append(model_name)
                # Map the displayed name to the actual directory path
                self.model_map[model_name] = full_path

        # Populate Combobox with model names
        self.model_combobox["values"] = model_options

    def restor_intial_pref(self):
        self.inputDir_last_path.set(self.preferences.get("inputDir_last_path", ""))
        self.dataset_last_path.set(self.preferences.get("dataset_last_path", ""))
        pass
    
    def restore_last_selected_model(self):
        """
        Once we have the combobox populated and preferences loaded,
        decide which item in the combobox should be selected by default.
        """
        saved_model_path = self.preferences.get("trained_model_path", "")
        saved_model_name = self.preferences.get("selected_trained_model_name", "")
        saved_new_training = self.preferences.get("new_training", False)

        if saved_new_training:
            # The user last selected "Train new model"
            self.model_combobox.current(0)  # index 0 => "Train new model"
            self.new_training = True
            self.trained_model_path.set("")
            self.selected_trained_model_name.set("Train new model")
            return

        # If we have a saved model_name, see if it's still in the map
        if saved_model_name in self.model_map:
            # Select that item
            idx = list(self.model_map.keys()).index(saved_model_name)
            self.model_combobox.current(idx)
            self.trained_model_path.set(self.model_map[saved_model_name])
            self.selected_trained_model_name.set(saved_model_name)
            self.new_training = False
        else:
            # If not found, default to "Train new model"
            self.model_combobox.current(0)
            self.new_training = True
            self.trained_model_path.set("")
            self.selected_trained_model_name.set("Train new model")

    def on_model_selection(self, event):
        """
        When a user selects an item in the Combobox:
         - If it's "Train new model", set `self.new_training = True`.
         - Otherwise, set `self.new_training = False` and store the path + name.
         - Save preferences so it’s remembered next time.
        """
        self.check_last_model_selection()
            
        # Save user preference to JSON
        self.save_preferences()
        
        
    def check_last_model_selection(self):
        selected_name = self.model_combobox.get()
        if selected_name == "Train new model":
            self.new_training = True
            self.trained_model_path.set("")
            self.selected_trained_model_name.set("Train new model")
            self.load_config_file(self.default_config_file_path)
        else:
            self.new_training = False
            self.trained_model_path.set(self.model_map[selected_name])  
            self.selected_trained_model_name.set(selected_name)
            self.model_type = self.get_model_type(self.model_map[selected_name])
        

    def load_config_file(self, config_file_path):
        self.config_args = config_mapper.read_config(config_file_path)
        self.epoch_num = self.config_args.epoch_num
        self.batch_size = self.config_args.batch_size 
        self.dropout_rate = self.config_args.dropout_rate
        self.call_patience = self.config_args.call_patience
        self.learning_rate = self.config_args.learning_rate
        self.existing_dataset = self.config_args.dataset_path
        self.IVEA_Rad = self.config_args.patch_size
        self.num_augmentation = self.config_args.num_augmentation
        self.augment_data = self.config_args.augment_data
        self.label = self.config_args.class_tag
        self.zip_file_label = self.config_args.roi_file_tag
        self.outfile_name = self.config_args.outfile_dataset_name
        self.model_tag_name = "eViT_"+self.config_args.model_type
        self.model_type = self.config_args.model_type
        self.model_name = self.config_args.model_name
        self.num_fusion = len(self.config_args.positive_classes) # get class count
        self.num_randomClasses = len(self.config_args.negative_classes) # get class count
        self.timeseries = self.config_args.timeseries
        self.more_frames = self.config_args.more_frames
        self.class_nolabel = self.config_args.class_nolabel 
        self.radius_nolabel = self.config_args.radius_nolabel 
        self.fileExtension = self.config_args.file_extension
        self.save_data = self.config_args.save_data
        self.scale_radius_to = self.config_args.scale_radius_to # 16 static, resize patch to this value
        self.outputDir = self.check_dir_path(self.config_args.output_dir)
        print(f">>> Configuration is now set to {config_file_path}")
        # self.trained_model_path = self.config_args.existing_model
    
    def get_last_directory_name(self, dir_path):
        normalized_path = os.path.normpath(dir_path)
        return os.path.basename(normalized_path)

# ==================== #End ====================
if __name__ == "__main__":
    parent = tk.Tk()
    color_hex_bg = "#181818"
    parent.configure(background=color_hex_bg)
    app = IVEA_main(parent)
    parent.mainloop()
