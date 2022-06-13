import 'package:flutter/material.dart';
import 'package:mycar/utils/fetchs.dart';



class postwrite extends StatelessWidget {
  postwrite({Key? key, required this.userData}) : super(key: key);
  final dynamic userData;
  final _titleTextField = TextEditingController();
  final _contentTextField = TextEditingController();


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
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("게시글 작성하기")),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: GestureDetector(
            onTap: ()=> FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget> [

                    TextField(
                      controller: _titleTextField,
                      decoration: const InputDecoration(
                        labelText: '제목',
                        hintText: '제목을 입력해주세요',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(width: 1, color: Colors.blue),
                        ),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(10)),
                    TextField(
                      controller: _contentTextField,
                      decoration: const InputDecoration(
                        labelText: '내용',
                        hintText: '내용을 입력해주세요',
                        //labelStyle: TextStyle(color: Colors.blue),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(width: 1, color: Colors.blue),
                        ),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(10)),

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
          fetchPost('/posts',
              {
                'title':_titleTextField.text,
                'content':_contentTextField.text,
                'date':"2022-06-13",
                'users_permissions_user': userData['user']['id']
              },
              token: userData['jwt'])
              .then((value) => Navigator.pop(context));
        },
      ),


    );
  }
}
