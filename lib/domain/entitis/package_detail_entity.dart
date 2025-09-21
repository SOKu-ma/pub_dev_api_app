class PackageDetailEntity {
  final String name;
  final String description;
  final List<String> versions;
  final Uri linkUrl;

  PackageDetailEntity({
    required this.name,
    required this.description,
    required this.versions,
    required this.linkUrl,
  });
}
