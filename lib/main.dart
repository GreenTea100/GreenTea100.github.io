import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mycar/configpage.dart';
import 'package:mycar/listpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Car',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'My Car')
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    int currentIndex = 0;
    var titleSection = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Padding(padding: EdgeInsets.all(10)),
          //Text("차량 이름", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),)
    ]
    )
    ],);

    var subtitleSection = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(children: const <Widget>[
          //Text("누적주행거리", style: TextStyle(fontSize: 16)),
          //Text("0Km", style: TextStyle(fontSize: 20)),
        ],),

        Padding(padding: EdgeInsets.all(30)),

        Column(children: const <Widget>[
          //Text("평균 연비", style: TextStyle(fontSize: 16)),
          //Text("0Km", style: TextStyle(fontSize: 20)),
        ],)
    ],);
    var textSection = Text("",);

    int screenIndex = 0;
    List<Widget> screenList = [const Text('홈스크린'), const Text('찾기 스크린'), const Text('계시판 스크린'), const Text('설정 스크린')];



    return Scaffold(
      extendBody: true,
      appBar: AppBar(title: Text(widget.title),),
      body: Column(children: <Widget>[
        titleSection,
        subtitleSection,
        textSection,
        screenList[screenIndex],
        //Image.network("https://w.namu.la/s/fe3d77431ce0579466e7b06e5785af8c288f674fa3cc7fd8955ced8af3e63b3ee4782420ac9a3b54b5d2056479055c2663f37b7509b9dbd6122fdde99108d3c07f099598914482d446331ab9380d6070f33d61168ece6128c1e838ea04a46746",height: 240, width: 600,fit:BoxFit.cover),
      ],),


      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
            CupertinoIcons.add,color: Colors.white,
        ),
        backgroundColor: Colors.cyan[10],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      /*
      bottomNavigationBar: BottomNavigationBar(

          type: BottomNavigationBarType.fixed,
          //currentIndex: screenIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),

                activeIcon: Icon(Icons.star),
                label: '홈'
            ),
            
            BottomNavigationBarItem(
                icon: Icon(Icons.local_gas_station),
                activeIcon: Icon(Icons.star),
                label: '찾기'
            ),
            
            BottomNavigationBarItem(
                icon: Icon(Icons.message),
                activeIcon: Icon(Icons.star),
                label: '계시판'
            ),
            
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                activeIcon: Icon(Icons.star),
                label: '설정'
            )
          ],
        onTap: (value) {
            setState(() {//상태 갱신이 되지 않으면 동작을 하지 않음
              if(value==0){
                currentIndex: 0;
                screenIndex = value;
              }
              if(value==1){
                currentIndex: 1;
                screenIndex = value;
              }
              if(value==2){
                currentIndex: 2;
                screenIndex = value;
              }
              if(value==3){
                currentIndex: 3;
                screenIndex = value;
              }
            });
        }
      )
        */


     bottomNavigationBar: BottomAppBar(
       notchMargin: 12,
       elevation: 8,
       shape: const CircularNotchedRectangle(),
       color: Colors.white,
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.drive_eta), iconSize: 35,color: Colors.grey,),
          IconButton(onPressed: () {}, icon: Icon(Icons.local_gas_station),iconSize: 35,color: Colors.grey,),
          Padding(padding: EdgeInsets.all(15)),
          IconButton(onPressed: () {}, icon: Icon(Icons.message),iconSize: 35,color: Colors.grey,),
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => configpage()));
          }, icon: Icon(Icons.account_circle),iconSize: 35,color: Colors.grey,),

       ]
       )
      ),


    );
  }
}
