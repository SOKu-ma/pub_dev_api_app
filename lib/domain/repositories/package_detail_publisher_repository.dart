import 'package:pub_dev_api_app/domain/entitis/package_detail_publisher_entity.dart';

abstract class PackageDetailPublisherRepository {
  Future<PackageDetailPublisherEntity> fetchPublisherId(String packageName);
}
