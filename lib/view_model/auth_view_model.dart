import 'package:dodamdodam_fe/config/constants.dart';
import 'package:dodamdodam_fe/repository/http_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_view_model.g.dart';

@Riverpod(keepAlive: true)
class AuthViewModel extends _$AuthViewModel {
  late final HttpRepository _repository = ref.watch(httpRepositoryProvider);

  @override
  int build() {
    return 0;
  }
}
