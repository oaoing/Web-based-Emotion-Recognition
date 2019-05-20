import cv2

face_cascade = cv2.CascadeClassifier('./haarcascade_frontalface_alt.xml')

image = cv2.cvtColor(cv2.imread('./test2.jpg'), cv2.COLOR_BGR2GRAY)

faces = face_cascade.detectMultiScale(image, 1.03, 5)
count = 1

for (x, y, w, h) in faces:
    tmp = image.copy()
    tmp = cv2.resize(image[y:y+h, x:x+w], (48, 48))
    cv2.imwrite('tmp_' + str(count) + '.jpg', tmp)
    count += 1


