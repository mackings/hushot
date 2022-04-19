import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hushot_technologies/Views/Signup.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:hushot_technologies/Views/applicationform.dart';
import 'package:hushot_technologies/Views/orgform.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class Verifyotp extends ConsumerStatefulWidget {
  const Verifyotp({ Key? key }) : super(key: key);

  @override
  ConsumerState<Verifyotp> createState() => _VerifyotpState();
}

class _VerifyotpState extends ConsumerState<Verifyotp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),

               Image.asset('assets/hire.png'),

               Container(
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
                        hintText: 'Verify OTP',
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.pin,
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(fontFamily: 'montserrat'),
                      ),
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        )
      ),
      
    );
  }
}