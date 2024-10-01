import 'package:flutter/material.dart';

class UtilButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  UtilButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      minWidth: 125,
      onPressed: onPressed,
      child: Text(text),
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      splashColor: Color.fromARGB(255, 121, 147, 251),
    );
  }
}
