import 'package:prescribed/Homepage.dart';
import 'package:prescribed/mic.dart';
import 'package:prescribed/patientlist.dart';
import 'package:prescribed/prescribtion.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() => runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: DoctorDashboard()));

class DoctorDashboard extends StatefulWidget {
  @override
  _DoctorDashboard createState() => _DoctorDashboard();
}

class _DoctorDashboard extends State<DoctorDashboard> {
  int _page = 0;

  final _pageoption = [
    Homepage(),
    Patientlist(),
    Microphone(),
    Precribtion(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      bottomNavigationBar: CurvedNavigationBar(
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.people, size: 30),
          Icon(Icons.mic, size: 30),
          Icon(Icons.folder, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.deepPurpleAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 250),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: _pageoption[_page],
    );
  }
}
