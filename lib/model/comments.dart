import 'dart:convert';

class Comments{
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  Comments({this.postId, this.id, this.name, this.email, this.body});

  factory Comments.fromJson(Map<String, dynamic> json) {
    return Comments(
      postId: json['postId'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body']
    );
  }
}

List<Comments> commentsJson(String str){
  return List<Comments>.from(json.decode(str)
      .map((data) => Comments.fromJson(data))
  );
}