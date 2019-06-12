from keras.models import load_model
import glob
import numpy as np
import cv2
import os.path
from sklearn.metrics import accuracy_score
from keras.utils import to_categorical

def load_test_image(path):
    file_paths = glob.glob(os.path.join(path, '*.jpg'))
    images = [cv2.cvtColor(cv2.imread(path), cv2.COLOR_BGR2GRAY) for path in file_paths]
    images = np.asarray(images)
    images = images.reshape(images.shape[0], images.shape[1], images.shape[2], 1)
    image_size = (images.shape[1], images.shape[2], images.shape[3])
    images = images / 255.
    labels = np.zeros(images.shape[0])
    for i in range(images.shape[0]):
        filename = os.path.basename(file_paths[i])[0]
        labels[i] = int(filename[0])

    return images, labels, image_size


def testing(model_path, path):
    x_test, y_test, _ = load_test_image(path + '/PublicTest')
    model = load_model(model_path)

    test_predictions = np.round(model.predict(x_test))      # round 는 소수점 포함 반올림 함수, predict는 예측값
    y_test = to_categorical(y_test)
    accuracy = accuracy_score(y_test, test_predictions)
    print("Accuracy: " + str(accuracy))

    return accuracy

if __name__ == "__main__":
    testing('./model_default.h5', './')
