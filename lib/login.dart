import 'package:flutter/material.dart';
import 'package:flutter_workshop/tabs/tab_screen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Login',
            style: TextStyle(fontSize: 30),
          ),
          Icon(
            Icons.home,
            size: 100,
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'username',
            )

          ),
          TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              )

          ),


          RaisedButton(
            child: Text('Login'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TabScreen())
              )
          ),
        ],
      ),
    );
  }
}
