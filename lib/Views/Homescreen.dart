import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hushot_technologies/Views/applicationform.dart';
import 'package:hushot_technologies/Views/orgform.dart';
import 'package:hushot_technologies/Views/postjob.dart';
import 'package:hushot_technologies/Views/timeline.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ccontrollers = CarouselController();
  final slideimg = [
    'https://www.workitdaily.com/media-library/man-happy-at-a-job-he-doesn-t-like.jpg?id=27147414&width=2000&quality=85&coordinates=40%2C0%2C60%2C0&height=1500'
        'https://number8.com/wp-content/uploads/2017/05/Job-Happiness-Why-You-Should-Look-Into-Tech-1030x687.jpeg'
  ];
  final slideimg2 = [
    'https://number8.com/wp-content/uploads/2017/05/Job-Happiness-Why-You-Should-Look-Into-Tech-1030x687.jpeg'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              SizedBox(height: 50),
              Row(
                children: [
                  Text('lp', style: TextStyle(color: Colors.white)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Postjob()));
                    },
                    child: Icon(
                      Icons.menu,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Welcome BabTech',
                      style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 140,
                  ),
                  GestureDetector(  
                      onTap: (() {
                       // Navigator.push(context, MaterialPageRoute(builder: (context) => Postjob()));
                       Navigator.push(context, MaterialPageRoute(builder: (context) => TimeLine()));
                           
                      }),
                      child: Icon(Icons.timeline)),
                ],
              ),
              SizedBox(height: 10),
              CarouselSlider(
                items: [
                  //container1
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/slide1.jpeg'),
                            fit: BoxFit.cover)),
                  ),

                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/slide2.jpeg'),
                            fit: BoxFit.cover)),
                  ),

                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/slide3.jpeg'),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/slide4.jpeg'),
                            fit: BoxFit.cover)),
                  ),
                ],
                options: CarouselOptions(
                  height: 250,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width - 15,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),

                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 90,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text('Big Data',
                                    style: TextStyle(
                                        fontFamily: 'montserrat',
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 90,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text('Python',
                                    style: TextStyle(
                                        fontFamily: 'montserrat',
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 90,
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text('Java',
                                    style: TextStyle(
                                        fontFamily: 'montserrat',
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        ],
                      ),

                      //second row
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 90,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text('React',
                                    style: TextStyle(
                                        fontFamily: 'montserrat',
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 90,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text('Apps',
                                    style: TextStyle(
                                        fontFamily: 'montserrat',
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 90,
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text('Cloud',
                                    style: TextStyle(
                                        fontFamily: 'montserrat',
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text('Active Hiring',
                              style: TextStyle(
                                  fontFamily: 'montserrat',
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.person_add,
                                color: Colors.white, size: 30),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              CarouselSlider(
                items: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Orgform()));
                      print('Job1');
                    },
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width - 15,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text('Babtech Computers',
                              style: TextStyle(
                                  fontFamily: 'montserrat',
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              SizedBox(width: 40),
                              Text('Job Title:',
                                  style: TextStyle(
                                      fontFamily: 'montserrat',
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(width: 10),
                              Text('Backend Developer',
                                  style: TextStyle(
                                      fontFamily: 'montserrat',
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(width: 70),
                              Text('Job Status:',
                                  style: TextStyle(
                                      fontFamily: 'montserrat',
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(width: 10),
                              Text('Available',
                                  style: TextStyle(
                                      fontFamily: 'montserrat',
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                options: CarouselOptions(
                  height: 90,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
