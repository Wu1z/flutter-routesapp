import 'package:flutter/material.dart';
import '../api/api_connect.dart';
import '../model/comments.dart';

class CommentView extends StatefulWidget{
  @override
  _CommentViewState createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {

  Future<List<Comments>> _futureComment;

  @override
  void initState(){
    super.initState();
    _futureComment = fetchComments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('/comments'),
        backgroundColor: Colors.blue,
        elevation: 0.0,
      ),

      body: Container(
        color: Colors.blue,
          child: BuildComment(
            futureComment: _futureComment,
          ),
        ),
      );
  }
}

class BuildComment extends StatelessWidget {
  const BuildComment({
    Key key,
    @required Future<List<Comments>> futureComment,
  }) : _futureComment = futureComment, super(key: key);

  final Future<List<Comments>> _futureComment;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureComment,
      builder: (context, snapshot){
        if(snapshot.hasData){
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index){
              return Container(
                padding: EdgeInsets.only(bottom: 2, top: 2, left: 10, right: 10),
                child: Card(
                  color: Colors.black26,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Text(snapshot.data[index].name, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                        Text('(${snapshot.data[index].email})'),
                        Divider(color: Colors.white),
                        Text(snapshot.data[index].body, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100))
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else if(snapshot.hasError) {
          return Center(child: Text('Error loading snapshot'));
        }

        return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)));
      }

    );
  }
}