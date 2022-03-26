import 'dart:convert';

import 'package:flutter/material.dart';
import './auth/secrets.dart';
import './model/genres.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'What To Play',
      theme:
          ThemeData(primarySwatch: Colors.orange, brightness: Brightness.dark),
      home: const MyHomePage(title: 'What To Play?'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<Genres> futureGenres;

  @override
  initState() {
    super.initState();
    futureGenres = fetchGenres();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              var lista = await futureGenres;
              print(lista.results.toString());
            },
            child: const Text('Teste')),
      ),
    );
  }
}

Future<Genres> fetchGenres() async {
  final url = 'https://api.rawg.io/api/genres?key=$apiKey';
  final response = await http.get(Uri.parse(url), headers: <String, String>{
    'Content-Type': 'application/json',
    'token': 'Token $apiKey'
  });

  if (response.statusCode == 200) {
    return Genres.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
