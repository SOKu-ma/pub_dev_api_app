// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_full_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(packageFullDetailEntity)
const packageFullDetailEntityProvider = PackageFullDetailEntityFamily._();

final class PackageFullDetailEntityProvider
    extends
        $FunctionalProvider<
          AsyncValue<PackageFullDetailEntity>,
          PackageFullDetailEntity,
          FutureOr<PackageFullDetailEntity>
        >
    with
        $FutureModifier<PackageFullDetailEntity>,
        $FutureProvider<PackageFullDetailEntity> {
  const PackageFullDetailEntityProvider._({
    required PackageFullDetailEntityFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'packageFullDetailEntityProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$packageFullDetailEntityHash();

  @override
  String toString() {
    return r'packageFullDetailEntityProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<PackageFullDetailEntity> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PackageFullDetailEntity> create(Ref ref) {
    final argument = this.argument as String;
    return packageFullDetailEntity(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PackageFullDetailEntityProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$packageFullDetailEntityHash() =>
    r'9badd8abea7f4c25bca269c54582346f2acc59c1';

final class PackageFullDetailEntityFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<PackageFullDetailEntity>, String> {
  const PackageFullDetailEntityFamily._()
    : super(
        retry: null,
        name: r'packageFullDetailEntityProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PackageFullDetailEntityProvider call(String packageName) =>
      PackageFullDetailEntityProvider._(argument: packageName, from: this);

  @override
  String toString() => r'packageFullDetailEntityProvider';
}
