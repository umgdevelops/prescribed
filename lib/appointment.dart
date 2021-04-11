//import 'package:flutter/material.dart';

class Appointment {
  String user;
  String mobileno;
  int cardbackground;
  String cardelementtop;
  String cardelementbottom;

  Appointment(this.user, this.mobileno, this.cardbackground,
      this.cardelementtop, this.cardelementbottom,
      [Object item]);
}

List<Appointment> cards = carddata
    .map(
      (item) => Appointment(
        item['user'],
        item['mobileno'],
        item['cardbackground'],
        item['cardelementtop'],
        item['cardelementbottom'],
      ),
    )
    .toList();

var carddata = [
  {
    "user": "Anand Deshmukh",
    "mobileno": "76554321",
    "cardbackground": 0xFF1E1E99,
    "cardelementtop": "assets/images/calen.png",
    "cardelementbottom": "assets/images/circle.png",
  },
  {
    "user": "Rahul ghatkar",
    "mobileno": "765432121",
    "cardbackground": 0xFFFF70A3,
  },
  {
    "user": "Himanshu salagre",
    "mobileno": "765432198",
    "cardbackground": 0xFFFF70A3,
  },
  {
    "user": "xyzw",
    "mobileno": "765254321",
    "cardbackground": 0xFFFF70A3,
  },
];
