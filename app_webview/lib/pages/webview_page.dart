import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum MenuOptions {
  clearCache,
  clearCookie,
}

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController _webController;
  double progress = 0;
  late bool isSubmiting;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView'),
        actions: [
          IconButton(
            onPressed: () async {
              if (await _webController.canGoBack()) {
                _webController.goBack();
              } else {
                log('Нет записи в истории');
              }
              return;
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          IconButton(
            onPressed: () async {
              if (await _webController.canGoForward()) {
                _webController.goForward();
              } else {
                log('Нет записи в истории');
              }
              return;
            },
            icon: const Icon(Icons.arrow_forward_ios),
          ),
          IconButton(
            onPressed: () => _webController.reload(),
            icon: const Icon(Icons.replay),
          ),
          PopupMenuButton<MenuOptions>(
            onSelected: (value) {
              switch (value) {
                case MenuOptions.clearCache:
                  _onClearCache(_webController, context);
                  break;
                case MenuOptions.clearCookie:
                  _onClearCookies(context);
                  break;
              }
            },
            itemBuilder: (context) => <PopupMenuItem<MenuOptions>>[
              const PopupMenuItem(
                value: MenuOptions.clearCache,
                child: Text('Удалить кэш'),
              ),
              const PopupMenuItem(
                value: MenuOptions.clearCookie,
                child: Text('Удалить Cookies'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: progress,
            color: Colors.blueAccent,
            backgroundColor: Colors.black,
          ),
          Expanded(
            child: WebView(
              // initialUrl: 'https://flutter.dev',
              initialUrl: 'https://facebook.com',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) {
                _webController = controller;
              },
              onProgress: (progress) {
                setState(() {
                  this.progress = progress / 100;
                });
              },
              onPageStarted: (url) {
                log('Новый сайт $url');
                if (url.contains('https://flutter.dev')) {
                  Future.delayed(const Duration(seconds: 2), () {
                    _webController.runJavascriptReturningResult(
                      "document.getElementsByTagName('footer')[0].style.display='none'",
                    );
                  });
                }
              },
              onPageFinished: (url) {
                log('Страница полностью загружена');
                if (url.contains('https://m.facebook.com')) {
                  if (isSubmiting) {
                    _webController.loadUrl('https://m.facebook.com');
                    isSubmiting = false;
                  }
                }
              },
              navigationDelegate: (request) {
                if (request.url.startsWith('https://m.youtube.com')) {
                  log('Навигация заблокирована к $request');
                  return NavigationDecision.prevent;
                }
                log('Навигация разрешена к $request');
                return NavigationDecision.navigate;
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.next_plan, size: 32),
        onPressed: () async {
          const email = 'iamjsare@gmail.com';
          const password = 'ProLevel7nx34iie';

          _webController.runJavascript(
            "document.getElementById('m_login_email').value='$email'",
          );

          _webController.runJavascript(
            "document.getElementById('m_login_password').value='$password'",
          );

          await Future.delayed(Duration(seconds: 2));
          isSubmiting = true;
          await _webController.runJavascript(
            "document.forms[0].submit()",
          );
          // final currentUrl = await _webController.currentUrl();
          // log('Предыдущий сайт: $currentUrl');
          // _webController.loadUrl('https://youtube.com');
          // _webController.runJavascript(
          //     "document.getElementsByTagName('footer')[0].style.display='none'");
        },
      ),
    );
  }

  void _onClearCookies(BuildContext context) async {
    final bool hadCookies = await CookieManager().clearCookies();
    String message = 'Cookies удалены';
    if (!hadCookies) {
      message = 'Cookies все были очищены';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  void _onClearCache(WebViewController controller, BuildContext context) async {
    await _webController.clearCache();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Кэш очищен')),
    );
  }
}
