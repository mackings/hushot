import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hushot_technologies/Views/Homepg.dart';
import 'package:hushot_technologies/Views/Homescreen.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final RoundedLoadingButtonController _btnController =new RoundedLoadingButtonController();


  final FirebaseAuth _auth = FirebaseAuth.instance;
  //final user = FirebaseAuth.instance.currentUser!;
  //final Useremail = FirebaseAuth.instance.currentUser!.email;

  void Signin() async {
  
await _auth
        .signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text)
        .then((user) {
          
        
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => dahomepg()));
    }).catchError((e) {
      print(e);
      
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "Error",
                style: TextStyle(fontSize: 15, fontFamily: 'Montserrat'),
              ),
              content: Text(
                e.message,
                style: TextStyle(fontSize: 15, fontFamily: 'Montserrat'),
              ),
              actions: <Widget>[
                MaterialButton(
                  child: Text(
                    "Ok",
                    style: TextStyle(fontSize: 15, fontFamily: 'Montserrat'),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 170,
                ),
                Text('Hushot Jobs',
                    style: TextStyle(
                        fontFamily: 'montserrat',
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text('Sign in to continue',
                          style: TextStyle(
                              fontFamily: 'montserrat',
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width - 30,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'Enter Email',
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          hintStyle: TextStyle(fontFamily: 'montserrat'),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width - 30,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Enter Password',
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.visibility_off,
                            color: Colors.white,
                          ),
                          hintStyle: TextStyle(fontFamily: 'montserrat'),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a valid password';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      
                    Signin();
                      // print(Useremail);
                    },
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width - 30,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: RoundedLoadingButton(
                        color: Colors.black,
                        
                        controller: _btnController,
                         onPressed: () {
                          Signin();
                         },
                         child: Text('Login', style: TextStyle(color: Colors.white, fontFamily: 'montserrat')),
                         )
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text(
                        ' Forgot Password? ',
                        style: TextStyle(fontFamily: 'montserrat'),
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: Text(
                            ' RESET',
                            style: TextStyle(
                                fontFamily: 'montserrat', color: Colors.amber),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
