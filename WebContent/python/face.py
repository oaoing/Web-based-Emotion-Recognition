import cv2
import sys
import os

def face_detect(path):
    image_path = '\\'.join(path.split("\\")[:-1])
    image_name = path.split("\\")[-1].split(".")[0]
    image_path = image_path + "\\" + image_name
    os.mkdir(image_path)
    total_path = image_path + "\\" + image_name + ".jpg"
    os.popen("move " + path + " " + total_path)

    face_cascade = cv2.CascadeClassifier('C:\\testt\\haarcascade_frontalface_alt.xml')

    image = cv2.cvtColor(cv2.imread(total_path), cv2.COLOR_BGR2GRAY)

    faces = face_cascade.detectMultiScale(image, 1.03, 5)
    count = 1

    for (x, y, w, h) in faces:
       tmp = image.copy()
       tmp = cv2.resize(image[y:y+h, x:x+w], (48, 48))
       cv2.imwrite(image_path + '\\tmp_' + str(count) + '.jpg', tmp)
       print("\\".join(image_path.split("\\")[-2:]) + '\\tmp_' + str(count) + '.jpg')
       count += 1

if __name__ == "__main__":
   if len(sys.argv) == 2:
      face_detect(sys.argv[1])