import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PackageDetailPage extends ConsumerWidget {
  final String packageName;
  const PackageDetailPage({super.key, required this.packageName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(packageName)),
      body: Center(child: Text('Package details for $packageName go here')),
    );
  }
}
