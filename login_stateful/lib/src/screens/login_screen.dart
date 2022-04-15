import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: 'Email Address', hintText: 'you@example.com'),
      validator: (String? value) {
        if (!value!.contains('@')) {
          return 'Please enter a valid email';
        }
        return null;
      },
      onSaved: (value) {
        email = value!;
      },
    );
  }

  Widget passwordField() {
    return Container(
      child: TextFormField(
        obscureText: true,
        decoration:
            InputDecoration(labelText: 'Enter Password', hintText: 'Password'),
        validator: (String? value) {
          if (value!.length < 4) {
            return 'Password must be at least 4 characters';
          }
        },
        onSaved: (value) {
          password = value!;
        },
      ),
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue,
      child: Text('Submit'),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          print('Time to post $email and $password to my API');
        }
      },
    );
  }
}
