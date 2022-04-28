import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hushot_technologies/Views/Notifications.dart';
import 'package:hushot_technologies/Views/applicationform.dart';
import 'package:hushot_technologies/Views/orgform.dart';
import 'package:hushot_technologies/Views/postjob.dart';
import 'package:hushot_technologies/Views/timeline.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hushot_technologies/Views/Onboard1.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  Future getiddata() async {}

  final remoteconfig = FirebaseRemoteConfig.instance;

  Future Getremotevalues() async {
    final updatevalues = remoteconfig.fetchAndActivate();
    await remoteconfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: Duration(seconds: 1),
      minimumFetchInterval: Duration(seconds: 1),
    ));
  }

  final ccontrollers = CarouselController();
  final slideimg = [
    'https://www.workitdaily.com/media-library/man-happy-at-a-job-he-doesn-t-like.jpg?id=27147414&width=2000&quality=85&coordinates=40%2C0%2C60%2C0&height=1500'
        'https://number8.com/wp-content/uploads/2017/05/Job-Happiness-Why-You-Should-Look-Into-Tech-1030x687.jpeg'
  ];
  final slideimg2 = [
    'https://number8.com/wp-content/uploads/2017/05/Job-Happiness-Why-You-Should-Look-Into-Tech-1030x687.jpeg'
  ];

  final Usermail = FirebaseAuth.instance.currentUser!.email;

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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Postjob()));
                    },
                    child: Icon(
                      Icons.menu,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Welcome User',
                      style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 160,
                  ),
                  GestureDetector(
                      onTap: (() {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => Postjob()));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TimeLine()));
                      }),
                      child: Icon(Icons.emergency)),
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
              SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height - 700,
                width: MediaQuery.of(context).size.width - 20,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 15),
                    GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(Icons.home, color: Colors.white, size: 30),
                              Text('Home',
                                  style: TextStyle(
                                      fontFamily: 'montserrat',
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        )),
                    SizedBox(width: 15),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TimeLine()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(Icons.timeline,
                                  color: Colors.white, size: 30),
                              Text('Job Timeline',
                                  style: TextStyle(
                                      fontFamily: 'montserrat',
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        )),
                    SizedBox(width: 15),
                    GestureDetector(
                        onTap: () {
                          Getremotevalues();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Notifications()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(Icons.notifications,
                                  color: Colors.white, size: 30),
                              Text('Notifications',
                                  style: TextStyle(
                                      fontFamily: 'montserrat',
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        )),
                    SizedBox(width: 15),
                    GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(Icons.person, color: Colors.white, size: 30),
                              Text('Account',
                                  style: TextStyle(
                                      fontFamily: 'montserrat',
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
