// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import
import 'model/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/pages/home.dart';
import 'package:myapp/pages/kid.dart';
import 'package:myapp/pages/men.dart';
import 'package:myapp/pages/sign_in.dart';
import 'package:myapp/pages/sign_up.dart';

void main() {
  runApp(MaterialApp(home: const myapp(), debugShowCheckedModeBanner: false,));
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInPage(),
    );
  }
}
// home page ko data base se connect karna hai
// favorite ko remove karwan hai
//tile ko click karne se ik he tile show hote hai usko thek karna hai