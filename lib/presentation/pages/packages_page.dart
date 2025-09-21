import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:pub_dev_api_app/presentation/providers/packages_provider.dart';

class PackagesPage extends ConsumerWidget {
  const PackagesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packagesAsync = ref.watch(packagesEntityProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Pub dev')),
      body: packagesAsync.when(
        data: (packages) {
          return ListView.builder(
            itemCount: packages.length,
            itemBuilder: (context, index) {
              final package = packages[index];
              return PackageCard(package: package);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}

class PackageCard extends StatelessWidget {
  final package;
  const PackageCard({super.key, required this.package});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(package.name, style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}
