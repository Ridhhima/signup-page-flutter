import 'package:flutter/material.dart';
import 'package:login_page/functions/auth_functions.dart';

class email extends StatefulWidget {
  @override
  State<email> createState() => _emailState();
}

class _emailState extends State<email> {
  String username = '';
  String email = '';
  String password = '';
  bool isLogin = false;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Email/Password Authentication',
            style: TextStyle(color: Colors.white)),
      ),
      body: Form(
        key: _formkey,
        child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                !isLogin
                    ? TextFormField(
                        key: ValueKey('username'),
                        decoration: InputDecoration(
                          hintText: 'Enter username',
                        ),
                        validator: (value) {
                          if (value.toString().length < 3) {
                            return 'Username is too small';
                          } else
                            return null;
                        },
                        onSaved: (value) {
                          setState(() {
                            username = value!;
                          });
                        })
                    : Container(),
                TextFormField(
                  key: ValueKey('email'),
                  decoration: InputDecoration(
                    hintText: 'Enter email',
                  ),
                  validator: (value) {
                    if (!(value.toString().contains('@')))
                      return 'Invalid email';
                    else
                      return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      email = value!;
                    });
                  },
                ),
                TextFormField(
                  obscureText: true,
                  key: ValueKey('password'),
                  decoration: InputDecoration(
                    hintText: "Enter password",
                  ),
                  validator: (value) {
                    if (value.toString().length < 6)
                      return 'Length is too small';
                    else
                      return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      password = value!;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            _formkey.currentState!.save();
                            isLogin
                                ? signIn(email, password)
                                : signUp(email, password);
                          }
                        },
                        child: isLogin ? Text('Login') : Text('SignUp'))),
                SizedBox(
                  height: 5,
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        isLogin = !isLogin;
                      });
                    },
                    child: isLogin
                        ? Text("Don't have an account? SignUp")
                        : Text('Already Signed Up? Login')),
              ],
            )),
      ),
    );
  }
}
