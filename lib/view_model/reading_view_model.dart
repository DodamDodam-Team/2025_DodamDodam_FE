import 'dart:developer';

import 'package:dodamdodam_fe/config/constants.dart';
import 'package:dodamdodam_fe/repository/http_repository.dart';
import 'package:dodamdodam_fe/service/secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reading_view_model.g.dart';

@Riverpod(keepAlive: true)
class ReadingViewModel extends _$ReadingViewModel {
  late final HttpRepository _repository = ref.watch(httpRepositoryProvider);

  @override
  int build() {
    return 0;
  }

  Future<void> createReadingRecord({
    required String date,
    required String startTime,
    required String endTime,
    required int pagesRead,
    required String thought,
  }) async {
    final int userid = 1; //TODO: Userid 받아오기
    try {
      final data = await _repository.post(
        url_string: backend_url,
        end_point: '/api/records/users/${userid}',
        params: null,
        headers: {
          'accept': '*/*',
          'Content-Type': 'application/json',
        }, // TODO: JWT 토큰 추가
        body: {
          "date": date,
          "startTime": startTime,
          "endTime": endTime,
          "pagesRead": pagesRead,
          "thought": thought,
        },
      );

      log(
        '[DEBUG:CREATE_RECORD] response.body = ${data}',
        name: 'AuthViewModel.createReadingRecord',
      );
    } catch (e) {
      throw Exception('Failed to create reading record: $e');
    }
  }

  Future<void> fetchMonthlyReadingRecord({required String month}) async {
    final int userid = 1; //TODO: Userid 받아오기
    try {
      final data = await _repository.get(
        url_string: backend_url,
        end_point: '/api/summary/mothly/users/${userid}',
        params: {'month': month},
        headers: {
          'accept': '*/*',
          'Content-Type': 'application/json',
        }, // TODO: JWT 토큰 추가
      );

      log(
        '[DEBUG:FETCH_RECORD] response.body = ${data}',
        name: 'AuthViewModel.fetchMonthlyReadingRecord',
      );
    } catch (e) {
      throw Exception('Failed to fetch monthly reading record : $e');
    }
  }
}
