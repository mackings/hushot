import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hushot_technologies/Views/Orgdashboard.dart';
import 'package:hushot_technologies/Views/Signin.dart';
import 'package:hushot_technologies/Views/verifyotp.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Orgform extends ConsumerStatefulWidget {
  const Orgform({Key? key}) : super(key: key);

  @override
  ConsumerState<Orgform> createState() => _OrgformState();
}

class _OrgformState extends ConsumerState<Orgform> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phonenumberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final otpurl = ('https://wipple-sms-verify-otp.p.rapidapi.com/send');

  Future Reqotp() async {
    var response = await http.post(
      Uri.parse(otpurl),
      headers: {
        'contentType': "application/json",
        "x-rapidapi-host": "wipple-sms-verify-otp.p.rapidapi.com",
        "x-rapidapi-key": "e3ab93c74dmsh84262fafd4ee9f9p1530a5jsn61dbaea296d8",
      },
      body: {
        "app_name": "Hushottechnologies",
        "code_length": 6,
        "code_type": "number",
        "expiration_second": 60,
        "phone_number": _phonenumberController.text.trim(),
      },
    );

    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response.body);
    } else {
      print('otp not sent');
      print(response.statusCode);
    }
  }

  final Auth = FirebaseAuth.instance;

  dynamic vid;

  fbotp() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await Auth.verifyPhoneNumber(
        phoneNumber: _phonenumberController.text.toString(),

        verificationCompleted: (AuthCredential credential) async {

          Auth.signInWithCredential(credential).then((value) async {
           Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => Orgdashboard()));
          });
        },

        verificationFailed: (exception) {
          print(exception);
        },
        codeSent: (verificationId, [code]) async {
          print(verificationId);
          print(code);

         
          
        },
        codeAutoRetrievalTimeout: (verificationId) {
          print(verificationId);
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Text(' Recruiters',
                      style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text('Hire Best of Bests',
                      style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width - 30,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Organisation Name',
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.location_city_sharp,
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(fontFamily: 'montserrat'),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
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
                        hintText: 'Administrative Email',
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(fontFamily: 'montserrat'),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width - 30,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _phonenumberController,
                      decoration: InputDecoration(
                        hintText: 'Best Phone',
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
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width - 30,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.visibility_off,
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(fontFamily: 'montserrat'),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
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
                        hintText: 'Organisation Address',
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.map,
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(fontFamily: 'montserrat'),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
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
                        hintText: 'Organisation Website',
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.web,
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(fontFamily: 'montserrat'),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    // fbotp();
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('Success',
                                  style: TextStyle(
                                      fontFamily: 'montserrat',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              content: Text(
                                  'Your Organisation has been Submitted for Approval',
                                  style: TextStyle(
                                      fontFamily: 'montserrat',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              actions: [
                                MaterialButton(
                                  onPressed: () {
                                    //fbotp();
                                     Navigator.pushReplacement(
                                       context,
                                      MaterialPageRoute(
                                         builder: (context) => Verifyotp()));
                                  },
                                  child: Text('Ok',
                                      style: TextStyle(
                                          fontFamily: 'montserrat',
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                )
                              ],
                            ));
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
                          child: Text('Create Account',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'montserrat'))),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ) // Figma Flutter Generator SignupWidget - FRAME

          ),
    );
  }
}
