// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QuizViewModel)
const quizViewModelProvider = QuizViewModelProvider._();

final class QuizViewModelProvider
    extends $NotifierProvider<QuizViewModel, int> {
  const QuizViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quizViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quizViewModelHash();

  @$internal
  @override
  QuizViewModel create() => QuizViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$quizViewModelHash() => r'ffca58ee2a07f5db36627b1125680d3124f1131d';

abstract class _$QuizViewModel extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
