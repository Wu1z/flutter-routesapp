import 'package:flutter/material.dart';
import '../api/api_connect.dart';
import '../model/todos.dart';

class TodosView extends StatefulWidget{
  @override
  _TodosViewState createState() => _TodosViewState();
}

class _TodosViewState extends State<TodosView> {

  Future<List<Todos>> _futureTodos;

  initState(){
    super.initState();
    _futureTodos = fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('/todos'),
          backgroundColor: Colors.teal,
          elevation: 0.0,
        ),

        body: Container(
          color: Colors.teal,
          padding: EdgeInsets.all(10),
          child: BuildTodos(
              futureTodos: _futureTodos
          )
        ),
      );
  }
}

class BuildTodos extends StatelessWidget {
  const BuildTodos({
    Key key,
    @required Future<List<Todos>> futureTodos,
  }) : _futureTodos = futureTodos, super(key: key);

  final Future<List<Todos>> _futureTodos;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureTodos,
      builder: (context, snapshot){
        if(snapshot.hasData){

          return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, int index){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Row(
                      children: <Widget>[
                        Checkbox(
                          checkColor: Colors.black,
                          activeColor: Colors.tealAccent,
                          value: snapshot.data[index].completed,
                          onChanged: (value) {},
                        ),
                        Expanded(child: Text(snapshot.data[index].title, style: TextStyle(fontWeight: FontWeight.normal))),
                      ],
                    )
                  ],
                );
              }
          );
        } else if(snapshot.hasError){
          return Center(child: Text('Error loading snapshot'));
        }

        return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)));
      }

    );
  }
}