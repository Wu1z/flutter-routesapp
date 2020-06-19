import 'package:flutter/material.dart';
import '../routes/routes.dart';
import '../model/users.dart';
import '../api/api_connect.dart';

class UsersView extends StatefulWidget{
  @override
  _UsersViewState createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  Future<List<User>> _futureUsers;

  @override
  void initState(){
    super.initState();
    _futureUsers = fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('/users'),
          elevation: 0.0,
          backgroundColor: Colors.green,
        ),

        body: Container(
          color: Colors.green,
          child: BuildUser(
              futureUsers: _futureUsers
          ),
        ),
      );
  }
}

class BuildUser extends StatelessWidget {
  const BuildUser({
    Key key,
    @required this.futureUsers,
  }) : super(key: key);

  final Future<List<User>> futureUsers;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureUsers,
      builder: (context, snapshot){
        if(snapshot.hasData){
          return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {

                return ListTile(
                  contentPadding: EdgeInsets.all(10),
                  leading: CircleAvatar(
                    child: Icon(Icons.person_outline, color: Colors.black54,),
                    backgroundColor: Colors.lightGreen,
                  ),

                  title: Text(snapshot.data[index].name),
                  subtitle: Text(snapshot.data[index].username),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: (){
                      Navigator.pushNamed(context, AppRoutes.USER_DETAIL, arguments: snapshot.data[index]);
                    },
                  ),
                );
              }
          );


        } else if(snapshot.hasError){
          return Center(child: Text('${snapshot.error}'));
        }

        return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),));
      }
    );
  }
}