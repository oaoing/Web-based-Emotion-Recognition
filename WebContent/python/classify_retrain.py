from keras.models import load_model
import numpy as np
import cv2
import datetime
import sys
import os
from keras.utils import to_categorical
import test
import datetime

labels = ['Angry', 'Disgust', 'Fear', 'Happy', 'Sad', 'Surprise', 'Neutral']

def record_feedback(pixel, feedback, label, date, path, isthatpic):
    filename = path
    if os.path.isfile(filename):
        f = open(filename, 'a')
    else:
        f = open(filename, 'w')
	
    if isthatpic:
        line = pixel + "," + feedback + "," + label +"," + date+ "\n"
    else:
        line = pixel[0] + "," + pixel[1] + "," + pixel[2] + "," + feedback + "," + label + "," + date+"\n"
    f.write(line)
    f.close()

def load_image(path, isthatpic):
    if isthatpic:
        image = np.asarray([cv2.cvtColor(cv2.imread(path), cv2.COLOR_BGR2GRAY)])
        pixel = ""
        for i in image[0]:
            for j in i:
                pixel += str(j) + " "
        image = image.reshape(image.shape[0], image.shape[1], image.shape[2], 1)

    else:
        image = np.asarray([cv2.imread(path)])
        pixel = ["", "", ""]
        for i in image[0]:
            for j in i:
                pixel[0] += str(j[2]) + " "
                pixel[1] += str(j[1]) + " "
                pixel[2] += str(j[0]) + " "

    image = image / 255.

    return image, pixel

def retrain(path, feedback, label, model_path, isthatpic):
    epochs = 1
    batch_size = 1

    if isthatpic:
        model_name = "\\model_default_resnet_v1.h5"
    else:
        model_name = "\\model_default_emoticon.h5"
    date = datetime.datetime.now().strftime("%y%m%d_%H%M%S")
    x_train, pixel = load_image(path, isthatpic)
    y_train = [0., 0., 0., 0., 0., 0., 0.]
    y_train[labels.index(label)] = 1.
    y_train = np.asarray([y_train], dtype=np.float32)
    model = load_model(model_path + model_name)
    if isthatpic:
        if not os.path.isdir(model_path + "/pic_model"):
            os.mkdir(model_path + "/pic_model")
        record_feedback(pixel, feedback, label, date, model_path + "/pic_feed.csv", isthatpic)
        ori = test.testing(model_path + model_name, model_path)
        model.fit(x_train, y_train, batch_size, epochs, verbose=0)
        new_model = "\\model_" + date
        model.save(model_path + new_model + ".h5")
        new = test.testing(model_path + new_model + ".h5", model_path)
        if new > ori:
            os.system('move ' + model_path + model_name + " " + model_path + "\\pic_model" + new_model + "_improve.h5")
            os.system('move ' + model_path + "\\pic_model" + new_model + ".h5 " + model_path + model_name)
        else:
            os.system('move ' + model_path + new_model + ".h5 " + model_path + "\\pic_model" + new_model + ".h5")

    else:
        if not os.path.isdir(model_path + "/paint_model"):
            os.mkdir(model_path + "/paint_model")
        record_feedback(pixel, feedback, label, date, model_path + "/paint_feed.csv", isthatpic)
        model.fit(x_train, y_train, batch_size, epochs, verbose=0)
        new_model = "/model_emoticon_" + date + ".h5"
        os.system('move ' + model_path + model_name + " " + model_path + "/paint_model/" + new_model)
        print('move ' + model_path + model_name + " " + model_path + "/paint_model/" + new_model)
        model.save(model_path + model_name)


def classify(path, model_path, isthatpic):
    classify_image, _ = load_image(path, isthatpic)
    if isthatpic:
        model = load_model(model_path + '/model_default_resnet_v1.h5')
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
    if sys.argv[-1] == "no":
        isthatpic = False
    if len(sys.argv) == 3 and isthatpic:
        classify(sys.argv[1], sys.argv[2], isthatpic)
    elif len(sys.argv) == 4 and not isthatpic:
        classify(sys.argv[1], sys.argv[2], isthatpic)
    else:
        retrain(sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4], isthatpic)