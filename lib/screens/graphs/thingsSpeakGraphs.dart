import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
 

class Graphs extends StatefulWidget {

  _GraphsState createState() => _GraphsState();

}

class _GraphsState extends State<Graphs>{

  WebViewController webViewController;
  String htmlFilePath = 'files/Test.html';

  loadLocalHTML() async{

   String fileHtmlContents = await rootBundle.loadString(htmlFilePath);
    webViewController.loadUrl(Uri.dataFromString(fileHtmlContents,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
    }

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Load Local HTML File in WebView')),
      body: WebView(
        initialUrl: '',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController tmp) {
          webViewController = tmp;
          loadLocalHTML();
        },
      ),
    );
  }
}