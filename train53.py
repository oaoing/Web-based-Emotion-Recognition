from keras.models import Sequential  # model 시작 함수
from keras.layers import Dense, Activation, Dropout, Flatten, Conv2D, MaxPooling2D  # layer 함수들
import glob
import os.path
import datetime
import numpy as np
import cv2
from keras.callbacks import EarlyStopping, TensorBoard
from keras.utils import to_categorical
import tensorflow as tf

config = tf.ConfigProto()
config.gpu_options.allow_growth = True
sess = tf.Session(config=config)


def train_imaage(path):
    file_paths = glob.glob(os.path.join(path, '*.png'))
    images = [cv2.imread(path) for path in file_paths]
    #images = [cv2.cvtColor(cv2.imread(path), cv2.COLOR_BGR2GRAY) for path in file_paths]
    images = np.asarray(images)
    #images = images.reshape(images.shape[0], images.shape[1], images.shape[2], 3)       #grayscale은 shape가 3D라 4D로 변형해주어야함
    image_size = (images.shape[1], images.shape[2], images.shape[3])
    images = images / 255.
    labels = np.zeros(images.shape[0])
    for i in range(images.shape[0]):
        filename = os.path.basename(file_paths[i])[0]
        labels[i] = int(filename[0])

    return images, labels, image_size


def core_model(size):

    model = Sequential()
    model.add(Conv2D(32, kernel_size=(3, 3), activation='relu', input_shape=size, padding='same'))
    model.add(Conv2D(32, kernel_size=(3, 3), activation='relu', padding='same'))
    model.add(MaxPooling2D(pool_size=(2, 2)))
    model.add(Conv2D(64, kernel_size=(3, 3), activation='relu', padding='same'))
    model.add(Conv2D(64, kernel_size=(3, 3), activation='relu', padding='same'))
    model.add(MaxPooling2D(pool_size=(2, 2)))
    model.add(Conv2D(128, kernel_size=(3, 3), activation='relu', padding='same'))
    model.add(Conv2D(128, kernel_size=(3, 3), activation='relu', padding='same'))
    model.add(MaxPooling2D(pool_size=(2, 2)))
    model.add(Conv2D(256, kernel_size=(3, 3), activation='relu', padding='same'))
    model.add(Conv2D(256, kernel_size=(3, 3), activation='relu', padding='same'))
    model.add(MaxPooling2D(pool_size=(2, 2)))
    model.add(Flatten())
    model.add(Dense(1000))
    model.add(Activation('relu'))
    model.add(Dense(500))
    model.add(Activation('relu'))
    model.add(Dense(7))
    model.add(Activation('softmax'))

    model.compile(loss='categorical_crossentropy', optimizer='sgd', metrics=['accuracy'])
    model.summary()

    return model


def set_callback(patience):
    early_stopping = EarlyStopping(monitor='loss', min_delta=0, patience=patience, verbose=0,
                                   mode='auto')  # 오차가 증가하면 학습 조기종료
    log_dir_root = './log_dir/'
    now = datetime.datetime.utcnow().strftime('%Y%m%d%H%M%S')
    log_dir = '{}run-{}/'.format(log_dir_root, now)
    tensorboard = TensorBoard(log_dir=log_dir, write_graph=True, write_images=True)

    return [early_stopping, tensorboard]


if __name__ == '__main__':
    patience = 10  # 학습 중인 epoch 과 비교하기 위한 이전 epoch 의 수

    epochs = 50
    batch_size = 4

    x_train, y_train, size = train_imaage('./emoticon_resize')
    y_train = to_categorical(y_train)
    model = core_model(size)
    model.fit(x_train, y_train, batch_size, epochs, callbacks=set_callback(patience), verbose=0)

    model.save('./model_default_emoticon.h5')
