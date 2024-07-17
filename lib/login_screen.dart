import 'package:flutter/material.dart';
import 'package:http/http.dart';

class signup_screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _signup_screenState();
}

class _signup_screenState extends State<signup_screen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  void login(String email, String password) async {
    try {
      Response response =
          await post(Uri.parse('https://reqres.in/api/register'), body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        print('account created successful..');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Sign Up'))),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'email',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'password',
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
                onPressed: () => login(emailController.text.toString(),
                    passwordController.text.toString()),
                child: Text('Sign Up')),
          ],
        ),
      ),
    );
  }
}
