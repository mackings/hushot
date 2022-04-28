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
import 'package:http/http.dart' as http;
import 'package:hushot_technologies/Views/postjob.dart';

class Verifyotp extends ConsumerStatefulWidget {
  const Verifyotp({Key? key}) : super(key: key);

  @override
  ConsumerState<Verifyotp> createState() => _VerifyotpState();
}

class _VerifyotpState extends ConsumerState<Verifyotp> {

  TextEditingController _otp = TextEditingController();
  
  Future verotp() async {
    final veriurl = ('https://wipple-sms-verify-otp.p.rapidapi.com/verify?phone_number=08137159066&verification_code=${_otp.text}');
    var response = await http.get(Uri.parse(veriurl),

     headers: {
    'X-RapidAPI-Host': 'wipple-sms-verify-otp.p.rapidapi.com',
    'X-RapidAPI-Key': 'e3ab93c74dmsh84262fafd4ee9f9p1530a5jsn61dbaea296d8',
     },
    
    );


    if (response.statusCode == 200) {
      print(response.body);
      print(response.body);
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text('Verification Successful'),
        content: Text('You can now proceed to the next step'),
        actions: <Widget>[
          MaterialButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Postjob()));
            },
          )
        ],
      ));
    
    } else {
      print(response.statusCode);
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text('Verification Failed'),
        content: Text('Please try again'),
        actions: <Widget>[
          MaterialButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ));
      
    }
      
  }

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

              SizedBox(height: 20,),

              GestureDetector(
                onTap: () => verotp(),
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
                            child: Text('Verify',
                                style: TextStyle(
                                    color: Colors.white,
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
