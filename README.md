# 차 가계부 (mycar)

### 기능
1. 지출 내역 기록
   - 주유 (날짜, 장소, 금액, 단가, 주유량, 누적주행거리 기록)
   - 자동차세 (cc당 금액, 월별 할인률, 영업용 유무)
   - 정기검사
   - 각종 정비비<br>(각종 오일류, 필터, 배터리, 브레이크 패드 및 디스크, 타이어, 점화플러그, 잠금장치 및 힌지, 각종 전기장치, 와이퍼 등)

2. 주유소 및 충전소 안내
   - 공공데이터포털의 오픈API 활용

3. 정비 및 교체 시기 알림
   - 통상적인 시기를 기본으로 적용
   - 이용자가 직접 설정해서 적용

4. 게시판 활성화
   - 이용자들이 게시판을 활용해 정보를 소통



---
**22.03.19**<br>
가상머신 "VMware" 설치<br>
<img src="https://user-images.githubusercontent.com/81478007/159494684-e5eefb0c-5b46-4ed0-ba21-4d05e4ecefab.PNG" width="420"><br><br>
리눅스 운영체제 "Ubuntu" 설치<br>
<img src="https://user-images.githubusercontent.com/81478007/159498643-49eb077f-6d67-4ffb-a635-6f3394931da4.PNG" width="500"><br>

---
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
<br><br>
---
**22.03.22**<br>
NavigationBar를 만들고, 홈화면의 위젯들을 구상해보았다.<br> 
body를 차례대로 작성하고, body안에 Row를 배치하고, 그 안에 Column을 넣어서 '누적주행거리'랑 '평균연비' 항목을 넣었다.<br>
<img src="https://user-images.githubusercontent.com/81478007/159795988-930b54d8-8b85-4e70-b43d-c90d39446d56.PNG" width="400"><br>

