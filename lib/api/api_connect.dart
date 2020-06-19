
import 'package:http/http.dart' as http;
import '../routes/routes.dart';
import '../model/album.dart';
import '../model/post.dart';
import '../model/comments.dart';
import '../model/todos.dart';
import '../model/users.dart';

const url = 'https://jsonplaceholder.typicode.com';

Future<List<Post>> fetchPost() async {

  final _response = await http.get(url + AppRoutes.POST);

  if(_response.statusCode == 200){
    return postJson(_response.body);
  } else {
    throw Exception('Loading Failed! ...');
  }
}

Future<List<Comments>> fetchComments() async {
  final _response = await http.get(url + AppRoutes.COMMENTS);

  if(_response.statusCode == 200) {
    return commentsJson(_response.body);
  } else {
    throw Exception('Loading Comments error ... ');
  }
}

Future<List<Album>> fetchAlbum() async{
  final _response = await http.get(url + AppRoutes.ALBUMS);

  if(_response.statusCode == 200){
    return albumJson(_response.body);
  } else {
    throw Exception('Failed to load Album ...');
  }
}

Future<List<Todos>> fetchTodos() async {
  final _response = await http.get(url + AppRoutes.TODOS);

  if(_response.statusCode == 200){
    return todosJson(_response.body);
  } else {
    throw Exception('Failed to load Todos ...');
  }
}

Future<List<User>> fetchUsers() async {
  final _response = await http.get(url + AppRoutes.USERS);

  if(_response.statusCode == 200){
    return userJson(_response.body);
  } else {
    throw Exception('Failed to load Users ...');
  }
}





