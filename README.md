# 차 가계부 (mycar)

### 기능
1. 지출 내역 기록
   - 주유 (날짜, 금액, 단가, 주유량, 누적주행거리 기록)

2. 게시판 활성화
   - 이용자들이 게시판을 활용해 정보를 소통

------
**22.03.19**<br>
가상머신 "VMware" 설치<br>
<img src="https://user-images.githubusercontent.com/81478007/159494684-e5eefb0c-5b46-4ed0-ba21-4d05e4ecefab.PNG" width="420"><br><br>
리눅스 운영체제 "Ubuntu" 설치<br>
<img src="https://user-images.githubusercontent.com/81478007/159498643-49eb077f-6d67-4ffb-a635-6f3394931da4.PNG" width="500"><br>

------
**22.03.21**<br>
안드로이드 스튜디오에서 제공하는 AVD는 무거워서 Nox를 설치했다.<br>
USB디버깅을 허용하고, 디바이스 연결에 성공했다.<br>
그런데 계속 어플을 빌드하는 도중에 연결이 해제되었다.<br>
해결방법을 찾아 따라 해보았지만 해결되지 않아서 다음에 다시 시도해보기로 하고, 일단 기존의 AVD를 사용하기로 했다.<br>
<img src="https://user-images.githubusercontent.com/81478007/159784081-96b722b9-7eb3-4baa-8a76-ac2557d4e7a1.PNG" width="400">
<img src="https://user-images.githubusercontent.com/81478007/159784651-ae54e458-2359-4c3d-bdbb-1370f12d8107.PNG" width="500"><br>
<img src="https://user-images.githubusercontent.com/81478007/159784657-f85422dc-25b3-43f7-a58b-a347c9f9a3ee.PNG"><br><br>

플러터에서는 모든 기본 단위들을 Widget으로 부른다.<br>
StatelessWidget은 정적인 변하지 않는 위젯<br>
```Dart
class MyApp extends StatelessWidget {
}
```
<br><br>
StatefulWidget은 동적인 변하는 위젯<br>
```Dart
class MyHomePage extends StatefulWidget {
}
```
<br><br>
아래 setState를 써야 StatefulWidget안에서 움직일 수 있다.<br>
```Dart
setState(() {
   //내용
});
```
------
**22.03.22**<br>
클래스 내부에서만 쓸려면 변수명 앞에 언더바를 쓴다.<br>
```Dart
int _counter = 0;
```
<br>
NavigationBar를 만들고, 홈화면의 위젯들을 구상해보았다.
body를 차례대로 작성하고, body안에 Row를 배치하고, 그 안에 Column을 넣어서 '누적주행거리'랑 '평균연비' 항목을 넣었다.
<img src="https://user-images.githubusercontent.com/81478007/159795988-930b54d8-8b85-4e70-b43d-c90d39446d56.PNG" width="400">

---
**22.03.31**<br>
```Dart
didChangeDependencies()   //상태 객체의 의존성이 변경되면 호출된다.
```
```Dart
build()   //위젯을 화면에 표시하는 메서드로, 화면에 표시할 위젯을 반환해야 한다.
```
<br>
플러터에서 폰트를 추가하려면 pubspec.yaml 파일에 폰트 파일 경로를 지정하면 된다.

--------
**22.04.04**<br>
새로운 화면을 이동하기 위해서는 Navigator 클래스가 필요하다.<br>
이동할 때는 push() 메서드를 호출, 다시 돌아올 때는 pop() 메서드를 호출한다.<br>
마치 스택 구조가 떠오른다.<br>
BottomNavigaionBar를 구현하는 방법이 여러가지가 있다.<br>
- DefaultTabController
- BottomNavigaionBar
- TabController
- BottomAppBar
<br>그 중 BottomNavigaionBar로 작성하였다.<br><br>
(+)모양인 floatingActionButton을 중앙으로 배치시켰다. <br>
<img src="https://user-images.githubusercontent.com/81478007/162017696-8b6abb4f-ac92-48bd-82e3-fca9733927c3.PNG" width="350"><br><br>

-----
**22.04.05**<br>
설정 페이지를 만들어서 버튼과 연결하였으나, 설정 페이지로 넘어가지 않았다. 일단 임시방편으로 BottomNavigaionBar를 BottomAppBar로 바꾸었다.<br>
AppBar라서 다른 페이지로 넘어가면 BottomAppBar가 사라지는 문제가 있다.<br>
그래서 설정 페이지에도 동일한 BottomAppBar를 만들었으나, floatingActionButton이 사라졌다.<br>
로그인을 위한 ID, PW를 작성하는 TextFormField와 TextButton을 만들었지만 작성 위치의 오류로 화면에 보이지 않는다.<br>

<img src="https://user-images.githubusercontent.com/81478007/162017710-abac45bb-59e5-48cc-bc99-f602a312050c.PNG" width="350"><br><br>

홈화면에서 floatingActionButton 주위에 배경이 뚤리지 않아서 검색하여 해결했다.<br>

<img src="https://user-images.githubusercontent.com/81478007/162030035-550b180b-19e1-4aa2-aba4-a4df52fe28ef.PNG" width="200"><br>

```Dart
Scaffold(
   extendBody: true   //Scaffold안에 extemdBody를 true로 설정해야 했다.
   )
```
<br><br>
<br><br>
-----
**22.04.11**<br>
BottomAppBar를 쓰면 하단에 메뉴가 사라져서 다시 BottomNavigaionBar를 사용했다.<br>
기존에 BottomNavigaionBar가 작동하지 않았던 원인은 메뉴를 누르면 불러오는 변수 Index를<br>
위젯을 불러오는 지역 안에서 0으로 초기화하고 있었던 것이다.<br>
하단이 좁아서 floatingActionButton을 다시 원위치했다.<br>

-----
**22.05.29<br>

strapi를 공부하였다.


-----
**22.06.15**<br>
서버를 열어서 테스트 값을 넣고 실행했다.<br>




