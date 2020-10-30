import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/invoice_list_view.dart';
import 'package:flutter_app/pageview_demo/banner_page_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor:
              Platform.isAndroid ? Color(0xFF262B33) : Color(0xFFFFFFFF),
          backgroundColor:
              Platform.isAndroid ? Color(0xFF262B33) : Color(0xFFFFFFFF),
          brightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
          // textSelectionColor: Color(0x261880EE),
          // textSelectionHandleColor: Color(0xFF1880EE),
          // toggleableActiveColor: Color(0x0D000000),
          accentColor: Color(0x0D000000)),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            RaisedButton(
              child: Text('PageView 和指示器，以及进度条的demo'),
              onPressed: () {
                _navigationNextPage(CardBannerPageViewWidget());
              },
            ),
            RaisedButton(
                child: Text("Stack Positioned ListView的运用"),
                onPressed: () {
                  _navigationNextPage(InvoiceStatelessWidget());
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _navigationNextPage(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
