import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermosPage extends StatefulWidget {
  const TermosPage({super.key});

  @override
  State<TermosPage> createState() => _TermosPageState();
}

class _TermosPageState extends State<TermosPage> {
  @override
  Widget build(BuildContext context) {
    var controllerWeb = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse('http://10.56.44.35/chronos_public/public/termos-de-uso'),
      );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Termos de Uso'),
        backgroundColor: const Color(0xFF0052A1),
      ),
      body: WebViewWidget(controller: controllerWeb),
    );
  }
}
