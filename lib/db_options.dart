import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_page/functions/database_functions.dart';
import 'package:login_page/pages/pets.dart';
import 'package:flutter/material.dart';

class db_options extends StatefulWidget {
  @override
  State<db_options> createState() => _db_optionsState();
}

class _db_optionsState extends State<db_options> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DataBase Options'), actions: [
        IconButton(
          icon: const Icon(Icons.logout_outlined),
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
          },
        ),
      ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  create('pets', 'khargosh', 'khargosh', 'Rabbit', 3);
                },
                child: Text('Create')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => pets()));
                },
                child: Text('Retrieve')),
            ElevatedButton(
                onPressed: () {
                  update('pets', 'khargosh', 'age', 6);
                },
                child: Text('Update')),
            ElevatedButton(
                onPressed: () {
                  delete('pets', 'khargosh');
                },
                child: Text('Delete')),
          ],
        ),
      ),
    );
  }
}
