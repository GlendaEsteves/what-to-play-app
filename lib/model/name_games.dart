import 'package:what_to_play/model/name_genres.dart';

class NameGames {
  String nameGames;

  NameGames({this.nameGames = ''});

  factory NameGames.fromJson(Map<String, dynamic> json) {
    return NameGames(nameGames: json['name']);
  }

  @override
  String toString() {
    return nameGames;
  }
}
