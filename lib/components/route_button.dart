import 'package:flutter/material.dart';

class RouteButton extends StatelessWidget {
  final String text;
  final String route;

  RouteButton({
    Key key,
    @required this.text,
    @required this.route
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8, top: 0, left: 10, right: 10),
      child: SizedBox(
        width: double.infinity,

        child: RaisedButton(
          highlightColor: Colors.black,
          color: Colors.black26,
          padding: EdgeInsets.all(14),
          child: Text(
              '$text',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)
          ),

          onPressed: () {
            Navigator.pushNamed(context, route);
          },

        ),
      ),
    );
  }
}