import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/invoice_list_view.dart';
import 'package:flutter_app/main_two.dart';

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
      ),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Image.asset('images/image_test.webp'),
            Image.network(
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1603427730493&di=2793b323b883cfe5709b163581ba751c&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2Fa%2F55349fb752abc.jpg",
              height: 300,
              width: 300,
            ),
            RaisedButton(
              child: Text('test buttonx'),
              onPressed: (){
                // FirstScreen().pushReplacement2(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => InvoiceStatelessWidget()));

              },
            )


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
}
