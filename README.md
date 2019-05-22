# Web-based-Emotion-Recognition

## 사용자 메뉴얼

### 1. 프로젝트 개요 <br>
  Web을 통해 사용자가 원하는 사진 또는 직접 그린 그림을 업로드 하여 그것에 나타나는 감정을 판단해주고 수치화 할 수 있다. 이 일련의 과정은 Keras CNN을 학습한 모델을 통해 판별되어 사용자에게 전달 되고 판별된 결과는 사용자가 맞고 틀림을 선택할 수 있다. 틀렸다면 피드백을 받아 새로운 모델을 형성하여 감정 판별의 신뢰도를 올릴 수 있다.

### 2. 설치/ 실행환경<br>
- python3.6 : [Link](https://www.python.org/)
- Tensorflow  1.13.1 : [Link](https://www.tensorflow.org/)
- Keras 2.2.4 : [Link](https://keras.io/)
- Test를 하고 싶은 경우 Challenges in Representation Learning: Facial Expression Recognition Challenge의 [DataSet](https://www.kaggle.com/c/challenges-in-representation-learning-facial-expression-recognition-challenge)을 사용. 
- Tomcat 8.5 : [Link](https://tomcat.apache.org/download-80.cgi)
- Eclipse : [Link](https://www.eclipse.org/downloads/)
- Java SE : [Link](https://www.oracle.com/technetwork/java/javase/downloads/index.html#JDK11)

### 3. 구동 방법 <br>
1.WebOSS.war파일을 Tomcat이 설치 된 디렉토리내의 webapps로 이동. <br>

2. Tomcat 기동 
- Linux 서버일 경우는 Tomcat 폴더/bin/startup.sh를 실행
- Window 서버일 경우는 Tomcat 폴더/bin/startup.bat를 실행

3. http://localhost:8080/WebOSS 로 접속해서 테스트


### 4. 기능별 소개
-	Web  : 웹 페이지에 관련된 소스파일들로 html/jsp 등의 파일로 구성되며 사용자 개인의 서버에서 환경을 갖춰 구동할 수 있다.
-	Face-detector : xml 파일에 저장되어 있는 얼굴 특징에 관련된 String 정보를 face.py 파일에서 불러와서 쓴다. 
-	Training-testing : 테스트와 학습을 시킬 수 있는 python 코드 ( test.py / train.py )

### 5. 버그리포트 작성 방법
- GitHub issue tracker를 통해 버그 리포트를 작성할 예정입니다.
- [참조](https://github.com/thomasJang/Codemirror-kr/blob/master/CONTRIBUTING.md)
  


## 개발자 개발자 메뉴얼 

### 1.소스 코드 입수 방법
-	예제 코드 : https://antilibrary.org/1980
-	VGG:https://datascienceschool.net/viewnotebook/47c57f9446224af08f13e1f3b00a774e/
-	Inception module: https://becominghuman.ai/understanding-and-coding-inception-module-in-keras-eb56e9056b4b


### 2. 빌드
- Eclipse로 자동 빌드
  + Eclipse를 실행하고 상단바의 [Project]-Build Automatically체크

### 3. 테스트

테스트 대상 | 기준
-----------|------
모델 | 정확도 80%( 옳게 판단한 개수 / 전체 테스트 데이터 개수)
이미지분류 | 사용자 업로드 이미지로부터 나온 이미지가 맞는지 확인
이미지 업로드 | Checksum을 통한 무결성 검증

### 4. 릴리즈
- Eclipse에서 프로젝트 폴더(WebOSS)를 export하여 WebOSS.war파일을 생성하고 이를 배포하였습니다.
