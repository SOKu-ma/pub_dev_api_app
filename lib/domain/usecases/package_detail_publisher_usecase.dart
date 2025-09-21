import 'package:pub_dev_api_app/domain/entitis/package_detail_publisher_entity.dart';
import 'package:pub_dev_api_app/domain/repositories/package_detail_publisher_repository.dart';

abstract class PackageDetailPublisherUseCase {
  Future<PackageDetailPublisherEntity> execute(String packageName);
}

class PackageDetailPublisherUseCaseImpl
    implements PackageDetailPublisherUseCase {
  final PackageDetailPublisherRepository _repository;

  PackageDetailPublisherUseCaseImpl({
    required PackageDetailPublisherRepository repository,
  }) : _repository = repository;

  @override
  Future<PackageDetailPublisherEntity> execute(String packageName) {
    return _repository.fetchPublisherId(packageName);
  }
}
