import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hushot_technologies/Views/applicationform.dart';
import 'package:hushot_technologies/Views/orgform.dart';
import 'package:hushot_technologies/Views/postjob.dart';
import 'package:hushot_technologies/Views/timeline.dart';

class Orgdashboard extends StatefulWidget {
  const Orgdashboard({Key? key}) : super(key: key);

  @override
  State<Orgdashboard> createState() => _OrgdashboardState();
}

class _OrgdashboardState extends State<Orgdashboard> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  dynamic allusers;
//getusers
  Future getallusers() async {
   
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Container(
              child: Column(children: [
                SizedBox(
                  height: 50,
                ),

                Text(
                  'Organization Dashboard',
                  style: TextStyle(
                      fontFamily: 'montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Postjob()));
                          },
                          child: Container(
                            height: 100,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(children: [
                              SizedBox(
                                height: 10,
                              ),
                              Icon(
                                Icons.people,
                                color: Colors.white,
                                size: 20,
                              ),
                              Text(
                                'Post a Job',
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                            ]),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 100,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(children: [
                            SizedBox(
                              height: 10,
                            ),
                            Icon(
                              Icons.people,
                              color: Colors.white,
                              size: 20,
                            ),
                            Text(
                              'View Toppers',
                              style: TextStyle(
                                  fontFamily: 'montserrat',
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                          ]),
                        )
                      ],
                    )
                  ],
                ),

                //R2
                SizedBox(
                  height: 50,
                ),

                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            //getallusers();
                          },
                          child: Container(
                            height: 100,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(children: [
                              SizedBox(
                                height: 10,
                              ),
                              Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 20,
                              ),
                              Text(
                                'All Users',
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                              Text(
                                '0',
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                            ]),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 100,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(children: [
                            SizedBox(
                              height: 10,
                            ),
                            Icon(
                              Icons.people,
                              color: Colors.white,
                              size: 20,
                            ),
                            Text(
                              'View Toppers',
                              style: TextStyle(
                                  fontFamily: 'montserrat',
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                          ]),
                        )
                      ],
                    )
                  ],
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
