import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Center(
        child: new PopularMoviesWidget(),
      ),
    );
  }
}

class PopularMoviesWidget extends StatefulWidget {
  @override
  _PopularMoviesWidgetState createState() => new _PopularMoviesWidgetState();
}

class _PopularMoviesWidgetState extends State<PopularMoviesWidget> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text("No content"),
    );
  }
}
