import 'dart:convert';

class Album {
  final int userId;
  final int id;
  final String title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title']
    );
  }
}

List<Album> albumJson(String str){
  return List<Album>.from(json.decode(str)
      .map((data) => Album.fromJson(data))
  );
}