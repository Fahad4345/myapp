// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:myapp/pages/home.dart';
import 'package:myapp/pages/sign_up.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      
      home: MySignInPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MySignInPage extends StatefulWidget {
  const MySignInPage({super.key, required this.title});


  final String title;

  @override
  State<MySignInPage> createState() => _MySignInPageState();
}

class _MySignInPageState extends State<MySignInPage> {
   //Email textfield
  Widget _buildEmailTextField() {
    return TextField(
      keyboardType: TextInputType.streetAddress,
      style: Theme.of(context).textTheme.headlineMedium,
      decoration: const InputDecoration(
          labelText: 'Email', prefixIcon: Icon(Icons.email_outlined)),
      );
  }

  bool showPassword = false;
  //Paasword textfield
  Widget passwordTextfield() {
    return TextField(
        keyboardType: TextInputType.number,
        obscureText: !showPassword,
        decoration: InputDecoration(
            labelText: "Password",
            prefixIcon: const Icon(Icons.security),
            suffixIcon: IconButton(
              icon: const Icon(Icons.remove_red_eye),
              color: showPassword ? Colors.blue : Colors.grey,
              onPressed: () {
                setState(() => showPassword = !showPassword);
              },
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Container(
          
          width: MediaQuery.of(context).size.width,
          height:MediaQuery.of(context).size.height,
          child: Column(children: [
            const Center(
              //heading
              child: Text("Outfitter",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 100,
                      fontStyle: FontStyle.italic)),
            ),
            Container(height: 30),
            //lock icon
            Container(child: const Icon(Icons.lock,size: 80,)),
            SizedBox(
              width: 500,
              child: Column(
                children: [
                  //Email textfield
                  _buildEmailTextField(),
                  Container(height: 30),
                  //Pasword textfield
                  passwordTextfield(),
                  Container(height: 30),
                  
                  //SignIn button
                  SizedBox(
                    width: 300,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Home(),
                              ));
                        },
                        child: const Text("Sign In",
                            style: TextStyle(color: Colors.black87))),
                  ),
                  Container(height: 20),
                  
                   TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignUpPage(),
              )); //
        },
        //SignUp button
        child: const Text("Become a Member!",
            style: TextStyle(color: Colors.black87)),
                )
                ],
              ),
            ),
          ]),
        ));
  }
}
