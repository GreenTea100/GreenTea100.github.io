import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<String> getBaseUrl() async {
  // await dotenv.load();
  return dotenv.get('API_ENDPOINT', fallback:"http://10.0.2.2:8000");
}

Future<String> login(Object? body) async {
  final baseUrl = await getBaseUrl();
  final response = await http.post(Uri.parse('$baseUrl/auth/local'),
      body: body,
  );

  if (response.statusCode == 200) {
    // 만약 서버가 OK 응답을 반환하면, JSON을 파싱합니다.
    return utf8.decode(response.bodyBytes); // Post.fromJson(json.decode(response.body));
  } else {
    // 만약 응답이 OK가 아니면, 에러를 던집니다.
    throw Exception('Failed to load post');
  }
}

Future<String> fetchPost(String path, Object? body, {String? token}) async {
  final baseUrl = await getBaseUrl();
  final response = await http.post(Uri.parse('$baseUrl$path'),
    body: jsonEncode(body),
    headers: token == null? {
    'Content-Type':'application/json',
      'Accept': 'application/json',
    } : {
      'Content-Type':'application/json',
      'Accept': 'application/json',
      "Authorization": 'Bearer ${token}',
    }
  );

  if (response.statusCode == 200) {
    // 만약 서버가 OK 응답을 반환하면, JSON을 파싱합니다.
    return utf8.decode(response.bodyBytes); // Post.fromJson(json.decode(response.body));
  } else {
    // 만약 응답이 OK가 아니면, 에러를 던집니다.
  print(response.body);
    throw Exception('Failed to load post');
  }
}

Future<String> fetchGet(String path) async {
  final baseUrl = await getBaseUrl();
  final response = await http.get(Uri.parse('$baseUrl$path'));

  if (response.statusCode == 200) {
    // 만약 서버가 OK 응답을 반환하면, JSON을 파싱합니다.
    return utf8.decode(response.bodyBytes); // Post.fromJson(json.decode(response.body));
  } else {
    // 만약 응답이 OK가 아니면, 에러를 던집니다.
    throw Exception('Failed to load post');
  }
}

Future<String> fetchPut(String path, Object? body) async {
  final baseUrl = await getBaseUrl();
  final response = await http.put(Uri.parse('$baseUrl$path'),
      body: body
  );

  if (response.statusCode == 200) {
    // 만약 서버가 OK 응답을 반환하면, JSON을 파싱합니다.
    return utf8.decode(response.bodyBytes); // Post.fromJson(json.decode(response.body));
  } else {
    // 만약 응답이 OK가 아니면, 에러를 던집니다.
    throw Exception('Failed to load post');
  }
}
