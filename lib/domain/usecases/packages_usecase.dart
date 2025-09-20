import 'package:pub_dev_api_app/domain/entitis/packages_entity.dart';

abstract class PackagesUseCase {
  Future<List<PackagesEntity>> execute();
}
