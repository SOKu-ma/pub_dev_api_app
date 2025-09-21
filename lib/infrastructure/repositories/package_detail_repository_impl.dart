import 'package:pub_dev_api_app/domain/entitis/package_detail_entity.dart';
import 'package:pub_dev_api_app/domain/repositories/package_detail_repository.dart';
import 'package:pub_dev_api_app/infrastructure/api/api_client.dart';
import 'package:pub_dev_api_app/infrastructure/dto/package_detail_dto.dart';

class PackageDetailRepositoryImpl implements PackageDetailRepository {
  final ApiClient _apiClient;
  PackageDetailRepositoryImpl({required ApiClient apiClient})
    : _apiClient = apiClient;

  @override
  Future<PackageDetailEntity> fetchPackageDetail(String packageName) async {
    try {
      final data = await _apiClient.get(
        'https://pub.dev/api/packages/$packageName',
      );
      final dto = PackageDetailDto.fromJson(data);
      return PackageDetailEntity(
        name: dto.name,
        description:
            dto.latest?.pubspec?.description ?? 'No description available',
        versions: dto.versions?.map((v) => v.version).toList() ?? [],
        linkUrl: Uri.parse(
          dto.latest?.pubspec?.homepage ??
              dto.latest?.pubspec?.repository ??
              'https://pub.dev/packages/$packageName',
        ),
      );
    } catch (e) {
      throw Exception('Failed to fetch package details: $e');
    }
  }
}
