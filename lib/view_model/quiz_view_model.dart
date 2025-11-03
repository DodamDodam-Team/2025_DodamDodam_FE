import 'dart:developer';

import 'package:dodamdodam_fe/config/constants.dart';
import 'package:dodamdodam_fe/repository/http_repository.dart';
import 'package:dodamdodam_fe/service/secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_view_model.g.dart';

@Riverpod(keepAlive: true)
class QuizViewModel extends _$QuizViewModel {
  late final HttpRepository _repository = ref.watch(httpRepositoryProvider);

  @override
  int build() {
    return 0;
  }

  Future<void> submitQuizAnswer({
    required int quizId,
    required List answers, // TODO: answers 타입 정하기,
  }) async {
    try {
      final data = await _repository.post(
        url_string: backend_url,
        end_point: '/api/quiz/submit',
        params: null,
        headers: {
          'accept': '*/*',
          'Content-Type': 'application/json',
        }, // TODO: JWT 토큰 추가
        body: {
          "quizId": quizId,
          "answers": answers
              .map(
                (e) => e.toString(),
                /**toJson으로 변환 */
              )
              .toList(),
        },
      );

      log(
        '[DEBUG:SUBMIT_ANSWER] response.body = ${data}',
        name: 'AuthViewModel.submitQuizAnswer',
      );
    } catch (e) {
      throw Exception('Failed to submit quiz answer: $e');
    }
  }

  Future<void> fetchQuiz({required int bookId}) async {
    try {
      final data = await _repository.get(
        url_string: backend_url,
        end_point: '/api/squiz/book/${bookId}',
        params: null,
        headers: {
          'accept': '*/*',
          'Content-Type': 'application/json',
        }, // TODO: JWT 토큰 추가
      );

      log(
        '[DEBUG:FETCH_QUIZ] response.body = ${data}',
        name: 'AuthViewModel.fetchQuiz',
      );
    } catch (e) {
      throw Exception('Failed to fetch quiz : $e');
    }
  }
}
