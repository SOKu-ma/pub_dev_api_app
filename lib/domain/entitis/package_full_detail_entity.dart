class PackageFullDetailEntity {
  final String name;
  final String description;
  final List<String> versions;
  final String publisherId;
  final Uri linkUrl;

  PackageFullDetailEntity({
    required this.name,
    required this.description,
    required this.versions,
    required this.publisherId,
    required this.linkUrl,
  });
}
