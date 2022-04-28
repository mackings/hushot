import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hushot_technologies/Views/Homescreen.dart';
import 'package:hushot_technologies/Views/Signin.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Acccountpage extends ConsumerStatefulWidget {
  const Acccountpage({Key? key}) : super(key: key);

  @override
  ConsumerState<Acccountpage> createState() => _AcccountpageState();
}

class _AcccountpageState extends ConsumerState<Acccountpage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();



  SaveProfile() async  {
      final SharedPreferences prefs =await
      SharedPreferences.getInstance();
    prefs.setString('name', _nameController.text);
    prefs.setString('email', _emailController.text);
  }

  Getprofile() async {

     final SharedPreferences prefs =await
      SharedPreferences.getInstance();

    var Name = prefs.getString('name')!;
    var Email = prefs.getString('email')!;
    print("Prefs Got $Name ");
    print("prefs Got $Email");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(height: 30),
              Text(
                'Account',
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
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
                      //controller: _usernameController,
                      decoration: InputDecoration(
                        hintText: 'Enter Full Name',
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(fontFamily: 'montserrat'),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Name is required';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
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
                      //controller: _usernameController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(fontFamily: 'montserrat'),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Name is required';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Getprofile();
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width - 30,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text('Update',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'montserrat'))),
                    ),
                  ),
                ),
              ),

              SizedBox(height:10),


               Center(
                child: GestureDetector(
                  onTap: () {
                    //SaveProfile();
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width - 30,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text('Save',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'montserrat'))),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
