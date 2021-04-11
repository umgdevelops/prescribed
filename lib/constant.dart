import 'package:flutter/material.dart';

// Colors
const kBackgroundColor = Color(0xFFFEFEFE);
const kOffWhite = Color(0xFFEAEFF2);
const kBgWhite = Color(0xFFF5F5F5);
const kTitleTextColor = Color(0xFF303030);
const kBodyTextColor = Color(0xFF4B4B4B);
const kTextLightColor = Color(0xFF959595);
const kInfectedColor = Color(0xFFFF8748);
const kDeathColor = Color(0xFFFF4848);
const kDarkGreen = Color(0xFF006400);
const kRecovercolor = Color(0xFF36C12C);
const kPrimaryColor = Color(0xFF3382CC);
final kShadowColor = Color(0xFFB7B7B7).withOpacity(0.1);
final kActiveShadowColor = Color(0xFF4056C6).withOpacity(.15);
const kDarkBlueColor = Color(0xFF11249F);
const kBlueColor = Color(0xFF3383CD);

// Text Style
const kHeadingTextStyle = TextStyle(
  fontFamily: 'Poppins',
  fontSize: 22,
  fontWeight: FontWeight.w600,
  color: Colors.white,
);

const kCardSubText = TextStyle(
  fontFamily: 'Comfortaa',
  fontSize: 20.0,
  fontWeight: FontWeight.normal,
  color: Colors.black54,
);

const kCardNumber = TextStyle(
  fontFamily: 'Comfortaa',
  fontSize: 24.0,
  color: Colors.black87,
);

const kSubTextStyle =
    TextStyle(fontFamily: 'Poppins', fontSize: 16, color: kTextLightColor);

const kTitleTextstyle = TextStyle(
  fontFamily: 'Comfortaa',
  fontSize: 18,
  color: kTitleTextColor,
  fontWeight: FontWeight.bold,
);

// used in doctor_info_page
const kgreenTitleText = TextStyle(
  fontFamily: 'Comfortaa',
  fontSize: 16,
  color: kDarkGreen,
  fontWeight: FontWeight.bold,
);
final BoxDecoration iconBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(16.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 1.0,
      spreadRadius: 1.0,
    )
  ],
);
final BoxDecoration iconBoxDecoration2 = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(8.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 1.0,
      spreadRadius: 1.0,
    )
  ],
);

// used in search_doctor_screen
final BoxDecoration categoriesBoxDecoration = BoxDecoration(
  color: Colors.white,
  border: Border(
    top: BorderSide.none,
    bottom: BorderSide.none,
    left: BorderSide.none,
    right: BorderSide.none,
  ),
  // border: Border.all(color: Colors.black, width: 1.0),
  borderRadius: BorderRadius.all(Radius.circular(20.0)),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 3.0,
      spreadRadius: 2.0,
    ),
  ],
);
