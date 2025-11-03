// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reading_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ReadingViewModel)
const readingViewModelProvider = ReadingViewModelProvider._();

final class ReadingViewModelProvider
    extends $NotifierProvider<ReadingViewModel, int> {
  const ReadingViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'readingViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$readingViewModelHash();

  @$internal
  @override
  ReadingViewModel create() => ReadingViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$readingViewModelHash() => r'144454a641509e82d2e7061d109df3f2af374ee4';

abstract class _$ReadingViewModel extends $Notifier<int> {
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
