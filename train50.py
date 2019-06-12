from keras.models import Sequential  # model 시작 함수
from keras.layers import Dense, Activation, Dropout, Flatten, Conv2D, MaxPooling2D  # layer 함수들
import glob
import os.path
import datetime
import numpy as np
import cv2
from keras.callbacks import EarlyStopping, TensorBoard
from keras.utils import to_categorical


def train_imaage(path):         # read images
    file_paths = glob.glob(os.path.join(path, '*.jpg'))
    images = [cv2.cvtColor(cv2.imread(path), cv2.COLOR_BGR2GRAY) for path in file_paths]
    images = np.asarray(images)
    images = images.reshape(images.shape[0], images.shape[1], images.shape[2], 1)       #grayscale shape is 3D, So change 4D
    image_size = (images.shape[1], images.shape[2], images.shape[3])
    images = images / 255.
    labels = np.zeros(images.shape[0])
    for i in range(images.shape[0]):
        filename = os.path.basename(file_paths[i])[0]
        labels[i] = int(filename[0])

    return images, labels, image_size


def core_model(size, n_layer):
    min_neurons = 20
    max_neurons = 100
    kernel = (3, 3)

    steps = np.floor(max_neurons / (n_layer + 1))   # floor: 소수점 내림 함수
    neurons = np.arange(min_neurons, max_neurons, steps)    # min_neurons ~ max_neurons 범위 정수를 steps의 간격으로 np.array() 생성
    neurons = neurons.astype(np.int32)

    model = Sequential()
    for i in range(0, n_layer):
        if i == 0:
            shape = size
            model.add(Conv2D(neurons[i], kernel, input_shape=shape))
        else:
            model.add(Conv2D(neurons[i], kernel))
        model.add(Activation('relu'))

    model.add(MaxPooling2D(pool_size=(2, 2)))
    model.add(Flatten())
    model.add(Dense(max_neurons))
    model.add(Activation('relu'))

    model.add(Dense(7))
    model.add(Activation('softmax'))

    model.compile(loss='categorical_crossentropy', optimizer='adam', metrics=['accuracy'])
    model.summary()

    return model


def set_callback(patience):         # EarlyStopping and tensorboard callback setting
    early_stopping = EarlyStopping(monitor='loss', min_delta=0, patience=patience, verbose=0,
                                   mode='auto')  # 오차가 증가하면 학습 조기종료
    log_dir_root = './log_dir/'
    now = datetime.datetime.utcnow().strftime('%Y%m%d%H%M%S')
    log_dir = '{}run-{}/'.format(log_dir_root, now)
    tensorboard = TensorBoard(log_dir=log_dir, write_graph=True, write_images=True)

    return [early_stopping, tensorboard]


if __name__ == '__main__':
    N_LAYERS = 5  # layer 개수
    patience = 10  # 학습 중인 epoch 과 비교하기 위한 이전 epoch 의 수

    epochs = 50
    batch_size = 100

    x_train, y_train, size = train_imaage('./Training')
    y_train = to_categorical(y_train)
    model = core_model(size, N_LAYERS)
    model.fit(x_train, y_train, batch_size, epochs, callbacks=set_callback(patience), verbose=0)

    model.save('./model_default.h5')