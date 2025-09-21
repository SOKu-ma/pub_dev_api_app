import 'package:pub_dev_api_app/domain/entitis/packages_entity.dart';
import 'package:pub_dev_api_app/domain/repositories/packages_repository.dart';
import 'package:pub_dev_api_app/infrastructure/api/api_client.dart';

class PackagesRepositoryImpl implements PackagesRepository {
  final ApiClient _apiClient;
  PackagesRepositoryImpl(this._apiClient);

  @override
  Future<List<PackagesEntity>> fetchPackagesList() async {
    try {
      final data = await _apiClient.get('https://pub.dev/api/packages');
      final packages = (data['packages'] as List)
          .map((pkg) => PackagesEntity(name: pkg['name']))
          .toList();
      return packages;
    } catch (e) {
      throw Exception('Failed to fetch packages: $e');
    }
  }
}
