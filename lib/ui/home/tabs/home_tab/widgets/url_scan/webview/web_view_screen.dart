import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/l10n/app_localizations.dart';
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

            final host = uri.host.toLowerCase();
            final original = originalHost.toLowerCase();

            if (host.isEmpty ||
                original.isEmpty ||
                normalize(host) != normalize(original)) {
              if (!mounted) return NavigationDecision.prevent;

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    AppLocalizations.of(context)!.navigationBlocked,
                  ),
                ),
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
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.safePreview),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            color: AppColors.green,
            child: Text(
              "${AppLocalizations.of(context)!.previewing}: $originalHost",
              style: AppStyles.regular16White,
            ),
          ),
          Expanded(child: WebViewWidget(controller: webController)),
        ],
      ),
    );
  }

  String normalize(String host) {
    return host.replaceAll('www.', '').toLowerCase();
  }
}
