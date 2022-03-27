import 'package:what_to_play/model/name_games.dart';

class Games {
  int count;
  List<NameGames> results;

  Games({required this.count, required this.results});

  factory Games.fromJson(Map<String, dynamic> json) {
    return Games(
        count: json['count'],
        results: List.from(json['results'])
            .map((e) => NameGames.fromJson(e))
            .toList());
  }

  @override
  String toString() {
    return 'Genres{count: $count, results: $results}';
  }
}
