import cv2
import os
import sys
import classify_retrain as cr

def resize(path):
    image_path = '\\'.join(path.split("\\")[:-1])
    image_name = path.split("\\")[-1].split(".")[0]
    image_path = image_path + "\\" + image_name
    if not os.path.isdir(image_path):
        os.mkdir(image_path)
    image = cv2.imread(path)
    tmp = cv2.resize(image, (64, 64))
    cv2.imwrite(image_path + '\\1_tmp.jpg', tmp)
    return image_path + '\\1_tmp.jpg'

if __name__=="__main__":
    isthatpic = False
    re_image = resize(sys.argv[1])
    if len(sys.argv) == 3:
        cr.classify(re_image, sys.argv[2], isthatpic)
    elif len(sys.argv) > 3:
        cr.retrain(re_image, sys.argv[2], sys.argv[3], sys.argv[4], '/model_default_emoticon.h5')