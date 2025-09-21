import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PackageDetailController {
  // バージョン情報を最新順にソート
  List<String> sortVersions(List<String> versions) {
    final sortedVersions = List<String>.from(versions);
    sortedVersions.sort((a, b) => b.compareTo(a));
    return sortedVersions;
  }

  // リンクURLがあれば、NavigationBarにリンクボタンを表示
  List<Widget> buildAppBarActions(Uri linkUrl) {
    if (linkUrl.toString().isNotEmpty) {
      return [
        IconButton(
          icon: Icon(Icons.link),
          onPressed: () {
            openUrl(linkUrl.toString());
          },
        ),
      ];
    }
    return [];
  }

  /// URLを外部ブラウザで開く
  Future<void> openUrl(String url) async {
    if (url.isEmpty) return;

    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
