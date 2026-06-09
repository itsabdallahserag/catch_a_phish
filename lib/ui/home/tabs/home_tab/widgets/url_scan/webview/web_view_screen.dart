import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String url;

  const WebViewScreen({super.key, required this.url});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController webController;
  late String originalHost;

  @override
  void initState() {
    super.initState();

    originalHost = Uri.parse(widget.url).host;

    webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (request) {
            final uri = Uri.parse(request.url);

            final host = uri.host.toLowerCase(); // <-- FIX: normalize lowercase
            final original = originalHost.toLowerCase(); // <-- FIX

            // 🔐 FIX: protection against empty or malformed URLs
            if (host.isEmpty ||
                original.isEmpty ||
                normalize(host) != normalize(original)) {
              // ⚠️ FIX: prevent crash if screen closed
              if (!mounted) return NavigationDecision.prevent;

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Navigation blocked")),
              );

              return NavigationDecision.prevent;
            }

            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("🛡 Safe Preview")),

      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            color: Colors.green,

            child: Text(
              "Previewing : $originalHost",
              style: const TextStyle(color: Colors.white),
            ),
          ),

          Expanded(child: WebViewWidget(controller: webController)),
        ],
      ),
    );
  }

  String normalize(String host) {
    return host
        .replaceAll('www.', '') // <-- FIX: remove common fake variation
        .toLowerCase(); // <-- FIX: case-insensitive comparison
  }
}
