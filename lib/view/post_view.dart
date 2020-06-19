import 'package:flutter/material.dart';
import '../model/post.dart';
import '../api/api_connect.dart';

class PostView extends StatefulWidget{
  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  Future<List<Post>> _futurePost;

  @override
  void initState() {
    super.initState();
    _futurePost = fetchPost();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('/posts'),
        backgroundColor: Colors.deepPurple,
        elevation: 0.0,
      ),

      body: Container(
        color: Colors.deepPurple,
        child: BuildPost(futurePost: _futurePost),
      ),
    );
  }
}

class BuildPost extends StatelessWidget {
  const BuildPost({
    Key key,
    @required Future<List<Post>> futurePost,
  }) : _futurePost = futurePost, super(key: key);

  final Future<List<Post>> _futurePost;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futurePost,
      builder: (context, snapshot){
        if(snapshot.hasData){

          return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: 2, top: 2, left: 10, right: 10),
                      child: Card(
                        color: Colors.black38,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Text(snapshot.data[index].title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              Divider(color: Colors.white),
                              Text(snapshot.data[index].body, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100))
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                );
              }

          );
        } else if (snapshot.hasError){
          return Center(child: Text('Erro ao carregar Post'));
        }
        return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)));
      }


    );
  }
}