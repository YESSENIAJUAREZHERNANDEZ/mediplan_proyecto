import 'package:flutter/material.dart';

// don't forget this line
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const Terminos());
}

class Terminos extends StatelessWidget {
  const Terminos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      title: "Kindacode.comr",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  // Create a webview controller
  final _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // print the loading progress to the console
          // you can use this value to show a progress bar if you want
          debugPrint("Loading: $progress%");
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse("https://mediplanapp-643eb.web.app/terminos.html"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
          backgroundColor: Color.fromARGB(255, 52, 152, 219),
      ),
      body: SizedBox(
          width: double.infinity,
          // the most important part of this example
          child: WebViewWidget(
            controller: _controller,
          )),
    );
  }
}