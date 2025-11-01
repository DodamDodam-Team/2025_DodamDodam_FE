import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

final String backend_url = 'nonmutably-commotional-shoshana.ngrok-free.dev';

void testAuthApi() async {
  final viewModel = AuthViewModel();
  print("Auth Api Test");

  final username = 'testUser1';
  final password = 'testPassword1';

  // 회원가입 동작 테스트
  try {
    await viewModel.join(username: username, password: password);
  } catch (e) {
    print(e);
  }

  // 로그인 동작 테스트
  try {
    await viewModel.login(username: username, password: password);
  } catch (e) {
    print(e);
  }
  // 토큰 저장 확인
  //String? token = await S2Manager.readData('ACCESS_TOKEN');
  //print('ACCESS_TOKEN: $token');
}

void main() {
  testAuthApi();
}

class AuthViewModel {
  late final HttpRepository _repository = HttpRepository();

  Future<void> login({
    required String username,
    required String password,
  }) async {
    try {
      final data = await _repository.post(
        url_string: backend_url,
        end_point: '/api/login',
        params: null,
        headers: {'accept': '*/*', 'Content-Type': 'application/json'},
        body: {'username': username, 'password': password},
      );

      log(
        '[DEBUG:LOGIN] ACCESS_TOKEN = ${data['token']}',
        name: 'AuthViewModel.login',
      );
      //S2Manager.saveData('ACCESS_TOKEN', data['token']);
    } catch (e) {
      throw Exception('Failed to login : $e');
    }
  }

  /// TODO:
  /// api 명세 업데이트 내역 확인 후 request body 재설정 필요
  Future<void> join({
    required String username,
    required String password,
  }) async {
    try {
      final data = await _repository.post(
        url_string: backend_url,
        end_point: '/api/join',
        params: null,
        headers: {'accept': '*/*', 'Content-Type': 'application/json'},
        body: {'username': username, 'password': password},
      );

      log('[DEBUG:JOIN] ACCESS_TOKEN = ${data}', name: 'AuthViewModel.join');
    } catch (e) {
      throw Exception('Failed to join : $e');
    }
  }

  Future<void> fetchUserInfo() async {
    try {
      final data = await _repository.get(
        url_string: backend_url,
        end_point: '/api/info',
        params: null,
        headers: {'accept': '*/*'},
      );

      log(
        '[DEBUG:JOIN] ACCESS_TOKEN = ${data}',
        name: 'AuthViewModel.fetchUserInfo',
      );
    } catch (e) {
      throw Exception('Failed to fetch user info : $e');
    }
  }
}

class HttpRepository {
  Future<Map<String, dynamic>> get({
    required String url_string,
    required String end_point,
    required Map<String, dynamic>? params,
    required Map<String, String> headers,
  }) async {
    final url = Uri.https(url_string, end_point, params);
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
    required Map<String, dynamic>? params,
    required Map<String, String> headers,
    required Map<String, dynamic> body,
  }) async {
    final url = Uri.https(url_string, end_point, params);
    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

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
    required Map<String, dynamic>? params,
    required Map<String, String> headers,
    required Map<String, dynamic> body,
  }) async {
    final url = Uri.https(url_string, end_point, params);
    final response = await http.put(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      return data;
    } else {
      throw Exception("$end_point : ${response.statusCode}");
    }
  }
}
