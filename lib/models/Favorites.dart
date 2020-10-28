class Favorites {
  int id;
  String title;

  Favorites({this.id, this.title});

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title};
  }
}