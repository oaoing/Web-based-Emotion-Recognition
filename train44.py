from keras.models import Sequential, Model  # model 시작 함수
from keras.layers import Dense, Activation, concatenate, Flatten, Conv2D, MaxPooling2D, Input  # layer 함수들
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


def train_image(path):
    file_paths = glob.glob(os.path.join(path, '*.jpg'))
    images = [cv2.cvtColor(cv2.imread(path), cv2.COLOR_BGR2GRAY) for path in file_paths]
    images = np.asarray(images)
    images = images.reshape(images.shape[0], images.shape[1], images.shape[2], 1)       #grayscale은 shape가 3D라 4D로 변형해주어야함
    image_size = (images.shape[1], images.shape[2], images.shape[3])
    images = images / 255.
    labels = np.zeros(images.shape[0])
    for i in range(images.shape[0]):
        filename = os.path.basename(file_paths[i])[0]
        labels[i] = int(filename[0])
    return images, labels, image_size

def inception_module(input_img):
    tower_1 = Conv2D(64, (1, 1), padding='same', activation='relu')(input_img)
    tower_1 = Conv2D(64, (3, 3), padding='same', activation='relu')(tower_1)
    tower_2 = Conv2D(64, (1, 1), padding='same', activation='relu')(input_img)
    tower_2 = Conv2D(64, (5, 5), padding='same', activation='relu')(tower_2)
    tower_3 = MaxPooling2D((3, 3), strides=(1, 1), padding='same')(input_img)
    tower_3 = Conv2D(64, (1, 1), padding='same', activation='relu')(tower_3)
    output = concatenate([tower_1, tower_2, tower_3], axis=3)

    return output

def core_model(size):

    input_img = Input(shape=size)
    module1 = inception_module(input_img)
    module2 = inception_module(module1)
    module3 = inception_module(module2)
    flat = Flatten()(module3)
    dense = Dense(7)(flat)
    soft = Activation('softmax')(dense)
    model = Model(inputs=input_img, outputs=soft)
    model.compile(loss='categorical_crossentropy', optimizer='adam', metrics=['accuracy'])
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
    batch_size = 16

    x_train, y_train, size = train_image('./Training')
    y_train = to_categorical(y_train)
    model = core_model(size)
    model.fit(x_train, y_train, batch_size, epochs, callbacks=set_callback(patience), verbose=0)

    model.save('./model_default.h5')