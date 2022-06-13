import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mycar/loginpage.dart';
import 'package:mycar/views/home/index.dart';
import 'package:mycar/views/oil_stations/index.dart';
import 'package:mycar/views/posts/index.dart';
import 'package:mycar/views/settings/index.dart';
import 'package:intl/intl.dart';
import 'package:mycar/bookpage.dart';
import 'package:mycar/postwrite.dart';


void main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}



class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  dynamic userinfo = "";

  void setA(data) {
    setState(() {
      userinfo = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Car',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: userinfo != ""? MyHomePage(title: 'My Car', userData: userinfo) : loginpage(setUserData: setA),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.userData}) : super(key: key);
  final String title;
  final dynamic userData;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int screenIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var titleSection = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          //Padding(padding: EdgeInsets.all(30)),
    ]
    )
    ],);

    List<Widget> screenList = [HomeView(userData:widget.userData), const OilStationView(), const PostsView(), const SettingsView()];
    List<Icon> floatingIcons = [
      const Icon(CupertinoIcons.pen,color: Colors.white,),
      const Icon(CupertinoIcons.xmark,color: Colors.white,),
      const Icon(CupertinoIcons.pen,color: Colors.white,),
      const Icon(CupertinoIcons.xmark,color: Colors.white,),
    ];
    List<void Function()> floatingFunctionList = [
          () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => bookpage(userData: widget.userData,),))
              .then((value) => setState((){ screenIndex = 0; }));
      },
          () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => bookpage(userData: widget.userData,),));

      },
          () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => postwrite(userData: widget.userData,),));
      },
          () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => bookpage(userData: widget.userData,),));
      }
    ];

    return Scaffold(
      extendBody: true,
      appBar: AppBar(title: Text(widget.title),),
      body: Column(children: <Widget>[
        titleSection,
        screenList[screenIndex],
        //Image.network("https://w.namu.la/s/fe3d77431ce0579466e7b06e5785af8c288f674fa3cc7fd8955ced8af3e63b3ee4782420ac9a3b54b5d2056479055c2663f37b7509b9dbd6122fdde99108d3c07f099598914482d446331ab9380d6070f33d61168ece6128c1e838ea04a46746",height: 240, width: 600,fit:BoxFit.cover),
      ],),


      floatingActionButton: FloatingActionButton(
        heroTag: 'bookTag',
        onPressed: floatingFunctionList[screenIndex],
        child: floatingIcons[screenIndex],
        backgroundColor: Colors.cyan[10],
      ),


      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: screenIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '홈'
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.local_gas_station),
                label: '찾기'
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: '게시판'
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: '내정보'
            )
          ],
        onTap: (value) {
            setState(() {//상태 갱신이 되지 않으면 동작을 하지 않음
              screenIndex = value;
            });
        }
      )


    );
  }
}
