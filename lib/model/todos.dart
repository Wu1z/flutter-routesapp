import 'dart:convert';

class Todos {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const Todos({ this.userId, this.id, this.title, this.completed });

  factory Todos.fromJson(Map<String, dynamic> json){
    return Todos(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed']
    );
  }
}

List<Todos> todosJson(String str){
  return List<Todos>.from(json.decode(str)
          .map((data) => Todos.fromJson(data))
  );
}