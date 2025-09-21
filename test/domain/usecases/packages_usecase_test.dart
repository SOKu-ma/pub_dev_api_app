import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pub_dev_api_app/domain/entitis/packages_entity.dart';
import 'package:pub_dev_api_app/domain/repositories/packages_repository.dart';
import 'package:pub_dev_api_app/domain/usecases/packages_usecase.dart';

// Mock Repository
class MockPackagesRepository extends Mock implements PackagesRepository {}

void main() {
  late PackagesUseCaseImpl useCase;
  late MockPackagesRepository mockRepository;

  setUp(() {
    mockRepository = MockPackagesRepository();
    useCase = PackagesUseCaseImpl(repository: mockRepository);
  });

  group('PackagesUseCaseImpl', () {
    test('リポジトリ呼び出しが成功した場合、PackagesEntityのリストを返すこと', () async {
      // Arrange
      final expectedPackages = [
        PackagesEntity(name: 'flutter'),
        PackagesEntity(name: 'http'),
        PackagesEntity(name: 'dio'),
      ];

      when(
        () => mockRepository.fetchPackagesList(),
      ).thenAnswer((_) async => expectedPackages);

      // Act
      final result = await useCase.execute();

      // Assert
      expect(result, equals(expectedPackages));
      expect(result.length, equals(3));
      expect(result[0].name, equals('flutter'));
      expect(result[1].name, equals('http'));
      expect(result[2].name, equals('dio'));

      verify(() => mockRepository.fetchPackagesList()).called(1);
    });

    test('パッケージが利用できない場合、空のリストを返すこと', () async {
      // Arrange
      final expectedPackages = <PackagesEntity>[];

      when(
        () => mockRepository.fetchPackagesList(),
      ).thenAnswer((_) async => expectedPackages);

      // Act
      final result = await useCase.execute();

      // Assert
      expect(result, isEmpty);
      verify(() => mockRepository.fetchPackagesList()).called(1);
    });

    test('リポジトリが例外をスローした場合、例外をスローすること', () async {
      // Arrange
      final expectedException = Exception('Network error');

      when(
        () => mockRepository.fetchPackagesList(),
      ).thenThrow(expectedException);

      // Act & Assert
      expect(() async => await useCase.execute(), throwsA(isA<Exception>()));

      verify(() => mockRepository.fetchPackagesList()).called(1);
    });

    test('リポジトリがタイムアウトした場合を適切に処理すること', () async {
      // Arrange
      when(() => mockRepository.fetchPackagesList()).thenThrow(
        TimeoutException('Request timeout', const Duration(seconds: 30)),
      );

      // Act & Assert
      expect(
        () async => await useCase.execute(),
        throwsA(isA<TimeoutException>()),
      );

      verify(() => mockRepository.fetchPackagesList()).called(1);
    });

    test('リポジトリを正確に1回だけ呼び出すこと', () async {
      // Arrange
      final expectedPackages = [PackagesEntity(name: 'test_package')];

      when(
        () => mockRepository.fetchPackagesList(),
      ).thenAnswer((_) async => expectedPackages);

      // Act
      await useCase.execute();

      // Assert
      verify(() => mockRepository.fetchPackagesList()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
