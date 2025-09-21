import 'package:json_annotation/json_annotation.dart';

part 'packages_dto.g.dart';

@JsonSerializable()
class PackagesDto {
  final List<PackageDto> packages;
  @JsonKey(name: 'next_url')
  final String? nextUrl;

  const PackagesDto({required this.packages, this.nextUrl});

  factory PackagesDto.fromJson(Map<String, dynamic> json) =>
      _$PackagesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PackagesDtoToJson(this);
}

@JsonSerializable()
class PackageDto {
  final String name;
  final LatestVersionInfoDto? latest;

  const PackageDto({required this.name, this.latest});

  factory PackageDto.fromJson(Map<String, dynamic> json) =>
      _$PackageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PackageDtoToJson(this);
}

@JsonSerializable()
class LatestVersionInfoDto {
  final String version;
  final PubspecInfoDto? pubspec;

  const LatestVersionInfoDto({required this.version, this.pubspec});

  factory LatestVersionInfoDto.fromJson(Map<String, dynamic> json) =>
      _$LatestVersionInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LatestVersionInfoDtoToJson(this);
}

@JsonSerializable()
class PubspecInfoDto {
  final String name;
  final String version;
  final String? description;
  final String? repository;
  final String? homepage;

  const PubspecInfoDto({
    required this.name,
    required this.version,
    this.description,
    this.repository,
    this.homepage,
  });

  factory PubspecInfoDto.fromJson(Map<String, dynamic> json) =>
      _$PubspecInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PubspecInfoDtoToJson(this);
}
