import 'package:json_annotation/json_annotation.dart';

part 'package_detail_dto.g.dart';

@JsonSerializable()
class PackageDetailDto {
  final String name;
  final LatestVersionInfoDto? latest;
  final List<VersionInfoDto>? versions;

  const PackageDetailDto({required this.name, this.latest, this.versions});

  factory PackageDetailDto.fromJson(Map<String, dynamic> json) =>
      _$PackageDetailDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PackageDetailDtoToJson(this);
}

@JsonSerializable()
class LatestVersionInfoDto {
  final String version;
  final PubspecInfoDto? pubspec;
  @JsonKey(name: 'archive_url')
  final String? archiveUrl;
  @JsonKey(name: 'package_url')
  final String? packageUrl;
  final String? url;

  const LatestVersionInfoDto({
    required this.version,
    this.pubspec,
    this.archiveUrl,
    this.packageUrl,
    this.url,
  });

  factory LatestVersionInfoDto.fromJson(Map<String, dynamic> json) =>
      _$LatestVersionInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LatestVersionInfoDtoToJson(this);
}

@JsonSerializable()
class VersionInfoDto {
  final String version;
  final PubspecInfoDto? pubspec;
  @JsonKey(name: 'archive_url')
  final String? archiveUrl;
  @JsonKey(name: 'archive_sha256')
  final String? archiveSha256;
  final String? published;

  const VersionInfoDto({
    required this.version,
    this.pubspec,
    this.archiveUrl,
    this.archiveSha256,
    this.published,
  });

  factory VersionInfoDto.fromJson(Map<String, dynamic> json) =>
      _$VersionInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$VersionInfoDtoToJson(this);
}

@JsonSerializable()
class PubspecInfoDto {
  final String name;
  final String version;
  final String? description;
  final String? repository;
  final String? homepage;
  @JsonKey(name: 'issue_tracker')
  final String? issueTracker;
  final Map<String, dynamic>? environment;
  final Map<String, dynamic>? dependencies;
  @JsonKey(name: 'dev_dependencies')
  final Map<String, dynamic>? devDependencies;
  final Map<String, dynamic>? flutter;
  final List<String>? topics;

  const PubspecInfoDto({
    required this.name,
    required this.version,
    this.description,
    this.repository,
    this.homepage,
    this.issueTracker,
    this.environment,
    this.dependencies,
    this.devDependencies,
    this.flutter,
    this.topics,
  });

  factory PubspecInfoDto.fromJson(Map<String, dynamic> json) =>
      _$PubspecInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PubspecInfoDtoToJson(this);
}

@JsonSerializable()
class PackagePublisherDto {
  @JsonKey(name: 'publisherId')
  final String? publisherId;

  const PackagePublisherDto({this.publisherId});

  factory PackagePublisherDto.fromJson(Map<String, dynamic> json) =>
      _$PackagePublisherDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PackagePublisherDtoToJson(this);
}
