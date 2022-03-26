class NameGenres {
  String nameGenres;

  NameGenres({this.nameGenres = ''});

  factory NameGenres.fromJson(Map<String, dynamic> json) {
    return NameGenres(nameGenres: json['name']);
  }

  @override
  String toString() {
    return nameGenres;
  }
}
