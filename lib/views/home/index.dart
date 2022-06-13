import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mycar/utils/fetchs.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key, required this.userData}) : super(key: key);
  final dynamic userData;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<String> future_post;


  @override
  void initState() {
    future_post = fetchGet("/books?users_permissions_user=${widget.userData['user']['id']}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: future_post,
      builder: (context, snapshot) {

        if (snapshot.hasData) {
          var data = jsonDecode(snapshot.data ?? "[]") as List<dynamic>;
          return _buildlist(data);//Text("${snapshot.data}");

        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // 기본적으로 로딩 Spinner를 보여줍니다.
        return const CircularProgressIndicator();
      },
    );
  }
}


Widget _buildlist(data) => ListView(
  shrinkWrap: true,
  children: [...data.map((value) {
    return _tile(value);
  })],
);

ListTile _tile(data){
  return ListTile(
    title: Text(data['logtitle']),
    subtitle: Text(data['users_permissions_user']['username']),
  );
}

