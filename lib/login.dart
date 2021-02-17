import 'package:flutter/material.dart';
import 'package:flutter_workshop/tabs/tab_screen.dart';
import 'validators.dart' as validators;
import 'services/auth.service.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _usernameController = TextEditingController();
      TextEditingController _passwordController = TextEditingController();
      final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
      child: Column(
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

          TextFormField(
            controller: _usernameController,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              // hintText: 'What do people call you?',
              labelText: 'username ',
            ),
            onSaved: (String value) {
              // This optional block of code can be used to run
              // code when the user saves the form.
            },
            validator: (String value) => validators.validateIsEmpty(value),
          ),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              // hintText: 'What do people call you?',
              labelText: 'password ',
            ),
            onSaved: (String value) {
              // This optional block of code can be used to run
              // code when the user saves the form.
            },
            validator: (String value) => validators.validateIsEmpty(value),
          ),


          RaisedButton(
              child: Text('Sign In'),
              onPressed: () {
                this._formKey.currentState.save();
                print(this._formKey.currentState.validate());
                if (this._formKey.currentState.validate()) {
                  AuthService().onLogin(this._usernameController.text, this._passwordController.text).then((response) {
                    // AuthService().setToken(response);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TabScreen())
                    );
                  });
                } else {
                  print('ยังไม่สมบูรณ์');
                }
              }
          ),



        ]
    ),
    ),
    );

  }
}
