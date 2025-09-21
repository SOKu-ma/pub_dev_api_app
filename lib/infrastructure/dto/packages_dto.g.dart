// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packages_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackagesDto _$PackagesDtoFromJson(Map<String, dynamic> json) => PackagesDto(
  packages: (json['packages'] as List<dynamic>)
      .map((e) => PackageDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  nextUrl: json['next_url'] as String?,
);

Map<String, dynamic> _$PackagesDtoToJson(PackagesDto instance) =>
    <String, dynamic>{
      'packages': instance.packages,
      'next_url': instance.nextUrl,
    };

PackageDto _$PackageDtoFromJson(Map<String, dynamic> json) => PackageDto(
  name: json['name'] as String,
  latest: json['latest'] == null
      ? null
      : LatestVersionInfoDto.fromJson(json['latest'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PackageDtoToJson(PackageDto instance) =>
    <String, dynamic>{'name': instance.name, 'latest': instance.latest};

LatestVersionInfoDto _$LatestVersionInfoDtoFromJson(
  Map<String, dynamic> json,
) => LatestVersionInfoDto(
  version: json['version'] as String,
  pubspec: json['pubspec'] == null
      ? null
      : PubspecInfoDto.fromJson(json['pubspec'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LatestVersionInfoDtoToJson(
  LatestVersionInfoDto instance,
) => <String, dynamic>{
  'version': instance.version,
  'pubspec': instance.pubspec,
};

PubspecInfoDto _$PubspecInfoDtoFromJson(Map<String, dynamic> json) =>
    PubspecInfoDto(
      name: json['name'] as String,
      version: json['version'] as String,
      description: json['description'] as String?,
      repository: json['repository'] as String?,
      homepage: json['homepage'] as String?,
    );

Map<String, dynamic> _$PubspecInfoDtoToJson(PubspecInfoDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'version': instance.version,
      'description': instance.description,
      'repository': instance.repository,
      'homepage': instance.homepage,
    };
