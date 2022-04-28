import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hushot_technologies/Views/Homescreen.dart';
import 'package:hushot_technologies/Views/Signin.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser;
  bool isvisible = false;

  Future Signupuser() async {
    await auth
        .createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text)
        .then((user) {
      auth.currentUser!.sendEmailVerification();
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "Success",
                style: TextStyle(fontSize: 15, fontFamily: 'Montserrat'),
              ),
              content: Text(
                "User Created Successfully",
                style: TextStyle(fontSize: 15, fontFamily: 'Montserrat'),
              ),
              actions: <Widget>[
                MaterialButton(
                  child: Text(
                    "Sign In",
                    style: TextStyle(fontSize: 15, fontFamily: 'Montserrat'),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SignIn()));
                  },
                )
              ],
            );
          });
      //saveuserdata
      saveUser();
      //Navigator.push(context, MaterialPageRoute(builder: (context) => Signin()));
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

  //savedata
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future saveUser() async {
    await firestore.collection('Jobseekers').add({
      'email': _emailController.text,
      'password': _passwordController.text,
      'Phone': _phonenumberController.text,
      'dob': _dateofbirthController.text,
      'gender': _genderController.text.trim(),
      'nationalty': _nationalityController.text.trim(),
      'state': _stateController.text.trim(),
      'city': _cityController.text.trim(),
      'password': _passwordController.text.trim(),
    });
    print('Saved Data');
  }



  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phonenumberController = TextEditingController();
  TextEditingController _dateofbirthController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _nationalityController = TextEditingController();
  TextEditingController _stateController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Text('Find Dream Job',
                      style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                children: [
                  Text('Hire Best of Bests',
                      style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 10),

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
                      controller: _usernameController,
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
                          return 'Email is required';
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
                      controller: _phonenumberController,
                      decoration: InputDecoration(
                        hintText: 'Enter Phone Number',
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(fontFamily: 'montserrat'),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Phone Number is required';
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
                      controller: _dateofbirthController,
                      decoration: InputDecoration(
                        hintText: 'Date of Birth',
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.child_care,
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(fontFamily: 'montserrat'),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Date of Birth is required';
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
                      controller: _genderController,
                      decoration: InputDecoration(
                        hintText: 'Gender',
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(fontFamily: 'montserrat'),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Gender is required';
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
                      controller: _nationalityController,
                      decoration: InputDecoration(
                        hintText: 'Nationality',
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.flag,
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(fontFamily: 'montserrat'),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nationality is required';
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
                      controller: _stateController,
                      decoration: InputDecoration(
                        hintText: 'State',
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.map,
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(fontFamily: 'montserrat'),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'State is required';
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
              //cityspace

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
                      obscureText: isvisible,
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
                        border: InputBorder.none,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isvisible = !isvisible;
                            });
                          },
                          child: Icon(
                            Icons.visibility_off,
                            color: Colors.white,
                          ),
                        ),
                        hintStyle: TextStyle(fontFamily: 'montserrat'),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is required';
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
                    Signupuser();
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
                          child: Text('Create Account',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'montserrat'))),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      ' Existing User? ',
                      style: TextStyle(fontFamily: 'montserrat'),
                    ),
                    GestureDetector(
                        onTap: () {
                         // Setstate();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignIn()));
                        },
                        child: Text(
                          ' Login ',
                          style: TextStyle(
                              fontFamily: 'montserrat', color: Colors.amber),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ) // Figma Flutter Generator SignupWidget - FRAME

          ),
    );
  }
}
