// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackageDetailDto _$PackageDetailDtoFromJson(Map<String, dynamic> json) =>
    PackageDetailDto(
      name: json['name'] as String,
      latest: json['latest'] == null
          ? null
          : LatestVersionInfoDto.fromJson(
              json['latest'] as Map<String, dynamic>,
            ),
      versions: (json['versions'] as List<dynamic>?)
          ?.map((e) => VersionInfoDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PackageDetailDtoToJson(PackageDetailDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'latest': instance.latest,
      'versions': instance.versions,
    };

LatestVersionInfoDto _$LatestVersionInfoDtoFromJson(
  Map<String, dynamic> json,
) => LatestVersionInfoDto(
  version: json['version'] as String,
  pubspec: json['pubspec'] == null
      ? null
      : PubspecInfoDto.fromJson(json['pubspec'] as Map<String, dynamic>),
  archiveUrl: json['archive_url'] as String?,
  packageUrl: json['package_url'] as String?,
  url: json['url'] as String?,
);

Map<String, dynamic> _$LatestVersionInfoDtoToJson(
  LatestVersionInfoDto instance,
) => <String, dynamic>{
  'version': instance.version,
  'pubspec': instance.pubspec,
  'archive_url': instance.archiveUrl,
  'package_url': instance.packageUrl,
  'url': instance.url,
};

VersionInfoDto _$VersionInfoDtoFromJson(Map<String, dynamic> json) =>
    VersionInfoDto(
      version: json['version'] as String,
      pubspec: json['pubspec'] == null
          ? null
          : PubspecInfoDto.fromJson(json['pubspec'] as Map<String, dynamic>),
      archiveUrl: json['archive_url'] as String?,
      archiveSha256: json['archive_sha256'] as String?,
      published: json['published'] as String?,
    );

Map<String, dynamic> _$VersionInfoDtoToJson(VersionInfoDto instance) =>
    <String, dynamic>{
      'version': instance.version,
      'pubspec': instance.pubspec,
      'archive_url': instance.archiveUrl,
      'archive_sha256': instance.archiveSha256,
      'published': instance.published,
    };

PubspecInfoDto _$PubspecInfoDtoFromJson(Map<String, dynamic> json) =>
    PubspecInfoDto(
      name: json['name'] as String,
      version: json['version'] as String,
      description: json['description'] as String?,
      repository: json['repository'] as String?,
      homepage: json['homepage'] as String?,
      issueTracker: json['issue_tracker'] as String?,
      environment: json['environment'] as Map<String, dynamic>?,
      dependencies: json['dependencies'] as Map<String, dynamic>?,
      devDependencies: json['dev_dependencies'] as Map<String, dynamic>?,
      flutter: json['flutter'] as Map<String, dynamic>?,
      topics: (json['topics'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PubspecInfoDtoToJson(PubspecInfoDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'version': instance.version,
      'description': instance.description,
      'repository': instance.repository,
      'homepage': instance.homepage,
      'issue_tracker': instance.issueTracker,
      'environment': instance.environment,
      'dependencies': instance.dependencies,
      'dev_dependencies': instance.devDependencies,
      'flutter': instance.flutter,
      'topics': instance.topics,
    };

PackagePublisherDto _$PackagePublisherDtoFromJson(Map<String, dynamic> json) =>
    PackagePublisherDto(publisherId: json['publisherId'] as String?);

Map<String, dynamic> _$PackagePublisherDtoToJson(
  PackagePublisherDto instance,
) => <String, dynamic>{'publisherId': instance.publisherId};
