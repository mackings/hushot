import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hushot_technologies/Views/Orgdashboard.dart';
import 'package:hushot_technologies/Views/Signup.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:hushot_technologies/Views/applicationform.dart';
import 'package:hushot_technologies/Views/orgform.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:hushot_technologies/Views/postjob.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Verifyotp extends ConsumerStatefulWidget {
  const Verifyotp({Key? key}) : super(key: key);

  @override
  ConsumerState<Verifyotp> createState() => _VerifyotpState();
}

class _VerifyotpState extends ConsumerState<Verifyotp> {
  final FirebaseAuth Auth = FirebaseAuth.instance;

  var Recievedid = "";

  fbotp() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await Auth.verifyPhoneNumber(
      phoneNumber: _phone.text.toString(),
      verificationFailed: (exception) {
        print(exception);
      },
      timeout: Duration(seconds: 60),
      codeSent: (verificationId, [code]) async {
        Recievedid = verificationId;
        print('recievedid is $Recievedid');
        setState(() {});
      },
      codeAutoRetrievalTimeout: (verificationId) {
        print(verificationId);
      },
      verificationCompleted: (PhoneAuthCredential credential) async {
        
        await Auth.signInWithCredential(credential)
            .then((value) => ({
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Orgdashboard())),
              
              
            }));
            
      },
    );
  }

  verifyno() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: Recievedid,
      smsCode: _otp.text,
    );
    await Auth.signInWithCredential(credential)
        .then((value) => print('Logged In'));
  }

  TextEditingController _otp = TextEditingController();
  TextEditingController _phone = TextEditingController();

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
                height: 10,
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
                    controller: _phone,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '+2348110947817',
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
              SizedBox(height: 10),
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
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  fbotp();
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
                        child: Text('Send',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'montserrat'))),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  verifyno();
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width - 30,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text('Verify ',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'montserrat'))),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
