import 'package:pub_dev_api_app/domain/entitis/package_detail_entity.dart';
import 'package:pub_dev_api_app/domain/repositories/package_detail_repository.dart';

abstract class PackageDetailUseCase {
  Future<PackageDetailEntity> execute(String packageName);
}

class PackageDetailUseCaseImpl implements PackageDetailUseCase {
  final PackageDetailRepository _repository;

  PackageDetailUseCaseImpl({required PackageDetailRepository repository})
    : _repository = repository;

  @override
  Future<PackageDetailEntity> execute(String packageName) {
    return _repository.fetchPackageDetail(packageName);
  }
}
