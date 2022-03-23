import 'package:flutter/material.dart';

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
    var titleSection = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.all(30)),
          Text("차량 이름", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),)
        ],),

    ],);

    var subtitleSection = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(children: <Widget>[
          Text("누적주행거리", style: TextStyle(fontSize: 16)),
          Text("0Km", style: TextStyle(fontSize: 16)),
        ],),
        Padding(padding: EdgeInsets.all(30)),
        Column(children: <Widget>[
          Text("평균 연비", style: TextStyle(fontSize: 16)),
          Text("0Km", style: TextStyle(fontSize: 16)),
        ],)
    ],);
    var textSection = Text("리스트!",);


    return Scaffold(

      appBar: AppBar(title: Text(widget.title),),
      body: Column(children: <Widget>[
        //Image.network("https://w.namu.la/s/fe3d77431ce0579466e7b06e5785af8c288f674fa3cc7fd8955ced8af3e63b3ee4782420ac9a3b54b5d2056479055c2663f37b7509b9dbd6122fdde99108d3c07f099598914482d446331ab9380d6070f33d61168ece6128c1e838ea04a46746",height: 240, width: 600,fit:BoxFit.cover),
        titleSection,
        subtitleSection,
        textSection
      ],),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.drive_eta), label: '홈'),
          BottomNavigationBarItem(icon: const Icon(Icons.local_gas_station), label: '검색'),
          BottomNavigationBarItem(icon: const Icon(Icons.account_circle), label: '내정보'),

        ],
      ),
    );
  }
}
