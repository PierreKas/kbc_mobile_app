import 'package:flutter/material.dart';

class MyIcon extends StatelessWidget {
  final IconData myIcon;
  const MyIcon({super.key, required this.myIcon});

  @override
  Widget build(BuildContext context) {
    return Icon(
      myIcon,
      color: Colors.yellow,
    );
  }
}
