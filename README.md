# Web-based-Emotion-Recognition

## 사용자 메뉴얼

### 1. 프로젝트 개요 <br>
  Web을 통해 사용자가 원하는 사진 또는 직접 그린 그림을 업로드 하여 그것에 나타나는 감정을 판단해주고 수치화 할 수 있다. 이 일련의 과정은 Keras CNN을 학습한 모델을 통해 판별되어 사용자에게 전달 되고 판별된 결과는 사용자가 맞고 틀림을 선택할 수 있다. 틀렸다면 피드백을 받아 새로운 모델을 형성하여 감정 판별의 신뢰도를 올릴 수 있다.

### 2. 설치/ 실행환경<br>
- python3.6 : [Link](https://www.python.org/)
- Tensorflow  1.13.1 : [Link](https://www.tensorflow.org/)
- Keras 2.2.4 : [Link](https://keras.io/)
- Tomcat 8.5 : [Link](https://tomcat.apache.org/download-80.cgi)
- Eclipse : [Link](https://www.eclipse.org/downloads/)
- Java SE : [Link](https://www.oracle.com/technetwork/java/javase/downloads/index.html#JDK11)

### 3. 구동 방법 <br>
1.WebOSS.war파일을 Tomcat이 설치 된 디렉토리내의 webapps로 이동. <br>

2. Tomcat 기동 
- Linux 서버일 경우는 Tomcat 폴더/bin/startup.sh를 실행
- Window 서버일 경우는 Tomcat 폴더/bin/startup.bat를 실행

3. http://localhost:8080/WebOSS 로 접속해서 테스트 -> photo_or_drawing.html로 자동 매칭

4. '사진으로 판별' 예시
  1) photo_or_drawing.html 에서 '사진 업로드 선택' -> photoPage.jsp로 이동됨
  2) photoPage.jsp에서 '파일 선택' 버튼을 클릭하여 사진 업로드 -> photoPage.jsp로 이동됨
  3) '얼굴 탐지' 버튼을 눌러 사진 속 얼굴들을 탐지
  4) 탐지 된 얼굴 중 하나의 사진 선택
  5) 감정 판별 결과 확인
  6) '피드백 하기' 버튼을 클릭 -> feedback.jsp 팝업창 생성
  7) 감정 판별의 결과가 신뢰되는 결과인지 'yes' or 'no' 선택
  8) 'no'를 선택하였다면 사용자가 생각하는 실제 감정을 


### 4. 기능별 소개
-	Web  : 웹 페이지에 관련된 소스파일들로 html/jsp 등의 파일로 구성되며 사용자 개인의 서버에서 환경을 갖춰 구동할 수 있다.
-	Face-detector : xml 파일에 저장되어 있는 얼굴 특징에 관련된 String 정보를 face.py 파일에서 불러와서 쓴다. 
-	Training-testing : 테스트와 학습을 시킬 수 있는 python 코드 ( test.py / train.py )
- 이미지 업데이트 예정

### 5. 버그리포트 작성 방법
- GitHub issue tracker를 통해 버그 리포트를 작성할 예정입니다.
- [참조](https://github.com/thomasJang/Codemirror-kr/blob/master/CONTRIBUTING.md)

### 6. 디렉토리에 관한 설명
- src : 자바 코드, 해당 폴더안에 있는 java파일만 컴파일을 수행한다.
  - analysis.dto : 데이터 객체
    - FileDTO.java : 사용자의 피드백 정보(결과가 올바른지, 틀렸다면 실제 감정은 무엇이었는지)와, 파일의 이름을 변수로 가지는 데이터 전송 객체. FileDTO의 생성자와 getter, setter 등도 포함한다.
  - analysis.servlet : 
    - 업로드를 위한 UpLoadServlet : 웹 페이지에서 표정을 분석할 사진이나 그림을 선택한 후 '얼굴 탐지'버튼을 누르면, MultipartRequest를 이용하여 해당 파일을 서버에 업로드 한다. 이미 서버에 업로드 된 파일과 똑같은 이름을 가진 파일이 선택되었다면, 파일의 이름 뒤에 숫자를 붙여 파일을 구분할 수 있다. 또한, 해당 파일의 얼굴을 탐지하는 python 코드를 실행하여 결과 값을 전달한다.
    - EmotionServlet : 선택된 얼굴의 감정을 판별하는 python 파일을 호출하여 그 결과 값을 전달한다.
    - InsertServlet : 사용자가 결과에 대한 피드백을 준 경우에만 실행된다. 피드백 정보를 저장하는 파이썬 프로그램에 피드백을 전달한다.
- WebContent : 컴파일되지 않아도 되는 파일들.
  - lib : javaScript, jstl을 위한 jar파일을 위한 폴더.
  - drawingForm.html : 그림을 통한 분석 폼. canvas라는 api를 연동하여 사람 얼굴 표정을 직접 그린다. 이때 ‘감정 판별’ 버튼을 선택하면, 그림은 파일 형태로 서버에 업로드 된다.
  - edited.jsp : 파일을 업로드 하면, 사진이나 그림의 얼굴 부분을 찾아 일정 크기로 잘라내 화면에 보여준다.
  - feedback.jsp : ‘피드백 하기’ 버튼을 눌러 나오는 팝업 창. 사용자가 피드백을 원하지 않는다면 이 화면은 볼 수 없다. 사용자는 프로그램이 파일을 보고 도출한 감정 결과와 자신이 생각했던 감정이 일치하는지에 대한 정보를 선택한다. 만약 자신의 생각과 다르다면, 자신이 생각한 실제 감정을 선택하는 항목이 추가된다. ‘확인’ 버튼을 눌러 피드백을 전송한다.
  - photo_or_drawing.html : 웹 페이지의 초기화면으로, ‘사진으로 판별’ 혹은 ‘그림으로 판별’ 버튼을 클릭하여 사진이나 그림 중 어떠한 것을 통해 감정을 분석할 것인지 선택한다.
  - photoForm.jsp : 사진을 통한 분석 폼. 사진을 선택할 수 있다. 이때 ‘감정 판별’ 버튼을 선택하면, 선택된 사진은 서버에 업로드 된다.
  - photoPage.jsp : ~Form.jsp, showPhoto.jsp, edited.jsp, result.jsp를 포함하는 화면을 보여준다.
  - result.jsp : 인공지능은 잘라낸 사진을 통해 어떤 표정인지 분석하여, 7가지 감정 중 어떤 감정과 가장 유사한지와 다른 감정들이 가능한 확률을 보여준다.
  - showPhoto.jsp : 사용자가 업로드한 사진을 보여준다.
  
  

## 개발자 메뉴얼 

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