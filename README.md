# Web-based-Emotion-Recognition

## 사용자 가이드

### 1. 프로젝트 개요 <br>
  Web을 통해 사용자가 원하는 사진 또는 직접 그린 그림을 업로드 하여 이미지에 나타나는 감정을 판단해준다. 이 일련의 과정은 Keras CNN을 학습한 모델을 통해 판별되어 사용자에게 전달 되고 판별된 결과에 대해 사용자가 맞고 틀림을 선택할 수 있다. 틀렸다면 피드백을 받아 새로운 모델을 형성하여 감정 판별의 신뢰도를 올릴 수 있다.

### 2. 설치/ 실행환경<br>
- python3.6 : [Link](https://www.python.org/)
- Tensorflow  1.13.1 : [Link](https://www.tensorflow.org/)
- Keras 2.2.4 : [Link](https://keras.io/)
- Tomcat 8.5 : [Link](https://tomcat.apache.org/download-80.cgi)
- Eclipse : [Link](https://www.eclipse.org/downloads/)
- Java SE : [Link](https://www.oracle.com/technetwork/java/javase/downloads/index.html#JDK11)

### 3. 구동 방법 <br>
1.WebOSS.war파일을 Tomcat이 설치 된 디렉토리내의 webapps로 이동. <br>
 
##### -.WAR파일형식이란? 소프트웨어 공학에서 자바서버 페이지, 자바 서블릿, 자바 클래스, XML, 파일, 태그 라이브러리, 정적 웹 페이지 (HTML 관련 파일) 및 웹 애플리케이션을 함께 이루는 기타 자원을 한데 모아 배포하는데 사용되는 JAR 파일이다.

2. Tomcat 기동 
- Linux 서버일 경우는 Tomcat 폴더/bin/startup.sh를 실행
- Window 서버일 경우는 Tomcat 폴더/bin/startup.bat를 실행

3. http://localhost:8080/WebOSS 로 접속해서 테스트 -> photo_or_drawing.html로 자동 매칭

4.1 '사진으로 판별' 예시
  - 메인화면에서 '사진 업로드 선택' -> 사진 업로드 페이지로 이동
  - '파일 선택' 버튼을 클릭하여 사진 업로드
  - '얼굴 탐지' 버튼을 눌러 사진 속 얼굴들을 탐지
  - 탐지 된 얼굴 중 하나의 사진 선택
  - 감정 판별 결과 확인
  - '피드백 하기' 버튼을 클릭 -> 피드백여부를 묻는 팝업창 생
  - 감정 판별의 결과가 신뢰되는 결과인지 'yes' or 'no' 선택
  - 'no'를 선택하였다면 사용자가 생각하는 실제 감정을 선택하여 피드백을 전송
  
4.2'그림으로 판별'예시
  - 메인화면에서 '그림 그리' -> 그림 업로드 페이지로 이동
  - '그림판' 버튼을 클릭하여 그림판을 띄워 업로드할 그림을 그림
  - 이하 내용은 '사진으로 판별'과 동


### 4. 기능별 소개
-	Web  : 웹 페이지에 관련된 소스파일들로 html/jsp 등의 파일로 구성되며 사용자 개인의 서버에서 환경을 갖춰 구동할 수 있다.
-	Face-detector : xml 파일에 저장되어 있는 얼굴 특징에 관련된 String 정보를 face.py 파일에서 불러와서 쓴다. 
-	Training-testing : 테스트와 학습을 시킬 수 있는 python 코드 ( test.py / train.py )
- 이미지 업데이트 예정

### 5. 버그리포트 작성 방법
- [GitHub issue tracker](https://github.com/oaoing/Web-based-Emotion-Recognition/issues)를 통해 버그 리포트를 작성하였습니다.


  

## 개발자 메뉴얼 

### 1.소스 코드 입수 방법
-	github에 업로드/2019-06-12/ver 0.1

### 2.디렉토리에 관한 설명
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
  

### 3. 빌드방법
- Eclipse로 자동 빌드
  + Eclipse를 실행하고 상단바의 [Project]-Build Automatically체크

### 4. 테스트
1.테스트 대상 및 기준<br>

테스트 대상 | 기준
-----------|------
모델 | 정확도 80%( 옳게 판단한 개수 / 전체 테스트 데이터 개수)
이미지분류 | 웹상에 업로드 된 이미지로부터 얼굴이 올바르게 추출되었는지

2.테스트를 하기 위해 설치해야하는 패키지
-파이썬IDE에 다음의 패키지를 설치하세요<br>
  -opencv<br>
  -tensorflow<br>
  -scikit-learn(accuracy정확도 측정함수)<br>
  -keras<br>

3.테스트
1. 모델 정확도 
- 파이썬 IDE에서 test.py파일을 실행하고 console창에서 accuracy확인
- 아래 이미지 참
2. 이미지 분류
-	웹상에서 업로드한 이미지와 그 이미지로부터 추출 된 얼굴 확인
-	아래 이미지 참고


### 5. 릴리즈
- WebOSS.war파일로 github에 배포

### 6.버그 확인 및 처리 방법
- [Github issue tracker](https://github.com/oaoing/Web-based-Emotion-Recognition/issues)에서 버그를 확인하세요

- 발생 issues
-face.py에서 얼굴이 아닌 것 탐지 (19/05/22)<br>
 이미지에서 추출한 이미지 중 얼굴이 아닌 것 탐지<br>
->face.py의 face_cascade.detectMultiScale(17 줄)에서 탐지 세밀도를 최대로 변경<br>
-탐지 세밀도를 최대로 변경해도 얼굴이 아닌 것이 탐지되는 경우가 발생<br>
-> 추출된 이미지들을 웹에 출력하여 사용자가 얼굴인 것을 선택하도록 함<br>
    
- 이전에 업로드했던 사진 파일을 다시 업로드 했을 때, 얼굴을 탐지하지못함(19/05/29)<br>
 ->사진을 사진명으로 생성하는 폴더에 이동하지않고 pics 경로에 두도록 수정하여 해결
