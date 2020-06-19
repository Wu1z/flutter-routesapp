import 'package:flutter/material.dart';
import '../components/route_button.dart';
import '../routes/routes.dart';

class Home extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.indigo,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RouteButton(text: '/posts', route: AppRoutes.POST),
          RouteButton(text: '/comments', route: AppRoutes.COMMENTS),
          RouteButton(text: '/albums', route: AppRoutes.ALBUMS),
          RouteButton(text: '/todos', route: AppRoutes.TODOS),
          RouteButton(text: '/users', route: AppRoutes.USERS)
        ],
      ),
    );
  }
}

