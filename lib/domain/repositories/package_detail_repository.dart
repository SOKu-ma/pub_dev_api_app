import 'package:pub_dev_api_app/domain/entitis/package_detail_entity.dart';

abstract class PackageDetailRepository {
  Future<PackageDetailEntity> fetchPackageDetail(String packageName);
}
