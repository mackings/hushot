import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hushot_technologies/Views/Signin.dart';

class Orgform extends StatefulWidget {
  const Orgform({Key? key}) : super(key: key);

  @override
  State<Orgform> createState() => _OrgformState();
}

class _OrgformState extends State<Orgform> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phonenumberController = TextEditingController();
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
                height: 80,
              ),
              Row(
                children: [
                  Text(' Recruiters',
                      style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text('Hire Best of Bests',
                      style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Tell Us About Your Organisation',
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
                      decoration: InputDecoration(
                        hintText: 'Organisation Name',
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.location_city_sharp,
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(fontFamily: 'montserrat'),
                      ),
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
                      decoration: InputDecoration(
                        hintText: 'Administrative Email',
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(fontFamily: 'montserrat'),
                      ),
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
                      decoration: InputDecoration(
                        hintText: 'Best Phone',
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(fontFamily: 'montserrat'),
                      ),
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
                      decoration: InputDecoration(
                        hintText: 'Organisation Address',
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.map,
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(fontFamily: 'montserrat'),
                      ),
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
                      decoration: InputDecoration(
                        hintText: 'Organisation Website',
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.web,
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(fontFamily: 'montserrat'),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('Success',
                                  style: TextStyle(
                                      fontFamily: 'montserrat',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              content: Text('Your Organisation has been Submitted for Approval',
                                  style: TextStyle(
                                      fontFamily: 'montserrat',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              actions: [
                                FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Ok',
                                      style: TextStyle(
                                          fontFamily: 'montserrat',
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                )
                              ],
                            ));
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
            ],
          ),
        ),
      ) // Figma Flutter Generator SignupWidget - FRAME

          ),
    );
  }
}