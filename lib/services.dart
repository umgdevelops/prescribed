import 'package:flutter/material.dart';

class Services extends StatefulWidget {
  final String title;
  Services(this.title);

  @override
  _Services createState() => _Services();
}

class _Services extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Center(
          child: new Text(widget.title),
        ));
  }
}
