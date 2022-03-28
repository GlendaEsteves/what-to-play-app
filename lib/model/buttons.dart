import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String text;
  final void Function() whenSelected;

  const Buttons(this.text, this.whenSelected);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (whenSelected),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: const BorderSide(color: Colors.orange),
            ))));
  }
}
