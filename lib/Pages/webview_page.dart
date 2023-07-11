import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String projeto;
  const WebViewPage({super.key, required this.projeto});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    var controllerWeb = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(widget.projeto),
      );
    debugPrint(widget.projeto);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projeto'),
      ),
      body: WebViewWidget(controller: controllerWeb),
    );
  }
}
