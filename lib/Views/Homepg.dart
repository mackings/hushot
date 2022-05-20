import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:hushot_technologies/Views/Account.dart';
import 'package:hushot_technologies/Views/Homescreen.dart';
import 'package:hushot_technologies/Views/Notifications.dart';
import 'package:hushot_technologies/Views/Signin.dart';
import 'package:hushot_technologies/Views/Signup.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:hushot_technologies/Views/applicationform.dart';
import 'package:hushot_technologies/Views/orgform.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hushot_technologies/Views/timeline.dart';

class dahomepg extends ConsumerStatefulWidget {
  const dahomepg({super.key});

  @override
  ConsumerState<dahomepg> createState() => _dahomepgState();
}

class _dahomepgState extends ConsumerState<dahomepg> {
  final remoteconfig = FirebaseRemoteConfig.instance;

  Future Getremotevalues() async {
    final updatevalues = remoteconfig.fetchAndActivate();
    await remoteconfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: Duration(seconds: 1),
      minimumFetchInterval: Duration(seconds: 1),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            //def800
            color: Colors.white,
            padding: const EdgeInsets.only(
              top: 14,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 360,
                  height: 55,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Welcome...",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'montserrat'),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 5.50),
                Container(
                  width: MediaQuery.of(context).size.width - 30,
                  height: 181,
                  //padding: const EdgeInsets.only(left: 26, right: 27, top: 36, bottom: 15, ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 30,
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 28,
                              top: 15,
                              child: SizedBox(
                                width: 80,
                                child: Text(
                                  "Realtime",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'montserrat'),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 28,
                              top: 44,
                              child: Text(
                                "Jobs for You",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'montserrat'),
                              ),
                            ),
                            Positioned(
                              left: 28,
                              top: 79,
                              child: Container(
                                width: 121,
                                height: 32,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xffffbf00),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 28,
                              top: 15,
                              child: SizedBox(
                                width: 80,
                                child: Text(
                                  "Hushot",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 180,
                              top: 87,
                              child: SizedBox(
                                width: 96,
                                height: 24,
                                child: Text(
                                  "Apply Now",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'montserrat'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.50),
                Container(
                  width: 360,
                  height: 54,
                  // padding: const EdgeInsets.only(left: 36, right: 208, top: 20, bottom: 10, ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "latest jobs",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'montserrat'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.50),
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 142,
                  //padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6, ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 40,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 178,
                              top: 70,
                              child: SizedBox(
                                width: 110,
                                child: Text(
                                  "Apply Now",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'montserrat'),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 178,
                              top: 16,
                              child: Container(
                                width: 100,
                                height: 41,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 201,
                              top: 28,
                              child: SizedBox(
                                width: 63,
                                height: 24,
                                child: Text(
                                  "N${remoteconfig.getInt("jobonepay")}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontFamily: 'montserrat'),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 27,
                              top: 16,
                              child: SizedBox(
                                width: 100,
                                child: Text(
                                  "${remoteconfig.getString("jobonetitle")} ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: 'montserrat'),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 108,
                              top: 65,
                              child: Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                //child: Icon(Icons.location_city),
                              ),
                            ),
                            Positioned(
                              left: 27,
                              top: 59,
                              child: Icon(
                                Icons.location_pin,
                                color: Colors.amber,
                                size: 30,
                              ),
                            ),
                            Positioned(
                              left: 67,
                              top: 69,
                              child: SizedBox(
                                width: 80,
                                child: Text(
                                  "${remoteconfig.getString("jobonelocation")}",
                                  style: TextStyle(
                                      color: Colors.amber,
                                      fontSize: 20,
                                      fontFamily: 'montserrat'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.50),
          
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: MediaQuery.of(context).size.height - 480,
                  //padding: const EdgeInsets.only(left: 22, right: 15, top: 6, bottom: 39, ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 40,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 178,
                              top: 69,
                              child: SizedBox(
                                width: 110,
                                child: Text(
                                  "Apply Now",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'montserrat'),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 178,
                              top: 16,
                              child: Container(
                                width: 100,
                                height: 41,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 201,
                              top: 28,
                              child: SizedBox(
                                width: 63,
                                height: 24,
                                child: Text(
                                  "${remoteconfig.getInt("jobtwopay")}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: 'montserrat'),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 67,
                              top: 67,
                              child: SizedBox(
                                width: 80,
                                child: Text(
                                  "${remoteconfig.getString("jobtwolocation")}",
                                  style: TextStyle(
                                      color: Colors.amber,
                                      fontSize: 20,
                                      fontFamily: 'montserrat'),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 27,
                              top: 60,
                              child: Icon(
                                Icons.location_pin,
                                color: Colors.amber,
                                size: 30,
                              ),
                            ),
                            Positioned(
                              left: 27,
                              top: 16,
                              child: SizedBox(
                                width: 100,
                                child: Text(
                                  "${remoteconfig.getString("jobtwotitle")}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: 'montserrat'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "200",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width - 40,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 38,
                                height: 30,
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.home,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 42.33),
                            GestureDetector(
                              onTap: () {
                                Getremotevalues();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TimeLine()));
                              },
                              child: Container(
                                width: 38,
                                height: 40,
                                child: Icon(
                                  Icons.timeline,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                            SizedBox(width: 42.33),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Notifications()));
                              },
                              child: Container(
                                width: 38,
                                height: 40,
                                child: Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                            SizedBox(width: 42.33),
                            GestureDetector(
                              onTap: (() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Acccountpage()));
                              }),
                              child: Container(
                                width: 36,
                                height: 40,
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
