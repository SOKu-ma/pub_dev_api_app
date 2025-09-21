import 'package:json_annotation/json_annotation.dart';

part 'package_detail_publisher_dto.g.dart';

@JsonSerializable()
class PackagePublisherDto {
  @JsonKey(name: 'publisherId')
  final String? publisherId;

  const PackagePublisherDto({this.publisherId});

  factory PackagePublisherDto.fromJson(Map<String, dynamic> json) =>
      _$PackagePublisherDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PackagePublisherDtoToJson(this);
}
