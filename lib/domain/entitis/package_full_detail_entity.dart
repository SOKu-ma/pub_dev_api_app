class PackageFullDetailEntity {
  final String name;
  final String description;
  final List<String> versions;
  final String publisherId;

  PackageFullDetailEntity({
    required this.name,
    required this.description,
    required this.versions,
    required this.publisherId,
  });
}
