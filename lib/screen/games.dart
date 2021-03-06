import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import '../auth/secrets.dart';
import '../model/games.dart';
import '../model/name_games.dart';

class GamesScreen extends StatefulWidget {
  GamesScreen({required this.genre, Key? key}) : super(key: key);

  String genre;
  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  late Future<Games> futureGames;
  var nameGenre;
  List listGames = [];

  @override
  initState() {
    nameGenre = widget.genre.toLowerCase().replaceAll(' ', '-');
    super.initState();
    futureGames = fetchGames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            const Text(
              'What About?',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            FutureBuilder<Games>(
              future: futureGames,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    randomGame(snapshot.data!.results).toString(),
                    style: TextStyle(fontSize: 36),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
          ]),
        ),
      ),
    );
  }

  Future<Games> fetchGames() async {
    if (nameGenre == 'rpg') {
      nameGenre = 'role-playing-games-rpg';
    }
    final url =
        'https://api.rawg.io/api/games?key=$apiKey&genres=$nameGenre&page_size=10&ordering=-added';
    final response = await http.get(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json',
      'token': 'Token $apiKey'
    });

    if (response.statusCode == 200) {
      return Games.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }

  NameGames randomGame(List listGames) {
    final random = Random();
    var choosenGame = listGames[random.nextInt(listGames.length)];
    return choosenGame;
  }
}
