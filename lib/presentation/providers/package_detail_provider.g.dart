// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(apiClient)
const apiClientProvider = ApiClientProvider._();

final class ApiClientProvider
    extends $FunctionalProvider<ApiClient, ApiClient, ApiClient>
    with $Provider<ApiClient> {
  const ApiClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'apiClientProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$apiClientHash();

  @$internal
  @override
  $ProviderElement<ApiClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ApiClient create(Ref ref) {
    return apiClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ApiClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ApiClient>(value),
    );
  }
}

String _$apiClientHash() => r'a0eb8837fc3cfc2ac414f9bdd23761e2186e929e';

@ProviderFor(packageRepository)
const packageRepositoryProvider = PackageRepositoryProvider._();

final class PackageRepositoryProvider
    extends
        $FunctionalProvider<
          PackageDetailRepository,
          PackageDetailRepository,
          PackageDetailRepository
        >
    with $Provider<PackageDetailRepository> {
  const PackageRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'packageRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$packageRepositoryHash();

  @$internal
  @override
  $ProviderElement<PackageDetailRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PackageDetailRepository create(Ref ref) {
    return packageRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PackageDetailRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PackageDetailRepository>(value),
    );
  }
}

String _$packageRepositoryHash() => r'9b77aa23efe4c1b0e1b8c85c3f6fc88ff7257546';

@ProviderFor(packageDetailUseCase)
const packageDetailUseCaseProvider = PackageDetailUseCaseProvider._();

final class PackageDetailUseCaseProvider
    extends
        $FunctionalProvider<
          PackageDetailUseCase,
          PackageDetailUseCase,
          PackageDetailUseCase
        >
    with $Provider<PackageDetailUseCase> {
  const PackageDetailUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'packageDetailUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$packageDetailUseCaseHash();

  @$internal
  @override
  $ProviderElement<PackageDetailUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PackageDetailUseCase create(Ref ref) {
    return packageDetailUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PackageDetailUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PackageDetailUseCase>(value),
    );
  }
}

String _$packageDetailUseCaseHash() =>
    r'94f1ac1d0223c6f5772389fb3bd0e4d8b4584d9b';

@ProviderFor(packageDetailEntity)
const packageDetailEntityProvider = PackageDetailEntityFamily._();

final class PackageDetailEntityProvider
    extends
        $FunctionalProvider<
          AsyncValue<PackageDetailEntity>,
          PackageDetailEntity,
          FutureOr<PackageDetailEntity>
        >
    with
        $FutureModifier<PackageDetailEntity>,
        $FutureProvider<PackageDetailEntity> {
  const PackageDetailEntityProvider._({
    required PackageDetailEntityFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'packageDetailEntityProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$packageDetailEntityHash();

  @override
  String toString() {
    return r'packageDetailEntityProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<PackageDetailEntity> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PackageDetailEntity> create(Ref ref) {
    final argument = this.argument as String;
    return packageDetailEntity(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PackageDetailEntityProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$packageDetailEntityHash() =>
    r'da2f5c4b895a4bdbc46da8e50eeca2d810ab841a';

final class PackageDetailEntityFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<PackageDetailEntity>, String> {
  const PackageDetailEntityFamily._()
    : super(
        retry: null,
        name: r'packageDetailEntityProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PackageDetailEntityProvider call(String packageName) =>
      PackageDetailEntityProvider._(argument: packageName, from: this);

  @override
  String toString() => r'packageDetailEntityProvider';
}
