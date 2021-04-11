import 'package:flutter/material.dart';

class Appointmentscreen extends StatefulWidget {
  final String title;
  Appointmentscreen(this.title);

  @override
  _Appointmentscreen createState() => _Appointmentscreen();
}

class _Appointmentscreen extends State<Appointmentscreen> {
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
