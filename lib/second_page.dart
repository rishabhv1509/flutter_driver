import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Text field to be tested'),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              width: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                key: Key('textfield'),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          RaisedButton(
            key: Key('navigation_previous'),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Navigate to previous page'),
          )
        ],
      ),
    );
  }
}
