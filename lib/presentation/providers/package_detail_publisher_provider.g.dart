// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_detail_publisher_provider.dart';

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

@ProviderFor(packageDetailPublisherEntity)
const packageDetailPublisherEntityProvider =
    PackageDetailPublisherEntityFamily._();

final class PackageDetailPublisherEntityProvider
    extends
        $FunctionalProvider<
          AsyncValue<PackageDetailPublisherEntity>,
          PackageDetailPublisherEntity,
          FutureOr<PackageDetailPublisherEntity>
        >
    with
        $FutureModifier<PackageDetailPublisherEntity>,
        $FutureProvider<PackageDetailPublisherEntity> {
  const PackageDetailPublisherEntityProvider._({
    required PackageDetailPublisherEntityFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'packageDetailPublisherEntityProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$packageDetailPublisherEntityHash();

  @override
  String toString() {
    return r'packageDetailPublisherEntityProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<PackageDetailPublisherEntity> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PackageDetailPublisherEntity> create(Ref ref) {
    final argument = this.argument as String;
    return packageDetailPublisherEntity(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PackageDetailPublisherEntityProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$packageDetailPublisherEntityHash() =>
    r'f0ec4031d05e9b263757ab58f18122a35a6cb98b';

final class PackageDetailPublisherEntityFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<PackageDetailPublisherEntity>,
          String
        > {
  const PackageDetailPublisherEntityFamily._()
    : super(
        retry: null,
        name: r'packageDetailPublisherEntityProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PackageDetailPublisherEntityProvider call(String packageName) =>
      PackageDetailPublisherEntityProvider._(argument: packageName, from: this);

  @override
  String toString() => r'packageDetailPublisherEntityProvider';
}

@ProviderFor(packageDetailPublisherUseCase)
const packageDetailPublisherUseCaseProvider =
    PackageDetailPublisherUseCaseProvider._();

final class PackageDetailPublisherUseCaseProvider
    extends
        $FunctionalProvider<
          PackageDetailPublisherUseCase,
          PackageDetailPublisherUseCase,
          PackageDetailPublisherUseCase
        >
    with $Provider<PackageDetailPublisherUseCase> {
  const PackageDetailPublisherUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'packageDetailPublisherUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$packageDetailPublisherUseCaseHash();

  @$internal
  @override
  $ProviderElement<PackageDetailPublisherUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PackageDetailPublisherUseCase create(Ref ref) {
    return packageDetailPublisherUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PackageDetailPublisherUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PackageDetailPublisherUseCase>(
        value,
      ),
    );
  }
}

String _$packageDetailPublisherUseCaseHash() =>
    r'c77634d212c5b779ff8bcaa5d86f75a3dcffcc47';

@ProviderFor(packageDetailPublisherRepository)
const packageDetailPublisherRepositoryProvider =
    PackageDetailPublisherRepositoryProvider._();

final class PackageDetailPublisherRepositoryProvider
    extends
        $FunctionalProvider<
          PackageDetailPublisherRepository,
          PackageDetailPublisherRepository,
          PackageDetailPublisherRepository
        >
    with $Provider<PackageDetailPublisherRepository> {
  const PackageDetailPublisherRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'packageDetailPublisherRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$packageDetailPublisherRepositoryHash();

  @$internal
  @override
  $ProviderElement<PackageDetailPublisherRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PackageDetailPublisherRepository create(Ref ref) {
    return packageDetailPublisherRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PackageDetailPublisherRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PackageDetailPublisherRepository>(
        value,
      ),
    );
  }
}

String _$packageDetailPublisherRepositoryHash() =>
    r'256a4985329a92e017f6f9163476bd17150e91f1';
