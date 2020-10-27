import 'package:flutter/material.dart';
import 'package:flutter_app/random_words.dart';

void main() {
  runApp(MaterialApp(title: '导航演示1', home: new FirstScreen()));
}

class FirstScreen extends StatelessWidget {
  const FirstScreen();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text('导航页面')),
        body: Center(
            child: RaisedButton(
          child: Text('查看商品详情页面'),
          onPressed: () {
            _pushReplacement2(context);
          },
        )));
  }

  // ignore: missing_return
  _pushReplacement2(BuildContext context) {
    Navigator.push(context,
        new MaterialPageRoute(builder: (context) => new RandomWords()));
  }
}
