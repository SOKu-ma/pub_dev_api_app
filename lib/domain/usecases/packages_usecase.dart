import 'package:pub_dev_api_app/domain/entitis/packages_entity.dart';
import 'package:pub_dev_api_app/domain/repositories/packages_repository.dart';

abstract class PackagesUseCase {
  Future<List<PackagesEntity>> execute();
}

class PackagesUseCaseImpl implements PackagesUseCase {
  final PackagesRepository _repository;

  PackagesUseCaseImpl(this._repository);

  @override
  Future<List<PackagesEntity>> execute() {
    return _repository.fetchPackagesList();
  }
}
