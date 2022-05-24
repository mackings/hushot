import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hushot_technologies/Views/Account.dart';
import 'package:hushot_technologies/Views/Notifications.dart';
import 'package:hushot_technologies/Views/applicationform.dart';
import 'package:hushot_technologies/Views/orgform.dart';
import 'package:hushot_technologies/Views/postjob.dart';
import 'package:hushot_technologies/Views/profileupdates.dart';
import 'package:hushot_technologies/Views/timeline.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hushot_technologies/Views/Onboard1.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  Apply() async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Error',
                  style: TextStyle(
                      fontFamily: 'montserrat',
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              content: Text('Premium Members Only',
                  style: TextStyle(
                      fontFamily: 'montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              actions: [
                MaterialButton(
                  onPressed: () {},
                  child: Text('Buy Now',
                      style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
                MaterialButton(
                  onPressed: () {},
                  child: Text('Others',
                      style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Exit',
                      style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                )
              ],
            ));
  }

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
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            SizedBox(height: 30),
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
                Text('Hello Hushoters',
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

               Container(
                 height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width - 20,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          CircleAvatar(
                            child: Icon(Icons.person),
                          )
                        ],
                      ),

                      SizedBox(height: 50,),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text('Designer',
                                  style: TextStyle(
                                      fontFamily: 'montserrat',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                 )
               
              ],
              options: CarouselOptions(
                height: 240,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Top Jobs',
                      style: TextStyle(
                          fontSize: 20, fontFamily: 'montserrat')),
                ),
              ],
            ),
            Container(
              height: 110,
              width: MediaQuery.of(context).size.width - 30,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                 
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text('Service Design',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'montserrat')),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.black,
                            size: 20,
                          ),
                          Text('California',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontFamily: 'montserrat')),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              height: 30,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text('5.0',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontFamily: 'montserrat'))),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 30,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text('Lagos',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontFamily: 'montserrat'))),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  GestureDetector(
                      onTap: () {
                        Apply();
                      },
                      child: Icon(
                        Icons.telegram,
                        color: Colors.white,
                        size: 50,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width - 20,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                 
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text('Service Design',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontFamily: 'montserrat')),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 20,
                          ),
                          Text('California',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontFamily: 'montserrat')),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              height: 30,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text('5.0',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontFamily: 'montserrat'))),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 30,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text('Lagos',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontFamily: 'montserrat'))),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  Icon(
                    Icons.telegram,
                    color: Colors.white,
                    size: 50,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width - 30,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //SizedBox(width: 15),
                  GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
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
                  SizedBox(width: 10),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TimeLine()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
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
                  SizedBox(width: 10),
                  GestureDetector(
                      onTap: () {
                        Getremotevalues();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Notifications()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
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
                  SizedBox(width: 10),
                  GestureDetector(
                      onTap: () {
                        //Navigator.push(
                         ///   context,
                         //   MaterialPageRoute(
                          //      builder: (context) => Acccountpage()));
                           Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Profileupdates()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Icon(Icons.person,
                                color: Colors.white, size: 30),
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
    );
  }
}
