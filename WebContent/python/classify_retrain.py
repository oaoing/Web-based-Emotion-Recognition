from keras.models import load_model
import numpy as np
import cv2
import datetime
import sys
import os
from keras.utils import to_categorical
import test

labels = ['Angry', 'Disgust', 'Fear', 'Happy', 'Sad', 'Surprise', 'Neutral']

def record_feedback(pixel, feedback, label, path):
    filename = path + "/feedback.csv"
    if os.path.isfile(filename):
        f = open(filename, 'a')
    else:
        f = open(filename, 'w')

    line = pixel + "," + feedback + "," + label + "\n"
    f.write(line)
    f.close()

def load_image(path, isthatpic):
    if isthatpic:
        image = np.asarray([cv2.cvtColor(cv2.imread(path), cv2.COLOR_BGR2GRAY)])
        image = image.reshape(image.shape[0], image.shape[1], image.shape[2], 1)
    else:
        image = np.asarray([cv2.imread(path)])

    image = image / 255.

    return image

def retrain(path, feedback, label, model_path, model_name):
    epochs = 1
    batch_size = 1

    x_train = load_image(path)
    pixel = [str(p) for p in x_train[0]]
    record_feedback(' '.join(pixel), feedback, label, model_path)
    model = load_model(model_path + '/model_default53.h5')
    ori = test.testing(model_path + '/model_default53.h5', model_path)
    y_train = [0., 0., 0., 0., 0., 0., 0.]
    y_train[labels.index(label)] = 1.
    y_train = np.asarray([y_train], dtype=np.float32)
    model.fit(x_train, y_train, batch_size, epochs, verbose=0)
    model.save(model_path + './tmp.h5')
    new = test.testing(model_path + './tmp.h5', model_path)

    if ori >= new:
        print("model_default:", ori)
        print("tmp:", new)
        os.system('del ' + model_path + './tmp.h5')
    elif new > ori:
        print("model_default:", ori)
        print("tmp:", new)
        os.system('del ' + model_path + model_name)
        os.system('ren ' + model_path + './tmp.h5 ' + model_path + model_name)


def classify(path, model_path, isthatpic):
    classify_image = load_image(path, isthatpic)
    if isthatpic:
        model = load_model(model_path + '/model_default.h5')
        test_predictions = np.round(model.predict(classify_image))
        test_predictions = test_predictions.tolist()
        print(labels[test_predictions[0].index(1.0)])
    else:
        model = load_model(model_path + '/model_default_emoticon.h5')
        test_predictions = np.round(model.predict(classify_image))
        test_predictions = test_predictions.tolist()
        print(labels[test_predictions[0].index(1.0)])

if __name__ =='__main__':   # python classify_retrain.py image_path feed_back label
    isthatpic = True
    if len(sys.argv) == 3:
        classify(sys.argv[1], sys.argv[2])
    elif len(sys.argv) > 3:
        retrain(sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4], '/model_default53.h5')