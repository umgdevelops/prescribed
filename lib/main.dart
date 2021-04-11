import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'chooseRole.dart';
import 'doctor.dart';
import 'patient.dart';

void main() {
  runApp(Welcome());
}

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => ChooseRole(),
        // '/': (context) => App(),
        '/doctor': (context) => Doctor(),
        '/patient': (context) => Patient(),
      },
    );
  }
}

//
