import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:what_to_play/model/buttons.dart';
import 'package:what_to_play/screen/games.dart';

import '../auth/secrets.dart';
import '../model/games.dart';

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
    var nameGenre;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text(
              'Choose a genre:',
              style: TextStyle(fontSize: 20),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  ...listGenres
                      .asMap()
                      .entries
                      .map((e) => Buttons(e.value.toString(), () async {
                            nameGenre = e.value.toString();
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        GamesScreen(genre: nameGenre)));
                          }))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
