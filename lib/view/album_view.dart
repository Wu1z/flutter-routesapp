import 'package:flutter/material.dart';
import '../api/api_connect.dart';
import '../model/album.dart';

class AlbumView extends StatefulWidget{
  @override
  _AlbumViewState createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  Future<List<Album>> _futureAlbum;

  @override
  void initState(){
    super.initState();
    _futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 0.0,
        title: Text('/albums')
      ),

      body: Container(
        color: Colors.cyan,

        child: BuildAlbum(
            futureAlbum: _futureAlbum
        ),
      ),
    );
  }
}

class BuildAlbum extends StatelessWidget {
  const BuildAlbum({
    Key key,
    @required Future<List<Album>> futureAlbum,
  }) : _futureAlbum = futureAlbum, super(key: key);

  final Future<List<Album>> _futureAlbum;

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Album>>(
      future: _futureAlbum,
      builder: (context, snapshot){
        if(snapshot.hasData){

          return ListView.separated(
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) => Divider(),
            itemCount: 12,
            itemBuilder: (context, index){
              return ListTile(
                title: Text('Album ${snapshot.data[index].id}'),
                subtitle: Text(snapshot.data[index].title),
              );
            }
          );

        } else if(snapshot.hasError){
          return Center(child: Text('${snapshot.error}'));
        }

        return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)));
      }
    );
  }
}