import os
from read_roi import read_roi_zip, read_roi_file  # pip install read-roi
 
class imagej_rois:
    @staticmethod  
    def get_roi_info(roi_name, roi_data):
        """
        Returns:
        - roi_info (dict): Dictionary containing ROI information.
        """
        x_center = roi_data['left'] + roi_data['width'] / 2
        y_center = roi_data['top'] + roi_data['height'] / 2
        roi_radius = roi_data['width'] /2
        roi_frame = roi_data.get('position', 0)
        roi_info = {
            'name': roi_name,
            'x': x_center,
            'y': y_center,
            'r': roi_radius,
            'frame': roi_frame
        }
        return roi_info

    @staticmethod
    def read_rois(path):
        """
        Parameters:
        - path (str): Path to the ROI file (.roi or .zip).
        Returns:
        - roi_info (list): List of dictionaries containing ROIs info.
        """
        roi_info = []

        if path.endswith('.zip'):
            rois = read_roi_zip(path) # read roi zip
            for roi_name, roi_data in rois.items():
                roi_info.append(imagej_rois.get_roi_info(roi_name, roi_data))
        elif path.endswith('.roi'):
            rois = read_roi_file(path) # read roi file
            for roi_name, roi_data in rois.items():
                roi_info.append(imagej_rois.get_roi_info(roi_name, roi_data))
        else:
            print("Error: check file format either .roi or .zip file.")

        return roi_info


# path_to_roi = "E:\\ASAP Analysis\\T-Cells\\Training_videos_ROIs\\GT-Movie-01-SLB-GzmB phuji561-TC02.zip"
# # imagej_roi = read_imagej_rois()
# roi_data = imagej_rois.read_rois(path_to_roi)
# print(f"length: {len(roi_data)}, names: {roi_data[0]['name']}, x: {roi_data[0]['x']}, y: {roi_data[0]['y']}, frames: {roi_data[0]['frame']}")
# print(roi_data)

