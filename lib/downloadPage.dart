// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// class WebViewScreen extends StatefulWidget {
//   const WebViewScreen({super.key});

//   @override
//   _WebViewScreenState createState() => _WebViewScreenState();
// }

// class _WebViewScreenState extends State<WebViewScreen> {
//   InAppWebViewController? webViewController;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Download Page")),
//       body: InAppWebView(
//         initialUrlRequest: URLRequest(
//             url: WebUri.uri(Uri.parse(
//                 "https://github.com/saintdmix/Nri/releases/latest/download/Nri.apk"))),
//         onWebViewCreated: (controller) {
//           webViewController = controller;
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DownloadPage extends StatelessWidget {
  final String apkUrl =
      "https://github.com/saintdmix/Nri/releases/latest/download/Nri.apk";

  Future<void> _downloadApk() async {
    Uri url = Uri.parse(apkUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication, // Opens in Chrome/Safari
      );
    } else {
      throw "Could not launch $apkUrl";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Download APK")),
      body: Center(
        child: ElevatedButton(
          onPressed: _downloadApk,
          child: Text("Download APK"),
        ),
      ),
    );
  }
}
