import tensorflow as tf
import numpy as np
import tensorflow_addons as tfa

class DataAugmentor:
    def __init__(self):
        pass

    def rotate_image(self, img, theta):
        return np.rot90(img, k=theta)

    def add_noise(self, img):
        noise = np.random.poisson(lam=0.1, size=img.shape).astype(np.float32)
        mean = np.mean(img)*0.5
        # min_noise = 0.2
        # max_noise = 0.8
        # noise = min_noise + (max_noise - min_noise) * (noise / np.max(noise))
        noise = noise * mean
        return noise + img

    def apply_filter(self, img, sigma_):
        
        img = tfa.image.gaussian_filter2d(img, filter_shape=(3, 3), sigma=sigma_) # check this one 
        return img

    def augment_data(self, mtrx_3d, num_augs=3):
        augmented_matrices = []

        for _ in range(num_augs):
            augmented_img = []
            theta = np.random.randint(0, 4)
            sigma_ = np.random.randint(4, 9)/ 10.0
            skip = np.random.randint(1,7) 
            for frame in mtrx_3d:
                augmented_frame = self.rotate_image(frame, theta)
                if skip == 1:
                    augmented_frame = self.add_noise(augmented_frame)
                elif skip == 2:
                    augmented_frame = self.apply_filter(augmented_frame, sigma_)
                    
                augmented_img.append(augmented_frame)
            augmented_matrices.append(np.stack(augmented_img, axis=0))

        return np.stack(augmented_matrices, axis=0)

# augmentor = DataAugmentor()
# augmented_data = augmentor.augment_data(mtrx_3d, num_augs=5)
# 'augmented_data' now contains the augmented matrices with shape (5, timeseries, height, width)
