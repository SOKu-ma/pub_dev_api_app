import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pub_dev_api_app/presentation/controllers/package_detail_controller.dart';
import 'package:pub_dev_api_app/presentation/providers/package_detail_provider.dart';

class PackageDetailPage extends ConsumerWidget {
  final String packageName;
  const PackageDetailPage({super.key, required this.packageName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageDetail = ref.watch(packageDetailEntityProvider(packageName));
    return Scaffold(
      appBar: AppBar(title: Text(packageName)),
      body: packageDetail.when(
        data: (data) =>
            detailsContent(data.description, "publisherId", data.versions),
        loading: () => CircularProgressIndicator(),
        error: (error, stack) => Text('Error: $error'),
      ),
    );
  }
}

Widget detailsContent(
  String overview,
  String publisherId,
  List<String> versions,
) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Overview',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          overviewSection(overview, publisherId),
          SizedBox(height: 16.0),
          Text(
            'Versions',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          versionsSection(versions),
        ],
      ),
    ),
  );
}

Widget overviewSection(String overview, String publisherId) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(overview, style: TextStyle(fontSize: 12.0)),
          SizedBox(height: 8.0),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              publisherId,
              style: TextStyle(fontSize: 12.0, color: Colors.grey),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget versionsSection(List<String> versions) {
  final PackageDetailController controller = PackageDetailController();

  final sortedVersions = controller.sortVersions(versions);

  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var version in sortedVersions)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(version, style: TextStyle(fontSize: 16.0)),
            ),
        ],
      ),
    ),
  );
}
