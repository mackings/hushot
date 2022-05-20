import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hushot_technologies/Models/jobmodels.dart';
import 'package:hushot_technologies/Views/applicationform.dart';
import 'package:hushot_technologies/Views/orgform.dart';
import 'package:hushot_technologies/Views/postjob.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class TimeLine extends ConsumerStatefulWidget {
  const TimeLine({Key? key}) : super(key: key);

  @override
  ConsumerState<TimeLine> createState() => _TimeLineState();
}

class _TimeLineState extends ConsumerState<TimeLine> {
  var mailurl = 'https://easymail.p.rapidapi.com/send';
  bool reply = true;

  Future SendProposal() async {
    var response = await http.post(
      Uri.parse(mailurl),
      headers: {
        'content-type': 'application/json',
        'x-rapidapi-host': 'easymail.p.rapidapi.com',
        'x-rapidapi-key': 'e3ab93c74dmsh84262fafd4ee9f9p1530a5jsn61dbaea296d8'
      },
      body: jsonEncode({
        "from": "$hname",
        "to": 'macsonline500@gmail.com',
        "subject": "Job Application",
        "message":
            "<h4>  Name : $hname  Email: $hemail  Phone: $hphone Location : $hlocation PortfolioUrl: $hproposal Cv :$hcvlink</h4>",
        "show_noreply_warnin": reply
      }),
    );

    if (response.statusCode == 202) {
      var responseJson = json.decode(response.body);
      print('success');
      print(responseJson);
    } else {
      print('error');
      print(response.statusCode);
    }
  }

  SendProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var name = prefs.getString('name');
    var email = prefs.getString('email');
    var location = prefs.getString('location');
    var proposal = prefs.getString('proposal');
    var phone = prefs.getString('phone');
    var cvlink = prefs.getString('cvlink');

    print("Prefs Got $name ");
    print("prefs Got $email");
    print("prefs Got $location");
    print("prefs Got $proposal");
    print("prefs Got $phone");
    print('prefs Got $cvlink');

    //setState(() {
    // hname = name;
    // hemail = email;
    // hlocation = location;
    // hproposal = proposal;
    // hphone = phone;
    //});

    final aname = StateProvider(
      (ref) {
        return name;
      },
    );

    final amail = StateProvider(
      (ref) {
        return email;
      },
    );

    final aphone = StateProvider(
      (ref) {
        return phone;
      },
    );

    final alocation = StateProvider(
      (ref) {
        return location;
      },
    );

    final aproposal = StateProvider(
      (ref) {
        return proposal;
      },
    );

    final acvlink = StateProvider(
      (ref) {
        return cvlink;
      },
    );

    var Rmail = ref.watch(amail);
    var Rname = ref.watch(aname);
    var Rphone = ref.watch(aphone);
    var Rlocation = ref.watch(alocation);
    var Rproposal = ref.watch(aproposal);
    var Rcvlink = ref.watch(acvlink);

    setState(() {
      hemail = Rmail;
      hname = Rname;
      hphone = Rphone;
      hlocation = Rlocation;
      hproposal = Rproposal;
      hcvlink = Rcvlink;
    });

    print("Prefs got $hname");
    print("State mail got $Rmail");
  }

  dynamic hname;
  dynamic hemail;
  dynamic hlocation;
  dynamic hproposal;
  dynamic hphone;
  dynamic hcvlink;

  dynamic postermail;

  var fav = Colors.amber;
  var unfav = Colors.white;

  //dynamic Posteremail;
  //final Posterid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('UploadedJobs').snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.docs.length == 0) {
                return Center(
                  child: Text('No jobs posted yet',
                      style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                );
              }

              // Posteremail = FirebaseFirestore.instance.doc('Users/$Posterid');

              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  Jobs AvailableJobs = Jobs.fromJson(snapshot.data.docs[index]);

                  return Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width - 20,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),

                            Row(
                              children: [
                                //Item1

                                SizedBox(
                                  width: 10,
                                ),

                                Text(
                                  'Job Title :',
                                  style: TextStyle(
                                      fontFamily: 'montserrat',
                                      fontSize: 15,
                                      color: Colors.white),
                                ),

                                Text(
                                  '${AvailableJobs.Jobtitle}',
                                  style: TextStyle(
                                      fontFamily: 'montserrat',
                                      fontSize: 15,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  width: 80,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      unfav = fav;
                                
                                    });
                                  },
                                  child: Icon(Icons.favorite,
                                      color: unfav, size: 20),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                //Item1
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.timeline,
                                    color: Colors.white,
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      showMaterialModalBottomSheet(
                                          backgroundColor: Colors.black,
                                          bounce: true,
                                          isDismissible: true,
                                          context: context,
                                          builder: (context) => Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20)),
                                                ),
                                                height: 300,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        '${AvailableJobs.Description}',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'montserrat',
                                                            fontSize: 15,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ));
                                    },
                                    child: Text(
                                      'View Description',
                                      style: TextStyle(
                                          fontFamily: 'montserrat',
                                          fontSize: 15,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //Item2
                            Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(
                                  Icons.location_pin,
                                  color: Colors.white,
                                ),
                                Text(
                                  '${AvailableJobs.Location}',
                                  style: TextStyle(
                                      fontFamily: 'montserrat',
                                      fontSize: 15,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Icon(
                                  Icons.money,
                                  color: Colors.white,
                                ),
                                Text(
                                  '  N ${AvailableJobs.Amount}',
                                  style: TextStyle(
                                      fontFamily: 'montserrat',
                                      fontSize: 15,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  'Hire Number :  ',
                                  style: TextStyle(
                                      fontFamily: 'montserrat',
                                      fontSize: 15,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  '${AvailableJobs.PeopleRequired}',
                                  style: TextStyle(
                                      fontFamily: 'montserrat',
                                      fontSize: 15,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            //Item3
                            Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(
                                  Icons.date_range,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${DateTime.now()}',
                                  style: TextStyle(
                                      fontFamily: 'montserrat',
                                      fontSize: 15,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    //SendProposal();
                                    SendProfile();
                                    //SendProposal();
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Apply for this job',
                                                style: TextStyle(
                                                    fontFamily: 'montserrat',
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            content: Text(
                                                'Apply with Job Profile ?',
                                                style: TextStyle(
                                                    fontFamily: 'montserrat',
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            actions: <Widget>[
                                              MaterialButton(
                                                child: Text('Yes',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'montserrat',
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                onPressed: () {
                                                  SendProposal();

                                                  Fluttertoast.showToast(
                                                    msg:
                                                        'Application Successful',
                                                    toastLength:
                                                        Toast.LENGTH_LONG,
                                                    backgroundColor:
                                                        Colors.black,
                                                    textColor: Colors.white,
                                                  );

                                                  Navigator.pop(context);
                                                },
                                              ),
                                              MaterialButton(
                                                child: Text('No',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'montserrat',
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                  child: Container(
                                    height: 40,
                                    width:
                                        MediaQuery.of(context).size.width - 100,
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text('Apply Now',
                                          style: TextStyle(
                                              fontFamily: 'montserrat',
                                              fontSize: 15,
                                              color: Colors.white)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                itemCount: snapshot.data.docs.length,
              );
            } else {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.black,
              ));
            }
          },
        ),
      ),
    );
  }
}

Widget AF() {
  return AlertDialog(
    title: Text('Are you sure you want to delete this job?'),
    actions: <Widget>[
      MaterialButton(
        child: Text('Yes'),
        onPressed: () {
          //Navigator.pop(context);
        },
      ),
      MaterialButton(
        child: Text('No'),
        onPressed: () {
          // Navigator.pop(context);
        },
      ),
    ],
  );
}
