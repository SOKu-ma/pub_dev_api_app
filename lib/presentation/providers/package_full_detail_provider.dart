import 'package:pub_dev_api_app/domain/entitis/package_full_detail_entity.dart';
import 'package:pub_dev_api_app/presentation/providers/package_detail_provider.dart';
import 'package:pub_dev_api_app/presentation/providers/package_detail_publisher_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'package_full_detail_provider.g.dart';

/// 詳細画面のデータをまとめて取得するプロバイダー
@riverpod
Future<PackageFullDetailEntity> packageFullDetailEntity(
  Ref ref,
  String packageName,
) async {
  final packageDetail = await ref.watch(
    packageDetailEntityProvider(packageName).future,
  );
  final publisherDetail = await ref.watch(
    packageDetailPublisherEntityProvider(packageName).future,
  );

  return PackageFullDetailEntity(
    name: packageDetail.name,
    description: packageDetail.description,
    versions: packageDetail.versions,
    publisherId: publisherDetail.publisherId,
  );
}
