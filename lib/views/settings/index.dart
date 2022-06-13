import 'package:flutter/material.dart';
import 'package:mycar/loginpage.dart';
import '../../registerpage.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),

      child: Center(
      child: GestureDetector(
        onTap: ()=> FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
          children: <Widget> [
            const Text("내 정보",style: TextStyle(fontSize: 20)),
            const Padding(padding: EdgeInsets.all(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget> [
                Text("아이디:",style: TextStyle(fontSize: 14)),
                Text("to3644101",style: TextStyle(fontSize: 14)),
              ]

            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const <Widget> [
                  Text("이메일:",style: TextStyle(fontSize: 14)),
                  Text("to3644101@naver.com:",style: TextStyle(fontSize: 14)),
                ]

            ),



            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                ElevatedButton(
                  //heroTag: 'sad',
                    onPressed: (){
                      
                      Navigator.push(context, MaterialPageRoute(builder: (context) => registerpage(),));
                    },
                    child: const Text("로그아웃")
                )
              ],
            )
                ],
              )
            ),



              //Padding(padding: EdgeInsets.all(60)),

            ),

    ),);
  }
}