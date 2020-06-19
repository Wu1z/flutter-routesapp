import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'routes/routes.dart';
import 'view/home.dart';
import 'view/album_view.dart';
import 'view/comment_view.dart';
import 'view/post_view.dart';
import 'view/todos_view.dart';
import 'view/user_details.dart';
import 'view/users_view.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
  ));

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "RoutesApp",
      initialRoute: '/',
      routes: {
        AppRoutes.HOME : (context) => Home(),
        AppRoutes.POST : (context) => PostView(),
        AppRoutes.COMMENTS : (context) => CommentView(),
        AppRoutes.ALBUMS : (context) => AlbumView(),
        AppRoutes.TODOS : (context) => TodosView(),
        AppRoutes.USERS : (context) => UsersView(),
        AppRoutes.USER_DETAIL : (context) => UserDetails()
      },
  ));
}
