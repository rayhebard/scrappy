class Favorites {
  int id;
  String title;
  String first_date;
  String last_date;

  Favorites({this.id, this.title, this.first_date, this.last_date});

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'first_date':first_date, 'last_date':last_date};
  }
}