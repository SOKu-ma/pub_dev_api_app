import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pub_dev_api_app/domain/entitis/package_detail_entity.dart';
import 'package:pub_dev_api_app/domain/repositories/package_detail_repository.dart';
import 'package:pub_dev_api_app/domain/usecases/package_detail_usecase.dart';

// Mock Repository
class MockPackageDetailRepository extends Mock
    implements PackageDetailRepository {}

void main() {
  late PackageDetailUseCaseImpl useCase;
  late MockPackageDetailRepository mockRepository;

  setUp(() {
    mockRepository = MockPackageDetailRepository();
    useCase = PackageDetailUseCaseImpl(repository: mockRepository);
  });

  group('PackageDetailUseCaseImpl', () {
    const testPackageName = 'flutter';

    test('リポジトリ呼び出しが成功した場合、PackageDetailEntityを返すこと', () async {
      // Arrange
      final expectedPackageDetail = PackageDetailEntity(
        name: 'flutter',
        description: 'Flutter SDK for building cross-platform mobile apps',
        versions: ['3.16.0', '3.15.0', '3.14.0'],
        linkUrl: Uri.parse('https://flutter.dev'),
      );

      when(
        () => mockRepository.fetchPackageDetail(testPackageName),
      ).thenAnswer((_) async => expectedPackageDetail);

      // Act
      final result = await useCase.execute(testPackageName);

      // Assert
      expect(result, equals(expectedPackageDetail));
      expect(result.name, equals('flutter'));
      expect(
        result.description,
        equals('Flutter SDK for building cross-platform mobile apps'),
      );
      expect(result.versions.length, equals(3));
      expect(result.versions, contains('3.16.0'));
      expect(result.linkUrl.toString(), equals('https://flutter.dev'));

      verify(
        () => mockRepository.fetchPackageDetail(testPackageName),
      ).called(1);
    });

    test('正しいパッケージ名をリポジトリに渡すこと', () async {
      // Arrange
      const differentPackageName = 'http';
      final packageDetail = PackageDetailEntity(
        name: differentPackageName,
        description:
            'A composable, Future-based library for making HTTP requests.',
        versions: ['1.1.0'],
        linkUrl: Uri.parse('https://pub.dev/packages/http'),
      );

      when(
        () => mockRepository.fetchPackageDetail(differentPackageName),
      ).thenAnswer((_) async => packageDetail);

      // Act
      final result = await useCase.execute(differentPackageName);

      // Assert
      expect(result.name, equals(differentPackageName));
      verify(
        () => mockRepository.fetchPackageDetail(differentPackageName),
      ).called(1);
      verifyNever(() => mockRepository.fetchPackageDetail(testPackageName));
    });

    test('リポジトリが例外をスローした場合、例外をスローすること', () async {
      // Arrange
      final expectedException = Exception('Package not found');

      when(
        () => mockRepository.fetchPackageDetail(testPackageName),
      ).thenThrow(expectedException);

      // Act & Assert
      expect(
        () async => await useCase.execute(testPackageName),
        throwsA(isA<Exception>()),
      );

      verify(
        () => mockRepository.fetchPackageDetail(testPackageName),
      ).called(1);
    });

    test('リポジトリがタイムアウトした場合を適切に処理すること', () async {
      // Arrange
      when(() => mockRepository.fetchPackageDetail(testPackageName)).thenThrow(
        TimeoutException('Request timeout', const Duration(seconds: 30)),
      );

      // Act & Assert
      expect(
        () async => await useCase.execute(testPackageName),
        throwsA(isA<TimeoutException>()),
      );

      verify(
        () => mockRepository.fetchPackageDetail(testPackageName),
      ).called(1);
    });

    test('空のパッケージ名を適切に処理すること', () async {
      // Arrange
      const emptyPackageName = '';
      final packageDetail = PackageDetailEntity(
        name: emptyPackageName,
        description: '',
        versions: [],
        linkUrl: Uri.parse(''),
      );

      when(
        () => mockRepository.fetchPackageDetail(emptyPackageName),
      ).thenAnswer((_) async => packageDetail);

      // Act
      final result = await useCase.execute(emptyPackageName);

      // Assert
      expect(result.name, equals(emptyPackageName));
      expect(result.description, equals(''));
      expect(result.versions, isEmpty);

      verify(
        () => mockRepository.fetchPackageDetail(emptyPackageName),
      ).called(1);
    });

    test('空のバージョンリストを持つパッケージを適切に処理すること', () async {
      // Arrange
      final packageDetail = PackageDetailEntity(
        name: testPackageName,
        description: 'Test package',
        versions: [],
        linkUrl: Uri.parse('https://example.com'),
      );

      when(
        () => mockRepository.fetchPackageDetail(testPackageName),
      ).thenAnswer((_) async => packageDetail);

      // Act
      final result = await useCase.execute(testPackageName);

      // Assert
      expect(result.versions, isEmpty);
      verify(
        () => mockRepository.fetchPackageDetail(testPackageName),
      ).called(1);
    });

    test('リポジトリを正確に1回だけ呼び出すこと', () async {
      // Arrange
      final packageDetail = PackageDetailEntity(
        name: testPackageName,
        description: 'Test description',
        versions: ['1.0.0'],
        linkUrl: Uri.parse('https://example.com'),
      );

      when(
        () => mockRepository.fetchPackageDetail(testPackageName),
      ).thenAnswer((_) async => packageDetail);

      // Act
      await useCase.execute(testPackageName);

      // Assert
      verify(
        () => mockRepository.fetchPackageDetail(testPackageName),
      ).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
