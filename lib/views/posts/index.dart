import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mycar/utils/fetchs.dart';

class PostsView extends StatefulWidget {
  const PostsView({Key? key}) : super(key: key);

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  late Future<String> future_post;


  @override
  void initState() {
    future_post = fetchGet("/posts?_sort=date:DESC");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: future_post,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = jsonDecode(snapshot.data ?? "[]") as List<dynamic>;
          return _buildList(data);

        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // 기본적으로 로딩 Spinner를 보여줍니다.
        return const CircularProgressIndicator();
      },

    );
  }
}




Widget _buildList(data) => ListView(
  shrinkWrap: true,
  children: [...data.map((value){
    return _tile(value);
  })],
);

ListTile _tile(data) => ListTile(
  title: Text(data['title']),
  subtitle: Text(data['users_permissions_user']['username']),
);