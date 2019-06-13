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
- Java 1.8 : [Link](https://www.oracle.com/technetwork/java/javase/downloads/index.html#JDK11)

### 3. 구동 방법 <br>
1.gitHub에서 받은 Web-based-Emotion-Recognition-Web폴더를 eclipse에 import한다.
- 이클립스 실행
- 이클립스 상단바에서 File-import-projects from folder or archive클릭
- import sorce:에 Directory에서  Web-based-Emotion-Recognition-Web폴더를 찾아 선택
<div>
<img src="https://user-images.githubusercontent.com/48352713/59368316-efc88a80-8d78-11e9-88e7-3a402396117e.png"></img>
<img src="https://user-images.githubusercontent.com/48352713/59368321-f22ae480-8d78-11e9-8849-9b1de88f0c14.png"></img>
 </div>
2. tomcat서버 실행<br>
- eclipse 상단바에서 window-show views-server를 선택<br>
<img src="https://user-images.githubusercontent.com/48352713/59368027-4a151b80-8d78-11e9-9037-48b826066777.png"></img><br>
- servers창의 tomcat을 오른쪽 마우스클릭해 start를 눌러 서버실행<br>
<img src="https://user-images.githubusercontent.com/48352713/59368027-4a151b80-8d78-11e9-9037-48b826066777.png"></img>

3. http://localhost:8080/WebOSS 로 접속해서 테스트 
4.1. 사진으로 판별 예시
-	메인화면에서 'IMAGE' -> photopage로 이동
-	‘업로드' 버튼을 클릭하여 이미지 업로드
-	업로드한 이미지에서 detect 된 얼굴 중 감정을 판별할 하나의 사진 선택<br>
-	감정 판별 결과 확인<br>
<img src="https://user-images.githubusercontent.com/48352713/59368639-aa588d00-8d79-11e9-9759-b77cec9a055a.png"></img><br>
- '피드백 하기' 버튼을 클릭 -> 감정 판별의 결과가 옳은 결과인지 'yes' or 'no' 선택<br>
<img src="https://user-images.githubusercontent.com/48352713/59368689-bcd2c680-8d79-11e9-90d4-49fa8467c621.png"></img><br>
- 'no'를 선택하였다면 사용자가 생각하는 실제 감정을 선택하여 피드백을 전송<br>
<img src="https://user-images.githubusercontent.com/48352713/59368711-c65c2e80-8d79-11e9-8284-86d726d5572e.png"></img><br>

4.2. 그림으로 판별예시
-	메인화면에서 'Draw' -> drawingPage로 이동<br>
<img src="https://user-images.githubusercontent.com/48352713/59368748-dd028580-8d79-11e9-8dfc-720a5253b0a4.png"></img><br>
-	'그림판' 버튼을 클릭하여 그림판을 띄워 업로드할 그림을 그림<br>
-	resize된 그림을 클릭<br>
<img src="https://user-images.githubusercontent.com/48352713/59368768-e7248400-8d79-11e9-8736-363d39313386.png"></img><br>
-	판별된 감정을 확인하고 피드백을 결정<br>
<img src="https://user-images.githubusercontent.com/48352713/59368791-f3a8dc80-8d79-11e9-91ea-bd00e7d49b5e.png"></img><br>


### 4. 기능별 소개
<img src="https://user-images.githubusercontent.com/48352713/59368843-08857000-8d7a-11e9-927a-0e00de56272a.png"></img><br>
-	Web interface : 사용자가 업로드한 이미지를 서버로 보낸 후, 처리된 이미지를 받아와 웹에 출력한다. 출력된 얼굴 이미지리스트에서 사용자가 선택한 이미지를 서버로 보내고 서버에서 판별한 감정을 받아와 화면에 출력한다.<br>
-	face.py : 사용자가 업로드한 이미지에서 얼굴을 detect하고 이미지크기를 resize한다.<br>
-	classfy_retrain.py : <br>
  +	classify(): 학습된 모델을 통해 불러온 이미지의 감정을 판별한다.<br>
  +	load_image(): 이미지를 불러온다<br>
  +	retrain(): 피드백받은 감정을 모델에 retrain시키고 새로운 모델을 생성한다.<br>
  +	record_feedback(): 피드백 정보를 csv에 기록한다.<br>
-	test.py : 학습된 모델에 테스트데이터셋으로 테스트해 정확도를 출력한다.<br>
-	PublicTest : 테스트데이터셋<br>
-	train.py : 학습데이터셋으로 모델을 학습한다.<br>
-	Training : 학습데이터셋 <br>

### 5. 버그리포트 작성 방법
- [GitHub issue tracker](https://github.com/oaoing/Web-based-Emotion-Recognition/issues)를 통해 버그 리포트를 작성하였습니다.


## 개발자 메뉴얼 

### 1.소스 코드 입수 방법
-	gitHub 저장소에서 <Clone or download>-<Download ZIP>을 눌러 ZIP파일을 받은 뒤, 압축을 푸세요.

### 2.디렉토리에 관한 설명
	src : 자바 코드, 해당 폴더안에 있는 java파일만 컴파일을 수행한다.<br>
•	analysis.servlet :<br>
o	UpLoadServlet : 웹 페이지에서 표정을 분석할 사진이나 그림을 선택한 후 '얼굴 탐지'버튼을 누르면, MultipartRequest를 이용하여 해당 파일을 서버에 업로드 한다. 이미 서버에 업로드 된 파일과 똑같은 이름을 가진 파일이 선택되었다면, 파일의 이름 뒤에 숫자를 붙여 파일을 구분할 수 있다. 또한, 해당 파일의 얼굴을 탐지하는 python 코드를 실행하여 결과 값을 전달한다.<br>
o	EmotionServlet : 선택된 얼굴의 감정을 판별하는 python 파일을 호출하여 그 결과 값을 전달한다.<br>
o	InsertServlet : 사용자가 결과에 대한 피드백을 준 경우에만 실행된다. 피드백 정보를 저장하는 파이썬 프로그램에 피드백을 전달한다.<br>
o	PaintServlet. : 업로드 된 그림파일을 resize하고 resize된 파일을 서버에 저장한다.<br>
	WebContent : 컴파일되지 않아도 되는 파일들.<br>
•	lib : javaScript, jstl을 위한 jar파일을 위한 폴더.<br>
•	drawingPage.jsp : canvas를 그리기 위한 각종 함수가 있으며, 그 중 uploadCanvas()함수는 canvas에 그린 이미지를 서버에 전송한다 drawingForm.jsp, result.jsp페이지가 포함되어 있다.  <br>
•	drawingForm.jsp : canvas api가 포함되어 있는 form과 두개의 버튼이 있다. 각각의 버튼은 누르면 캔버스를 초기화하는clearCanvas(), 그림을 서버에 업로드하는uploadCanvas()함수가 호출된다. <br>
•	edited.jsp : 파일을 업로드 하면, 사진의 얼굴 부분을 찾아 일정 크기로 잘라내 화면에 보여준다.<br>
•	feedback.jsp : ‘피드백 하기’ 버튼을 눌러 나오는 팝업 창. 사용자가 피드백을 원하지 않는다면 이 화면은 볼 수 없다. 사용자는 프로그램이 파일을 보고 도출한 감정 결과와 자신이 생각했던 감정이 일치하는지에 대한 정보를 선택한다. 만약 자신의 생각과 다르다면, 자신이 생각한 실제 감정을 선택하는 항목이 추가된다. ‘확인’ 버튼을 눌러 피드백을 전송한다.<br>
•	index.jsp : 웹 페이지의 초기화면으로, ‘사진으로 판별’ 혹은 ‘그림으로 판별’ 버튼을 클릭하여 사진이나 그림 중 어떠한 것을 통해 감정을 분석할 것인지 선택한다.<br>
•	photoForm.jsp : 사진을 통한 분석 폼. 사진을 선택할 수 있다. 선택 된 사진은 미리보기로 출력된다. 이때 ‘얼굴 탐지’ 버튼을 선택하면, 선택된 사진은 서버에 업로드 된다.<br>
•	photoPage.jsp :photoForm.jsp, edited.jsp, result.jsp를 포함하는 화면을 보여준다. <br>
•	result.jsp : 인공지능은 잘라낸 사진을 통해 어떤 표정인지 분석하여, 7가지 감정 중 하나를 출력한다. 피드백 버튼을 누르면 feedback.jsp로 이동한다<br>


### 3. 빌드방법
- Eclipse로 자동 빌드
  + Eclipse를 실행하고 상단바의 [Project]-Build Automatically체크

### 4. 테스트
1.테스트 대상 및 기준<br>

테스트 대상 | 기준
-----------|------
모델 | 정확도 50%( 옳게 판단한 개수 / 전체 테스트 데이터 개수)
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
- 아래 이미지 참고<br>
<img src="https://user-images.githubusercontent.com/48352713/59369007-6dd96100-8d7a-11e9-80dd-a47aa35f3ffa.png"> </img><br>
2. 이미지 분류<br>
-	웹상에서 업로드한 이미지와 그 이미지로부터 추출 된 얼굴 확인
-	아래 이미지 참고<br>
<img src="https://user-images.githubusercontent.com/48352713/59369052-85b0e500-8d7a-11e9-9233-698df114c898.png"> </img><br>



### 5.버그 확인 및 처리 방법
- [Github issue tracker](https://github.com/oaoing/Web-based-Emotion-Recognition/issues)에서 버그를 확인하세요

- 발생 issues
-face.py에서 얼굴이 아닌 것 탐지 (19/05/22)<br>
 이미지에서 추출한 이미지 중 얼굴이 아닌 것 탐지<br>
->face.py의 face_cascade.detectMultiScale(17 줄)에서 탐지 세밀도를 최대로 변경<br>
-탐지 세밀도를 최대로 변경해도 얼굴이 아닌 것이 탐지되는 경우가 발생<br>
-> 추출된 이미지들을 웹에 출력하여 사용자가 얼굴인 것을 선택하도록 함<br>
    
- 이전에 업로드했던 사진 파일을 다시 업로드 했을 때, 얼굴을 탐지하지못함(19/05/29)<br>
 ->사진을 사진명으로 생성하는 폴더에 이동하지않고 pics 경로에 두도록 수정하여 해결
<<<<<<< HEAD


### 6. MIT License
Copyright (c) <2019> <oaoing, sjsr03, ohwoww, ducjs0303>

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
=======
>>>>>>> 디자인 추가
