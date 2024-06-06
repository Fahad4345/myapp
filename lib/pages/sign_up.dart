// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import, non_constant_identifier_names, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:myapp/main.dart';
import 'package:myapp/pages/sign_in.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SignUp();
  }
}

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget allTextfield(BuildContext buildContext) {
    return SizedBox(
      width: 500,
      child: (Column(children: [
        Container(height: 30),
        //lock icon
        Container(
            child: const Icon(
          Icons.lock,
          size: 80,
        )),
        //First text field
        TextField(
            decoration: InputDecoration(
                labelText: 'First Name',
                prefixIcon: Icon(Icons.account_circle_sharp))),

        Container(height: 30),
        //Second text field
        TextField(
            decoration: InputDecoration(
                labelText: 'Last Name',
                prefixIcon: Icon(Icons.account_circle_sharp))),
        Container(height: 30),
        //Third text field
        TextField(
            decoration: InputDecoration(
                labelText: 'Email', prefixIcon: Icon(Icons.email_outlined))),
        Container(height: 30),
        //Fourth text field
        TextField(
            decoration: InputDecoration(
                labelText: 'Password', prefixIcon: Icon(Icons.security))),
        Container(height: 30),
        //Fifth text field
        TextField(
            decoration: InputDecoration(
                labelText: 'Confirm Password',
                prefixIcon: Icon(Icons.security))),
        Container(height: 30),
        //SignUp button
        SizedBox(
          width: 300,
          child: ElevatedButton(
              onPressed: () {},
              child: Text("Sign up", style: TextStyle(color: Colors.black87))),
        ),

        Container(height: 20),
        //Login Button
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
                buildContext,
                MaterialPageRoute(
                  builder: (context) => const SignInPage(),
                )); //
          },
          child: Text("Already Have an account?",
              style: TextStyle(color: Colors.black87)),
        )
      ])
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: SizedBox(
              width: 500,
              child: Column(children: [
                Center(
                  //heading
                  child: Text("Outfitter",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 100,
                          fontStyle: FontStyle.italic)),
                ),
                Column(
                  //textfields class
                  children: [allTextfield(context)],
                )
              ])),
        ));
  }
}
