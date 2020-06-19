import 'package:flutter/material.dart';
import '../model/users.dart';

class UserDetails extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    final User _arg = ModalRoute.of(context).settings.arguments;
    final _infoStyle = TextStyle(fontWeight: FontWeight.w200, fontSize: 16, color: Colors.white);
    final _titleStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white);

    return Scaffold(
      appBar: AppBar(
        title: Text('/users/' + _arg.id.toString()),
        backgroundColor: Colors.lightGreen,
        elevation: 0.0
      ),

      body: Container(
          color: Colors.lightGreen,
          padding: EdgeInsets.all(10),
          child: Card(
            color: Colors.black26,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Text('Informations', style: _titleStyle),
                      Divider(color: Colors.white),
                      Text('Username: ${_arg.username}', style: _infoStyle),
                      Text('Name: ${_arg.name}', style: _infoStyle),
                      Text('Email: ${_arg.email}', style: _infoStyle),

                      SizedBox(height: 15),
                      Text('Address', style: _titleStyle),
                      Divider(color: Colors.white),

                      Text('Street: ${_arg.address.street}', style: _infoStyle),
                      Text('Suite: ${_arg.address.suite}', style: _infoStyle),
                      Text('City: ${_arg.address.city}', style: _infoStyle),
                      Text('Zipcode: ${_arg.address.zipcode}', style: _infoStyle),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('lat: ${_arg.address.geo.lat}', style: _infoStyle),
                          Text('lng: ${_arg.address.geo.lng}', style: _infoStyle),
                        ],
                      ),

                      SizedBox(height: 15),
                      Text('Company', style: _titleStyle),
                      Divider(color: Colors.white),

                      Text('Name: ${_arg.company.name}', style: _infoStyle),
                      Text('CatchPhrase: ${_arg.company.catchPhrase}', style: _infoStyle),
                      Text('BS: ${_arg.company.bs}', style: _infoStyle),

                      SizedBox(height: 15),
                      Text('Contact', style: _titleStyle),
                      Divider(color: Colors.white),

                      Text('Phone: ${_arg.phone}', style: _infoStyle),
                      Text('Website: ${_arg.website}', style: _infoStyle),
                    ],
                  ),
                )
              ],
            ),
          )
      )
    );
  }
}