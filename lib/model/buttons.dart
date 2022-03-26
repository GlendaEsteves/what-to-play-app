import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String text;
  final void Function() whenSelected;

  const Buttons(this.text, this.whenSelected);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (whenSelected),
        child: Text(text),
        style: ElevatedButton.styleFrom(
            primary: const Color.fromRGBO(255, 152, 0, 100),
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
            textStyle: const TextStyle(color: Colors.white)));
  }
}
