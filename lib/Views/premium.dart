import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hushot_technologies/Views/Homescreen.dart';
import 'package:hushot_technologies/Views/Signin.dart';
import 'package:hushot_technologies/Views/Signup.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:hushot_technologies/Views/applicationform.dart';
import 'package:hushot_technologies/Views/orgform.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            //padding: const EdgeInsets.only(top: 38, bottom: 36, ),
            child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
             
              SizedBox(height: 50),
              Container(
                  width: MediaQuery.of(context).size.width-50,
                  height: 141,
                  //padding: const EdgeInsets.only(left: 17, right: 19, top: 13, ),
                  child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children:[
                          Container(
                              width: MediaQuery.of(context).size.width - 50,
                              height: 128,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xffffbf00),
                              ),
                              child: Stack(
                                  children:[
                                      Positioned(
                                          left: 197,
                                          top: 87,
                                          child: Container(
                                              width: 74,
                                              height: 26,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.black,
                                              ),
                                          ),
                                      ),
                                      Positioned(
                                          left: 211,
                                          top: 92,
                                          child: Text(
                                              "Ibadan",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  fontFamily:"Montserrat"
                                              ),
                                          ),
                                      ),
                                      Positioned(
                                          left: 101,
                                          top: 42,
                                          child: Text(
                                              "WEB DESIGNER",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                  fontFamily:"Montserrat"
                                              ),
                                          ),
                                      ),
                                      Positioned(
                                          left: 94,
                                          top: 6,
                                          child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children:[
                                                      Text(
                                                          "Adolphs Hitlers",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 13,
                                                              fontFamily:"Montserrat"
                                                          ),
                                                      ),
                                                  ],
                                              ),
                                          ),
                                      ),
                                      Positioned(
                                          left: 18,
                                          top: 14,
                                          child: Container(
                                              width: 61,
                                              height: 58,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xff232121),
                                              ),
                                          ),
                                      ),
                                      Positioned(
                                          left: 104,
                                          top: 60,
                                          child: Text(
                                              "Metro Atalantas",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                  fontFamily:"Montserrat"
                                              ),
                                          ),
                                      ),
                                      Positioned(
                                          left: 104,
                                          top: 87,
                                          child: Container(
                                              width: 75,
                                              height: 26,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.black,
                                              ),
                                          ),
                                      ),
                                      Positioned(
                                          left: 123,
                                          top: 92,
                                          child: Text(
                                              "Lagos",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  fontFamily:"Montserrat"
                                              ),
                                          ),
                                      ),
                                      Positioned(
                                          left: 24,
                                          top: 16,
                                          child: Container(
                                              width: 49,
                                              height: 53,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                              ),
                                              child:Icon( Icons.person , size: 40,color: Colors.white,),
                                          ),
                                      ),
                                  ],
                              ),
                          ),
                      ],
                  ),
              ),
              SizedBox(height: 13),
              Container(
                  width: MediaQuery.of(context).size.width-50,
                  height: 141,
      //padding: const EdgeInsets.only(left: 17, right: 19, top: 13, ),
                  child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children:[
                          Container(
                              width: MediaQuery.of(context).size.width - 50,
                              height: 128,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xffffbf00),
                              ),
                              child: Stack(
                                  children:[
                                      Positioned(
                                          left: 197,
                                          top: 87,
                                          child: Container(
                                              width: 74,
                                              height: 26,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.black,
                                              ),
                                          ),
                                      ),
                                      Positioned(
                                          left: 211,
                                          top: 92,
                                          child: Text(
                                              "Ibadan",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  fontFamily: 'Montserrat',
                                              ),
                                          ),
                                      ),
                                      Positioned(
                                          left: 101,
                                          top: 42,
                                          child: Text(
                                              "WEB DESIGNER",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                  fontFamily: 'Montserrat',
                                              ),
                                          ),
                                      ),
                                      Positioned(
                                          left: 94,
                                          top: 6,
                                          child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children:[
                                                      Text(
                                                          "Adolphs Hitler",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 13,
                                                              fontFamily:"Montserrat"
                                                          ),
                                                      ),
                                                  ],
                                              ),
                                          ),
                                      ),
                                      Positioned(
                                          left: 18,
                                          top: 14,
                                          child: Container(
                                              width: 61,
                                              height: 58,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xff232121),
                                              ),
                                          ),
                                      ),
                                      Positioned(
                                          left: 104,
                                          top: 60,
                                          child: Text(
                                              "Metro Atalanta",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                  fontFamily:"Montserrat"
                                              ),
                                          ),
                                      ),
                                      Positioned(
                                          left: 104,
                                          top: 87,
                                          child: Container(
                                              width: 75,
                                              height: 26,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.black,
                                              ),
                                          ),
                                      ),
                                      Positioned(
                                          left: 123,
                                          top: 92,
                                          child: Text(
                                              "Lagos",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  fontFamily:"Montserrat"
                                              ),
                                          ),
                                      ),
                                      Positioned(
                                          left: 24,
                                          top: 16,
                                          child: Container(
                                              width: 49,
                                              height: 53,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                              ),
                                              child: Icon(Icons.person, size: 49, color: Colors.white,),
                                          ),
                                      ),
                                  ],
                              ),
                          ),
                      ],
                  ),
              ),
              SizedBox(height: 13),
              Container(
                  width: MediaQuery.of(context).size.width-50,
                  height: 141,
                 // padding: const EdgeInsets.only(left: 17, right: 19, top: 13, ),
                  child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children:[
                          Container(
                              width: MediaQuery.of(context).size.width - 50,
                              height: 128,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xffffbf00),
                              ),
                              child: Stack(
                                  children:[
                                      Positioned(
                                          left: 197,
                                          top: 87,
                                          child: Container(
                                              width: 74,
                                              height: 26,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.black,
                                              ),
                                          ),
                                      ),
                                      Positioned(
                                          left: 211,
                                          top: 92,
                                          child: Text(
                                              "Ibadan",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  fontFamily: 'Montserrat',
                                              ),
                                          ),
                                      ),
                                      Positioned(
                                          left: 101,
                                          top: 42,
                                          child: Text(
                                              "WEB DESIGNER",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                  fontFamily:"Montserrat"
      
                                              ),
                                          ),
                                      ),
                                      Positioned(
                                          left: 94,
                                          top: 6,
                                          child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children:[
                                                      Text(
                                                          "Adolphs Hitler",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 13,
                                                              fontFamily:"Montserrat"
      
                                                          ),
                                                      ),
                                                  ],
                                              ),
                                          ),
                                      ),
                                      Positioned(
                                          left: 18,
                                          top: 14,
                                          child: Container(
                                              width: 61,
                                              height: 58,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xff232121),
                                              ),
                                          ),
                                      ),
                                      Positioned(
                                          left: 104,
                                          top: 60,
                                          child: Text(
                                              "Metro Atalanta",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                  fontFamily:"Montserrat"
                                              ),
                                          ),
                                      ),
                                      Positioned(
                                          left: 104,
                                          top: 87,
                                          child: Container(
                                              width: 75,
                                              height: 26,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.black,
                                              ),
                                          ),
                                      ),
                                      Positioned(
                                          left: 123,
                                          top: 92,
                                          child: Text(
                                              "Lagos",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  fontFamily:"Montserrat"
                                              ),
                                          ),
                                      ),
                                      Positioned(
                                          left: 24,
                                          top: 16,
                                          child: Container(
                                              width: 49,
                                              height: 53,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                              ),
                                              child: Icon(Icons.person, size: 49, color: Colors.white,),
                                          ),
                                      ),
                                  ],
                              ),
                          ),
                      ],
                  ),
              ),
              SizedBox(height: 13),
              Container(
                  width: MediaQuery.of(context).size.width-50,
                  height: 141,
                  //padding: const EdgeInsets.only(left: 17, right: 19, top: 13, ),
                  child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children:[
                          Container(
                              width: MediaQuery.of(context).size.width - 50,
                              height: 128,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xffffbf00),
                              ),
                              child: Stack(
                                  children:[
                                      Positioned(
                                          left: 197,
                                          top: 87,
                                          child: Container(
                                              width: 74,
                                              height: 26,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.black,
                                              ),
                                          ),
                                      ),
                                      Positioned(
                                          left: 211,
                                          top: 92,
                                          child: Text(
                                              "Ibadan",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  fontFamily:"Montserrat"
                                              ),
                                          ),
                                      ),
                                      Positioned(
                                          left: 101,
                                          top: 42,
                                          child: Text(
                                              "WEB DESIGNER",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                  fontFamily:"Montserrat"
                                              ),
                                          ),
                                      ),
                                      Positioned(
                                          left: 94,
                                          top: 6,
                                          child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children:[
                                                      Text(
                                                          "Adolphs Hitler",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 13,
                                                              fontFamily:"Montserrat"
                                                          ),
                                                      ),
                                                  ],
                                              ),
                                          ),
                                      ),
                                      Positioned(
                                          left: 18,
                                          top: 14,
                                          child: Container(
                                              width: 61,
                                              height: 58,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xff232121),
                                              ),
                                          ),
                                      ),
                                      Positioned(
                                          left: 104,
                                          top: 60,
                                          child: Text(
                                              "Metro Atalanta",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                  fontFamily:"Montserrat"
                                              ),
                                          ),
                                      ),
                                      Positioned(
                                          left: 104,
                                          top: 87,
                                          child: Container(
                                              width: 75,
                                              height: 26,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.black,
                                              ),
                                          ),
                                      ),
                                      Positioned(
                                          left: 123,
                                          top: 92,
                                          child: Text(
                                              "Lagos",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  fontFamily:"Montserrat"
                                              ),
                                          ),
                                      ),
                                      Positioned(
                                          left: 24,
                                          top: 16,
                                          child: Container(
                                              width: 49,
                                              height: 53,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                              ),
                                              child: Icon(Icons.person, size: 49, color: Colors.white,),
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
        ),
        ),
      ),


    );
    
  }
}
