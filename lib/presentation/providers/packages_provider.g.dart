// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packages_provider.dart';

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
          PackagesRepository,
          PackagesRepository,
          PackagesRepository
        >
    with $Provider<PackagesRepository> {
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
  $ProviderElement<PackagesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PackagesRepository create(Ref ref) {
    return packageRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PackagesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PackagesRepository>(value),
    );
  }
}

String _$packageRepositoryHash() => r'fd43879a0f0c6f2826d1c9ea2787780f939b5815';

@ProviderFor(packageListUseCase)
const packageListUseCaseProvider = PackageListUseCaseProvider._();

final class PackageListUseCaseProvider
    extends
        $FunctionalProvider<PackagesUseCase, PackagesUseCase, PackagesUseCase>
    with $Provider<PackagesUseCase> {
  const PackageListUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'packageListUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$packageListUseCaseHash();

  @$internal
  @override
  $ProviderElement<PackagesUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PackagesUseCase create(Ref ref) {
    return packageListUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PackagesUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PackagesUseCase>(value),
    );
  }
}

String _$packageListUseCaseHash() =>
    r'ecfcaefbae3d50983b833e147db012c85f7bd1d5';

@ProviderFor(packagesEntity)
const packagesEntityProvider = PackagesEntityProvider._();

final class PackagesEntityProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<PackagesEntity>>,
          List<PackagesEntity>,
          FutureOr<List<PackagesEntity>>
        >
    with
        $FutureModifier<List<PackagesEntity>>,
        $FutureProvider<List<PackagesEntity>> {
  const PackagesEntityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'packagesEntityProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$packagesEntityHash();

  @$internal
  @override
  $FutureProviderElement<List<PackagesEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<PackagesEntity>> create(Ref ref) {
    return packagesEntity(ref);
  }
}

String _$packagesEntityHash() => r'06d7220302f5548d1f4a1718a74338e05ccbd366';
