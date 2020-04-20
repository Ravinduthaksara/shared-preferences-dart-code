import 'package:flutter/material.dart';
import 'package:newapp1/data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new Datatransfer(),
        routes: <String, WidgetBuilder>{
          History.routeName: (context) => new History()
        });
  }
}
