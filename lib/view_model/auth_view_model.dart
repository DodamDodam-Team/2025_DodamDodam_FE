import 'dart:developer';

import 'package:dodamdodam_fe/config/constants.dart';
import 'package:dodamdodam_fe/repository/http_repository.dart';
import 'package:dodamdodam_fe/service/secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_view_model.g.dart';

@Riverpod(keepAlive: true)
class AuthViewModel extends _$AuthViewModel {
  late final HttpRepository _repository = ref.watch(httpRepositoryProvider);

  @override
  int build() {
    return 0;
  }

  Future<void> login(String username, String password) async {
    try {
      final data = await _repository.post(
        url_string: backend_url,
        end_point: '/api/login',
        params: null,
        headers: {},
        body: {'username': username, 'password': password},
      );

      log(
        '[DEBUG:LOGIN] ACCESS_TOKEN = ${data['token']}',
        name: 'AuthViewModel.login',
      );
      S2Manger.saveData('ACCESS_TOKEN', data['token']);
    } catch (e) {
      throw Exception('Failed to login : $e');
    }
  }
}
