import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_app_001/json_placeholder.dart';
import 'package:dio/dio.dart' as diop;

part 'api.g.dart';

@riverpod
class ApiClass extends _$ApiClass {
  final String url = 'https://jsonplaceholder.typicode.com/posts';

  Future<JsonPosts> _fetch() async {
    diop.Dio dio = diop.Dio();
    try {
      diop.Response response = await dio.get(url);
      if(response.statusCode == HttpStatus.ok){
      return JsonPosts.fromJson(response.data);
      }
    } on diop.DioException catch (e) {
      log(e.response?.data ?? 'No Error response',
          error: e.error, stackTrace: e.stackTrace, name: 'Error on api.dart');
    }
    return JsonPosts(placeHolders: []);
  }

  @override
  FutureOr<JsonPosts> build() async {
    return _fetch();
  }
}
