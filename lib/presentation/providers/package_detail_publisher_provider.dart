import 'package:pub_dev_api_app/domain/entitis/package_detail_publisher_entity.dart';
import 'package:pub_dev_api_app/domain/repositories/package_detail_publisher_repository.dart';
import 'package:pub_dev_api_app/domain/usecases/package_detail_publisher_usecase.dart';
import 'package:pub_dev_api_app/infrastructure/api/api_client.dart';
import 'package:pub_dev_api_app/infrastructure/repositories/package_detail_publisher_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'package_detail_publisher_provider.g.dart';

@riverpod
ApiClient apiClient(Ref ref) {
  return ApiClient();
}

@riverpod
Future<PackageDetailPublisherEntity> packageDetailPublisherEntity(
  Ref ref,
  String packageName,
) async {
  final useCase = ref.watch(packageDetailPublisherUseCaseProvider);
  return await useCase.execute(packageName);
}

@riverpod
PackageDetailPublisherUseCase packageDetailPublisherUseCase(Ref ref) {
  final repository = ref.watch(packageDetailPublisherRepositoryProvider);
  return PackageDetailPublisherUseCaseImpl(repository: repository);
}

@riverpod
PackageDetailPublisherRepository packageDetailPublisherRepository(Ref ref) {
  return PackageDetailPublisherRepositoryImpl(
    apiClient: ref.watch(apiClientProvider),
  );
}
