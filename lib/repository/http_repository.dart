import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'http_repository.g.dart';

@Riverpod(keepAlive: true)
HttpRepositroy httpRepository(Ref ref) {
  return HttpRepositroy();
}

class HttpRepositroy {
  Future<Map<String, dynamic>> get({
    required String url_string,
    required String end_point,
    required Map<String, dynamic> params,
    required Map<String, String> headers,
  }) async {
    final url = Uri.http(url_string, end_point, params);
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      return data;
    } else {
      throw Exception("$end_point : ${response.statusCode}");
    }
  }

  Future<Map<String, dynamic>> post({
    required String url_string,
    required String end_point,
    required Map<String, dynamic> params,
    required Map<String, String> headers,
    required Map<String, dynamic> body,
  }) async {
    final url = Uri.http(url_string, end_point, params);
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      return data;
    } else {
      throw Exception("$end_point : ${response.statusCode}");
    }
  }

  Future<Map<String, dynamic>> put({
    required String url_string,
    required String end_point,
    required Map<String, dynamic> params,
    required Map<String, String> headers,
    required Map<String, dynamic> body,
  }) async {
    final url = Uri.http(url_string, end_point, params);
    final response = await http.put(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      return data;
    } else {
      throw Exception("$end_point : ${response.statusCode}");
    }
  }
}
