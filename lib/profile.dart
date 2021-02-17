import 'package:flutter/material.dart';
import 'package:flutter_workshop/models/employee.models.dart';
import 'package:flutter_workshop/services/users.service.dart';

import 'models/user.model.ts.dart';
import 'services/employee.service.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}



class _ProfileState extends State<Profile> {

  @override
    Widget build(BuildContext context){
      EmployeeService().getUsers().then((value) {
      });

    return Scaffold(
      appBar: AppBar(
        title: Text('ผู้ใช้'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        height: MediaQuery.of(context).size.height * 0.35,
        child: Card(
          color: Colors.deepPurpleAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),

          ),
          elevation: 8,
          child: Container(
            child: Center(),

          ),
        ),
      ),

    );

  }
}
