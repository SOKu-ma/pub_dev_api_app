import 'package:pub_dev_api_app/domain/entitis/package_detail_publisher_entity.dart';
import 'package:pub_dev_api_app/domain/repositories/package_detail_publisher_repository.dart';
import 'package:pub_dev_api_app/infrastructure/api/api_client.dart';

class PackageDetailPublisherRepositoryImpl
    implements PackageDetailPublisherRepository {
  final ApiClient _apiClient;
  PackageDetailPublisherRepositoryImpl({required ApiClient apiClient})
    : _apiClient = apiClient;

  @override
  Future<PackageDetailPublisherEntity> fetchPublisherId(
    String packageName,
  ) async {
    try {
      final data = await _apiClient.get(
        'https://pub.dev/api/packages/$packageName/publisher',
      );
      return PackageDetailPublisherEntity(
        publisherId: data['publisherId'] as String,
      );
    } catch (e) {
      throw Exception('Failed to fetch publisher ID: $e');
    }
  }
}
