import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mycar/registerpage.dart';
import 'package:mycar/utils/fetchs.dart';
class loginpage extends StatelessWidget {
  loginpage({Key? key, required this.setUserData}) : super(key: key);
  final Function setUserData;
  final _idTextEditController = TextEditingController();
  final _pwTextEditController = TextEditingController();

  void idpwToast() {
    Fluttertoast.showToast(
        msg: '아이디 및 비밀번호를 확인해주세요',
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT
    );
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title:Text("로그인")),
      body: Padding(
        padding: EdgeInsets.all(30),

        child: Center(
          child: GestureDetector(
            onTap: ()=> FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
                child: Column(
                  children: <Widget> [
                    const Text("로그인",style: TextStyle(fontSize: 20)),
                    const Padding(padding: EdgeInsets.all(20)),
                    Container(
                      child:
                      TextField(
                        controller: _idTextEditController,
                        decoration: const InputDecoration(
                          labelText: '아이디',
                          hintText: '아이디를 입력하세요',
                          //labelStyle: TextStyle(color: Colors.blue),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              borderSide: BorderSide(color: Colors.blue,width: 2)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(width: 1, color: Colors.blue),),
                        ),

                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    TextField(
                      controller: _pwTextEditController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: '비밀번호',
                        hintText: '비밀번호를 입력하세요',
                        //labelStyle: TextStyle(color: Colors.blue),

                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(color: Colors.blue,width: 2)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(width: 1, color: Colors.blue),),
                      ),
                    ),


                    const Padding(padding: EdgeInsets.all(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget> [
                        ElevatedButton(

                            onPressed: (){

                              login({'identifier': 'ex123@naver.com', 'password':'123456'})
                                  .then((value) => { setUserData(jsonDecode(value)) });

                              /*
                              login({'identifier': _idTextEditController.text, 'password': _pwTextEditController.text})
                                     .then((value) => { setUserData(jsonDecode(value)) });
                              */
                            },
                            child: const Text("로그인")
                        ),
                        ElevatedButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => registerpage(),));
                            },
                            child: const Text("회원가입")
                        )
                      ],
                    )
                  ],
                )
            ),



            //Padding(padding: EdgeInsets.all(60)),

          ),

        ),
      ),

    );
  }
}
