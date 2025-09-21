import 'package:pub_dev_api_app/domain/entitis/package_detail_entity.dart';
import 'package:pub_dev_api_app/domain/repositories/package_detail_repository.dart';
import 'package:pub_dev_api_app/domain/usecases/package_detail_usecase.dart';
import 'package:pub_dev_api_app/infrastructure/api/api_client.dart';
import 'package:pub_dev_api_app/infrastructure/repositories/package_detail_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'package_detail_provider.g.dart';

@riverpod
ApiClient apiClient(Ref ref) {
  return ApiClient();
}

@riverpod
PackageDetailRepository packageRepository(Ref ref) {
  return PackageDetailRepositoryImpl(apiClient: ref.watch(apiClientProvider));
}

@riverpod
PackageDetailUseCase packageDetailUseCase(Ref ref) {
  return PackageDetailUseCaseImpl(
    repository: ref.watch(packageRepositoryProvider),
  );
}

@riverpod
Future<PackageDetailEntity> packageDetailEntity(
  Ref ref,
  String packageName,
) async {
  final useCase = ref.watch(packageDetailUseCaseProvider);
  return await useCase.execute(packageName);
}
