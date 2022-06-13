import 'package:flutter/material.dart';
import 'package:mycar/utils/fetchs.dart';
import 'package:date_time_picker/date_time_picker.dart';


class bookpage extends StatelessWidget {
  bookpage({Key? key, required this.userData}) : super(key: key);
  final dynamic userData;
  final myController = TextEditingController();
  final _dateTextField = TextEditingController();
  final _titleTextField = TextEditingController();
  final _wonTextField = TextEditingController();
  final _literpriceTextField = TextEditingController();
  final _kmTextField = TextEditingController();

  String title = '';
  int won = 0;
  int literprice  = 0;
  double liter = 0;
  double km = 0;
  String logdate = '';
  //텍스트필드에서
  //DateFormat('yyyy/MM/dd').format(DateTime.parse(date)).toString();

  @override
  void initState(){
    //super.initState();

    myController.addListener(() {_printLatestValue;});
  }
  @override
  void dispose(){
    myController.dispose();
    //super.dispose();
  }

  _printLatestValue(){
    print("sec: ${myController.text}");
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: const Text("기록하기")),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Center(
          child: GestureDetector(
            onTap: ()=> FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget> [
                    TextField(
                      controller: _dateTextField,
                      keyboardType: TextInputType.datetime,
                      decoration: const InputDecoration(
                        labelText: '날짜',
                        hintText: '날짜을 입력해주세요',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(width: 1, color: Colors.blue),
                        ),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(10)),
                    TextField(
                      controller: _titleTextField,
                      decoration: const InputDecoration(
                        labelText: '내용',
                        hintText: '내용을 입력해주세요',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(width: 1, color: Colors.blue),
                        ),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(10)),
                    TextField(
                      controller: _wonTextField,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: '주유금액(원)',
                        hintText: '주유금액을 입력해주세요',
                        //labelStyle: TextStyle(color: Colors.blue),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(width: 1, color: Colors.blue),
                        ),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(10)),
                    TextField(
                      controller: _literpriceTextField,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: '단가(원)',
                        hintText: '단가를 입력해주세요',
                        //labelStyle: TextStyle(color: Colors.blue),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(width: 1, color: Colors.blue),
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    TextField(
                      controller: _kmTextField,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: '누적주행거리(Km)',
                        hintText: '누적주행거리를 입력해주세요',
                        //labelStyle: TextStyle(color: Colors.blue),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(width: 1, color: Colors.blue),
                        ),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(20)),
                  ]
              ),
            ),
          ),
        ),
      ),



      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'bookTagg',
        label: Row(
          children: [Icon(Icons.save), Text('저장')],
        ),
        onPressed: () {
        fetchPost('/books',
            {
              'logtitle':_titleTextField.text,
              'won':_wonTextField.text,
              'literprice':_literpriceTextField.text,
              'km':_kmTextField.text,
              'logdate':"2022-06-13",
              'users_permissions_user': userData['user']['id']
            },
              token: userData['jwt'])
            .then((value) => Navigator.pop(context));
      },
      ),


    );
  }
}
