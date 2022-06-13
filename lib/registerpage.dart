import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class registerpage extends StatelessWidget{
  //const registerpage({Key? key}) : super(key: key);
final _idTextField = TextEditingController();
final _pwTextField = TextEditingController();
final _pwreTextField = TextEditingController();
final _emailTextField = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("회원가입")),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: GestureDetector(
            onTap: ()=> FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextField(
                controller: _idTextField,
              decoration: const InputDecoration(
              labelText: '아이디',
              hintText: '',
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                borderSide: BorderSide(width: 1, color: Colors.blue),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              TextField(
                controller: _pwTextField,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: '패스워드',
                  hintText: '',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(width: 1, color: Colors.blue),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              TextField(
                controller: _pwreTextField,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: '패스워드 확인',
                  hintText: '',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(width: 1, color: Colors.blue),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              TextField(
                controller: _emailTextField,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: '이메일',
                  hintText: '',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(width: 1, color: Colors.blue),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                  onPressed: (){
                    print(_idTextField.text);
                    print(_pwTextField.text);
                    print(_pwreTextField.text);
                    print(_emailTextField.text);
                  },
                  child: const Text("가입")
              ),
                 ],
              ),
          ),

        ),

      )
    )
    );
  }


}