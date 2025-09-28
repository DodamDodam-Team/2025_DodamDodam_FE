// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(httpRepository)
const httpRepositoryProvider = HttpRepositoryProvider._();

final class HttpRepositoryProvider
    extends $FunctionalProvider<HttpRepositroy, HttpRepositroy, HttpRepositroy>
    with $Provider<HttpRepositroy> {
  const HttpRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'httpRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$httpRepositoryHash();

  @$internal
  @override
  $ProviderElement<HttpRepositroy> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HttpRepositroy create(Ref ref) {
    return httpRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HttpRepositroy value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HttpRepositroy>(value),
    );
  }
}

String _$httpRepositoryHash() => r'04a0e6ce9826189604fccc600ec255b6e328bdcc';
