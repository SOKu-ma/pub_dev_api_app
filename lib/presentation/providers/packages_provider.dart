import 'package:pub_dev_api_app/domain/entitis/packages_entity.dart';
import 'package:pub_dev_api_app/domain/repositories/packages_repository.dart';
import 'package:pub_dev_api_app/domain/usecases/packages_usecase.dart';
import 'package:pub_dev_api_app/infrastructure/api/api_client.dart';
import 'package:pub_dev_api_app/infrastructure/repositories/packages_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'packages_provider.g.dart';

@riverpod
ApiClient apiClient(Ref ref) {
  return ApiClient();
}

// リポジトリのプロバイダー
@riverpod
PackagesRepository packageRepository(Ref ref) {
  return PackagesRepositoryImpl(apiClient: ref.watch(apiClientProvider));
}

// UseCase のプロバイダー
@riverpod
PackagesUseCase packageListUseCase(Ref ref) {
  return PackagesUseCaseImpl(repository: ref.watch(packageRepositoryProvider));
}

@riverpod
Future<List<PackagesEntity>> packagesEntity(Ref ref) async {
  final useCase = ref.watch(packageListUseCaseProvider);
  return await useCase.execute();
}
