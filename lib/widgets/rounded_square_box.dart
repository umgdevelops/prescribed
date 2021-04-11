import 'package:flutter/material.dart';

class RoundedSquareBox extends StatelessWidget {
  RoundedSquareBox({
    @required this.childContent,
    this.pillDimension,
    this.boxColor,
    this.childDecoration,
  });

  final double pillDimension;
  final Color boxColor;
  final Widget childContent;
  final BoxDecoration childDecoration;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: childContent,
      width: pillDimension,
      height: pillDimension,
      margin: EdgeInsets.only(right: 20),
      decoration: childDecoration,
    );
  }
}
