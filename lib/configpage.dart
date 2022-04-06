


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class config2page extends StatefulWidget {
  const config2page({Key? key}) : super(key: key);

  @override
  State<config2page> createState() => _config2pageState();
}





class _config2pageState extends State<config2page> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class configpage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: Text('설정'),
        ),
        body: Column(
          var loginSelction
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            CupertinoIcons.add,color: Colors.white,
          ),
          backgroundColor: Colors.cyan[10],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

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
    )
    );

  }

}


