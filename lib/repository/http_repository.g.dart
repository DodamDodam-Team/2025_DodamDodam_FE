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
    extends $FunctionalProvider<HttpRepository, HttpRepository, HttpRepository>
    with $Provider<HttpRepository> {
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
  $ProviderElement<HttpRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HttpRepository create(Ref ref) {
    return httpRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HttpRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HttpRepository>(value),
    );
  }
}

String _$httpRepositoryHash() => r'8fb5b2ba8474aca7193b0af891fffe00391d2913';
