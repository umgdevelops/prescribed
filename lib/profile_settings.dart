import 'package:flutter/material.dart';

class Profilesettings extends StatefulWidget {
  final String title;
  Profilesettings(this.title);

  @override
  _Profilesettings createState() => _Profilesettings();
}

class _Profilesettings extends State<Profilesettings> {
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
