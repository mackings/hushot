import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hushot_technologies/Views/Signup.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:hushot_technologies/Views/applicationform.dart';
import 'package:hushot_technologies/Views/orgform.dart';

class Onboard1 extends StatefulWidget {
  const Onboard1({Key? key}) : super(key: key);

  @override
  State<Onboard1> createState() => _Onboard1State();
}

class _Onboard1State extends State<Onboard1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(children: [
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Connecting The Best \n To The Best',
                    style: TextStyle(
                        fontFamily: 'montserrat',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              CarouselSlider(
                items: [
                  //it1
                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width - 30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/connect.png'),
                          fit: BoxFit.cover),
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  //it2
                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width - 30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/hire.png'),
                          fit: BoxFit.cover),
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  //it3
                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width - 30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/remote.png'),
                          fit: BoxFit.cover),
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  //it3
                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width - 30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/remote2.png'),
                          fit: BoxFit.cover),
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
                options: CarouselOptions(
                  aspectRatio: 2.0,
                  viewportFraction: 0.9,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 60,
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.black,
                        size: 50,
                      ),
                      Text(
                        '100 HRMs',
                        style: TextStyle(
                            fontFamily: 'montserrat',
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.location_city,
                        color: Colors.blue,
                        size: 50,
                      ),
                      Text(
                        '3000 Jobs Updates',
                        style: TextStyle(
                            fontFamily: 'montserrat',
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.people,
                        color: Colors.amber,
                        size: 50,
                      ),
                      Text(
                        '7000 Freelancers',
                        style: TextStyle(
                            fontFamily: 'montserrat',
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.location_city,
                        color: Colors.black,
                        size: 50,
                      ),
                      Text(
                        '6000 Projects',
                        style: TextStyle(
                            fontFamily: 'montserrat',
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                     MaterialPageRoute(builder: (context) => Orgform()));
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width - 30,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Recruiter',
                      style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Signup()));
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width - 30,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Job Seeker',
                      style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
