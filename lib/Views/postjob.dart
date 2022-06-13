import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hushot_technologies/Views/Homescreen.dart';
import 'package:hushot_technologies/Views/Signin.dart';
import 'package:hushot_technologies/Auths/auths.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Postjob extends ConsumerStatefulWidget {
  const Postjob({Key? key}) : super(key: key);

  @override
  ConsumerState<Postjob> createState() => _PostjobState();
}

class _PostjobState extends ConsumerState<Postjob> {
  //Post Jobs Controller
  TextEditingController _Jobtitle = TextEditingController();
  TextEditingController _Joblocation = TextEditingController();
  TextEditingController _Jobdescription = TextEditingController();
  TextEditingController _Payableamount = TextEditingController();
  TextEditingController _Peoplerequired = TextEditingController();

  //Post Jobs
  final user = FirebaseAuth.instance.currentUser;
  dynamic posteremail;

  Future PostaJob() async {
    FirebaseFirestore.instance.collection('UploadedJobs').add({
      'jobTitle': _Jobtitle.text.trim(),
      'jobDescription': _Jobdescription.text.trim(),
      'jobLocation': _Joblocation.text.trim(),
      'jobAmount': _Payableamount.text.trim(),
      'peopleRequired': _Peoplerequired.text.trim(),
      'PosterEmail': '$posteremail',
    }).whenComplete(() => print('New Job Posted'));

    final SharedPreferences dprefs = await SharedPreferences.getInstance();
    dprefs.setString('postermail', _Jobtitle.text.trim());
    var qmail = dprefs.getString('postermail');

    setState(() {
      posteremail = qmail;
      print(posteremail);
    });
  }

  final jobkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final vwee = Provider(
      (ref) => '10',
    );
    return MaterialApp(
      home: Scaffold(
          body: Form(
        key: jobkey,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text('Post a Job',
                        style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text('Create a Job Today',
                        style: TextStyle(
                            fontFamily: 'montserrat',
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                    ],
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
                        controller: _Jobtitle,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Job Title';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Job Title',
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.work,
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Job Location';
                          }
                          return null;
                        },
                        controller: _Joblocation,
                        decoration: InputDecoration(
                          hintText: 'Job Location ( Onsite / Remote )',
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.location_pin,
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
                    height: 120,
                    width: MediaQuery.of(context).size.width - 30,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        maxLines: 3,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Job Description';
                          }
                          return null;
                        },
                        controller: _Jobdescription,
                        decoration: InputDecoration(
                          hintText: 'Job Description',
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.note,
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Payable Amount';
                          }
                          return null;
                        },
                        controller: _Payableamount,
                        //keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Payable Amount',
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.money,
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Required';
                          }
                          return null;
                        },
                        controller: _Peoplerequired,
                        //keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'People Required',
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.people,
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
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text('Alert',
                                    style: TextStyle(
                                        fontFamily: 'montserrat',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                content: Text('Post Jost To Feeds ?',
                                    style: TextStyle(
                                        fontFamily: 'montserrat',
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                actions: [
                                  MaterialButton(
                                    onPressed: () {
                                      if (jobkey.currentState!.validate()) {
                                        PostaJob();
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  title: Text('Success',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'montserrat',
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  content: Text(
                                                      'Post Job Successfully',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'montserrat',
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  actions: [
                                                    MaterialButton(
                                                      onPressed: () {
                                                        Navigator.pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        HomeScreen()));
                                                      },
                                                      child: Text('Ok',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'montserrat',
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    )
                                                  ],
                                                ));
                                      } else {
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  title: Text('Alert',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'montserrat',
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  content: Text(
                                                      'Please Fill All Fields',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'montserrat',
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  actions: [
                                                    MaterialButton(
                                                      onPressed: () {
                                                        Navigator.pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        Postjob()));
                                                      },
                                                      child: Text('Ok',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'montserrat',
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    )
                                                  ],
                                                ));
                                      }
                                    },
                                    child: Text('Yes',
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
                            child: Text('Post Job',
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
        ),
      ) // Figma Flutter Generator SignupWidget - FRAME

          ),
    );
  }
}
