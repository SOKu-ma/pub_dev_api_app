class PackageDetailController {
  // バージョン情報を最新順にソート
  List<String> sortVersions(List<String> versions) {
    final sortedVersions = List<String>.from(versions);
    sortedVersions.sort((a, b) => b.compareTo(a));
    return sortedVersions;
  }
}
