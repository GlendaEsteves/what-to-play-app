import 'package:what_to_play/model/name_genres.dart';

class Genres {
  int count;
  List<NameGenres> results;

  Genres({required this.count, required this.results});

  factory Genres.fromJson(Map<String, dynamic> json) {
    return Genres(
        count: json['count'],
        results: List.from(json['results'])
            .map((e) => NameGenres.fromJson(e))
            .toList());
  }

  @override
  String toString() {
    return 'Genres{count: $count, results: $results}';
  }
}
