import 'package:flutter/material.dart';

class TextFieldLabel extends StatelessWidget {
  final String labelContent; // Marked as final
  const TextFieldLabel({super.key, required this.labelContent});

  @override
  Widget build(BuildContext context) {
    return Text(
      labelContent,
      textAlign: TextAlign.start,
      style: TextStyle(
          color: Colors.black.withOpacity(0.7), fontWeight: FontWeight.bold),
    );
  }
}
