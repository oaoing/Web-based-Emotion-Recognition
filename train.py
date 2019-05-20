import numpy as np
from keras.preprocessing.image import ImageDataGenerator        # 이미지를 불러오기 위한 package
from keras.layers import Sequential                             # <<
from keras.layers import Dense
from keras.layers import Flatten
from keras.layers.convolutional import Conv2D
from keras.layers.convolutional import MaxPooling2D             # << model을 위한 package
from IPython.display import SVG                                 # model을 시각화 하기 위한 package
from keras.utils.vis_utils import model_to_dot                  # 위와 동일

label = ['Angry', 'Disgust', 'Fear', 'Happy', 'Sad', 'Surprise', 'Neutral']

def load_image(path):
    data_generator = ImageDataGenerator(rescale=1./255) # CNN 내 연산은 0 ~ 1.0 사이 값으로 연산

    train_generator = data_generator.flow_from_directory(
        path,                                             # 이미지가 있는 경로에서 이미지를 불러옴
        target_size=(48, 48),                               # 이미지의 size
        batch_size=1,                                       # 이미지 batch size
        class_mode='categorical'                            # 'categorical' = 다중 분류, 'binary' = 이진 분류 'sparse' = 1차원 정수 'None' = 라벨 생성 x
    )

    return train_generator.next()

def core_model():
    model = Sequential()
    model.add(Conv2D(64, (3, 3), activation='relu'))
    model.add(MaxPooling2D(pool_size=(2, 2)))
    model.add(Flatten())
    model.add(Dense(128, activation='relu'))
    model.add(Dense(3, activation='softmax'))
    return model

def view_model(model):
    SVG(model_to_dot(model, show_shapes=True).create(prog='dot', format='svg'))

if __name__ == '__main__':
    view_model(core_model())
