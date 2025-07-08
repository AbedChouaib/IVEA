import json

class read_config:
    def __init__(self, config_file_path):
        # Initialize with a configuration file path
        self.config_file_path = config_file_path
        self.config = None
        self.patch_size = None
        self.augment_data = False  # Default value if not specified
        self.num_augmentation = 0  # Default value if not specified
        self.class_tag = ""
        self.roi_file_tag = ""
        self.file_extension = ""
        self.timeseries = 0
        self.more_frames = 0
        self.outfile_dataset_name = ""
        self.model_type = ""
        self.class_info = {}
        self.num_positive_classes = 0
        self.positive_classes = set()
        self.negative_classes = set()
        self.save_data = True  # Save .h5 data
        self.epoch_num = 100
        self.batch_size = 80
        self.dropout_rate = 0.0
        self.call_patience = 5
        self.learning_rate = 0.0001
        self.model_name = ""
        self.dataset_path = ""
        self.output_dir = ""
        # self.existing_model = ""
        self.scale_radius_to = 16
        self.load_config()
        self.process_classes()  # Added this line to process classes during initialization

    def load_config(self):
        with open(self.config_file_path, 'r') as file:
            self.config = json.load(file)
        
        self.patch_size = self.config.get('default_radius', None)
        self.augment_data = self.config.get('augment_data', False)
        self.num_augmentation = self.config.get('num_augmentation', 0)
        self.class_tag = self.config.get('class_tag', "")
        self.roi_file_tag = self.config.get('roi_file_tag', "")
        self.file_extension = self.config.get('file_extension', "")
        self.timeseries = self.config.get('timeseries', 0)
        self.more_frames = self.config.get('more_frames', 0)
        self.outfile_dataset_name = self.config.get('outfile_dataset_name', "")
        self.model_type = self.config.get('model_type', "")
        self.model_name = self.config.get('model_name', "")
        self.class_nolabel = self.config.get('class_nolabel', 0)
        self.radius_nolabel = self.config.get('radius_nolabel', 0)
        self.save_data = self.config.get('save_data', True)
        self.epoch_num = self.config.get('epoch_num', 100)
        self.batch_size = self.config.get('batch_size', 80)
        self.dropout_rate = self.config.get('dropout_rate', 0.0)
        self.call_patience = self.config.get('call_patience', 5)
        self.learning_rate = self.config.get('learning_rate', 0.0001)
        self.dataset_path = self.config.get('dataset_path', "")
        self.scale_radius_to = self.config.get('scale_radius_to', 16)
        self.output_dir = self.config.get('output_dir', "")
        # self.existing_model = self.config.get('existing_model', "")
        
    def process_classes(self):
        """
        Pre-process the classes_map to store class entries and handle positive/negative classes.
        """
        classes_map = self.config.get('classes_map', [])  # Changed self.args to self.config

        for class_entry in classes_map:
            class_labels = class_entry.get('class_label', [])
            class_id = class_entry.get('class_id')
            radius = class_entry.get('radius', None)

            if radius is None:
                radius = self.patch_size

            # Store the class information in a dictionary for quick access
            for label in class_labels:
                self.class_info[label] = {'class_id': class_id, 'radius': radius}
            
            if class_id >= 0:
                self.positive_classes.add(class_id)
            else:
                self.negative_classes.add(class_id)

        self.num_positive_classes = len(self.positive_classes)  # Count of positive classes
        self.adjust_negative_class_ids()  # Adjust negative class IDs

    def adjust_negative_class_ids(self):
        """
        Adjust the negative class IDs using the formula:
        adjusted_class_id = abs(class_id) + (number of positive classes) - 1.
        """
        adjustment = self.num_positive_classes - 1
        for label, info in self.class_info.items():
            class_id = info['class_id']
            if class_id < 0:
                adjusted_class_id = abs(class_id) + adjustment
                self.class_info[label]['class_id'] = adjusted_class_id

    def map_label_info(self, label):
        """
        Map the given label to its class_id and radius.
        Returns a tuple (class_id, radius).
        If the label is not found, returns None.
        """
        if label in self.class_info:
            return self.class_info[label]['class_id'], self.class_info[label]['radius']
        return None

# Test code
# if __name__ == "__main__":
#     config_file_path = 'ivea_config_cd63.json'
#     config_mapper = read_config(config_file_path)
        
#     test_labels = [0, 1, 8, 7, 33, -1, -2, -3, -99] 
#     for label in test_labels:
#         result = config_mapper.map_label_info(label)
#         if result:
#             class_id, radius = result
#             print(f"Label {label} -> class_id: {class_id}, radius: {radius}")
#         else:
#             print(f"Label {label} not found")
