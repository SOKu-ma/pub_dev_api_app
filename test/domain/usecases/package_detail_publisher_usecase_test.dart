import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pub_dev_api_app/domain/entitis/package_detail_publisher_entity.dart';
import 'package:pub_dev_api_app/domain/repositories/package_detail_publisher_repository.dart';
import 'package:pub_dev_api_app/domain/usecases/package_detail_publisher_usecase.dart';

// Mock Repository
class MockPackageDetailPublisherRepository extends Mock
    implements PackageDetailPublisherRepository {}

void main() {
  late PackageDetailPublisherUseCaseImpl useCase;
  late MockPackageDetailPublisherRepository mockRepository;

  setUp(() {
    mockRepository = MockPackageDetailPublisherRepository();
    useCase = PackageDetailPublisherUseCaseImpl(repository: mockRepository);
  });

  group('PackageDetailPublisherUseCaseImpl', () {
    const testPackageName = 'flutter';

    test('リポジトリ呼び出しが成功した場合、PackageDetailPublisherEntityを返すこと', () async {
      // Arrange
      const expectedPublisherId = 'google.dev';
      final expectedPublisherEntity = PackageDetailPublisherEntity(
        publisherId: expectedPublisherId,
      );

      when(
        () => mockRepository.fetchPublisherId(testPackageName),
      ).thenAnswer((_) async => expectedPublisherEntity);

      // Act
      final result = await useCase.execute(testPackageName);

      // Assert
      expect(result, equals(expectedPublisherEntity));
      expect(result.publisherId, equals(expectedPublisherId));

      verify(() => mockRepository.fetchPublisherId(testPackageName)).called(1);
    });

    test('正しいパッケージ名をリポジトリに渡すこと', () async {
      // Arrange
      const differentPackageName = 'dio';
      const expectedPublisherId = 'cfug.dev';
      final publisherEntity = PackageDetailPublisherEntity(
        publisherId: expectedPublisherId,
      );

      when(
        () => mockRepository.fetchPublisherId(differentPackageName),
      ).thenAnswer((_) async => publisherEntity);

      // Act
      final result = await useCase.execute(differentPackageName);

      // Assert
      expect(result.publisherId, equals(expectedPublisherId));
      verify(
        () => mockRepository.fetchPublisherId(differentPackageName),
      ).called(1);
      verifyNever(() => mockRepository.fetchPublisherId(testPackageName));
    });

    test('異なる公開者IDを適切に処理すること', () async {
      // Arrange
      const publisherIds = [
        'google.dev',
        'dart.dev',
        'flutter.dev',
        'firebase.dev',
      ];

      for (final publisherId in publisherIds) {
        // Reset mock for each test iteration
        reset(mockRepository);

        final publisherEntity = PackageDetailPublisherEntity(
          publisherId: publisherId,
        );
        when(
          () => mockRepository.fetchPublisherId(testPackageName),
        ).thenAnswer((_) async => publisherEntity);

        // Act
        final result = await useCase.execute(testPackageName);

        // Assert
        expect(result.publisherId, equals(publisherId));
        verify(
          () => mockRepository.fetchPublisherId(testPackageName),
        ).called(1);
      }
    });

    test('リポジトリが例外をスローした場合、例外をスローすること', () async {
      // Arrange
      final expectedException = Exception('Publisher not found');

      when(
        () => mockRepository.fetchPublisherId(testPackageName),
      ).thenThrow(expectedException);

      // Act & Assert
      expect(
        () async => await useCase.execute(testPackageName),
        throwsA(isA<Exception>()),
      );

      verify(() => mockRepository.fetchPublisherId(testPackageName)).called(1);
    });

    test('リポジトリがタイムアウトした場合を適切に処理すること', () async {
      // Arrange
      when(() => mockRepository.fetchPublisherId(testPackageName)).thenThrow(
        TimeoutException('Request timeout', const Duration(seconds: 30)),
      );

      // Act & Assert
      expect(
        () async => await useCase.execute(testPackageName),
        throwsA(isA<TimeoutException>()),
      );

      verify(() => mockRepository.fetchPublisherId(testPackageName)).called(1);
    });

    test('空のパッケージ名を適切に処理すること', () async {
      // Arrange
      const emptyPackageName = '';
      const emptyPublisherId = '';
      final publisherEntity = PackageDetailPublisherEntity(
        publisherId: emptyPublisherId,
      );

      when(
        () => mockRepository.fetchPublisherId(emptyPackageName),
      ).thenAnswer((_) async => publisherEntity);

      // Act
      final result = await useCase.execute(emptyPackageName);

      // Assert
      expect(result.publisherId, equals(emptyPublisherId));
      verify(() => mockRepository.fetchPublisherId(emptyPackageName)).called(1);
    });

    test('空の公開者IDを適切に処理すること', () async {
      // Arrange
      const nullPublisherId = '';
      final publisherEntity = PackageDetailPublisherEntity(
        publisherId: nullPublisherId,
      );

      when(
        () => mockRepository.fetchPublisherId(testPackageName),
      ).thenAnswer((_) async => publisherEntity);

      // Act
      final result = await useCase.execute(testPackageName);

      // Assert
      expect(result.publisherId, equals(nullPublisherId));
      verify(() => mockRepository.fetchPublisherId(testPackageName)).called(1);
    });

    test('ネットワークエラーを適切に処理すること', () async {
      // Arrange
      final networkException = Exception('Network unavailable');

      when(
        () => mockRepository.fetchPublisherId(testPackageName),
      ).thenThrow(networkException);

      // Act & Assert
      expect(
        () async => await useCase.execute(testPackageName),
        throwsA(isA<Exception>()),
      );

      verify(() => mockRepository.fetchPublisherId(testPackageName)).called(1);
    });

    test('リポジトリを正確に1回だけ呼び出すこと', () async {
      // Arrange
      final publisherEntity = PackageDetailPublisherEntity(
        publisherId: 'test.dev',
      );

      when(
        () => mockRepository.fetchPublisherId(testPackageName),
      ).thenAnswer((_) async => publisherEntity);

      // Act
      await useCase.execute(testPackageName);

      // Assert
      verify(() => mockRepository.fetchPublisherId(testPackageName)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('同時実行を正しく処理すること', () async {
      // Arrange
      const publisherId1 = 'publisher1.dev';
      const publisherId2 = 'publisher2.dev';
      const packageName1 = 'package1';
      const packageName2 = 'package2';

      final publisherEntity1 = PackageDetailPublisherEntity(
        publisherId: publisherId1,
      );
      final publisherEntity2 = PackageDetailPublisherEntity(
        publisherId: publisherId2,
      );

      when(
        () => mockRepository.fetchPublisherId(packageName1),
      ).thenAnswer((_) async => publisherEntity1);
      when(
        () => mockRepository.fetchPublisherId(packageName2),
      ).thenAnswer((_) async => publisherEntity2);

      // Act
      final futures = [
        useCase.execute(packageName1),
        useCase.execute(packageName2),
      ];
      final results = await Future.wait(futures);

      // Assert
      expect(results[0].publisherId, equals(publisherId1));
      expect(results[1].publisherId, equals(publisherId2));

      verify(() => mockRepository.fetchPublisherId(packageName1)).called(1);
      verify(() => mockRepository.fetchPublisherId(packageName2)).called(1);
    });
  });
}
