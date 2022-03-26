import 'package:flutter/material.dart';
import 'package:what_to_play/model/buttons.dart';

class GenresScreen extends StatefulWidget {
  GenresScreen({required this.listGenres, Key? key}) : super(key: key);

  List listGenres;

  @override
  State<GenresScreen> createState() => _GenresScreenState();
}

class _GenresScreenState extends State<GenresScreen> {
  @override
  Widget build(BuildContext context) {
    var listGenres = widget.listGenres;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          const Text('Choose a genre:'),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                ...listGenres
                    .asMap()
                    .entries
                    .map((e) => Buttons(e.value.toString(), () async {}))
              ],
            ),
          )
        ],
      )),
    );
  }
}
