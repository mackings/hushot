import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hushot_technologies/Views/Homescreen.dart';
import 'package:hushot_technologies/Views/Signin.dart';
import 'package:hushot_technologies/Auths/auths.dart';
import 'package:hushot_technologies/widgets/showaf.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Profileupdates extends ConsumerStatefulWidget {
  const Profileupdates({super.key});

  @override
  ConsumerState<Profileupdates> createState() => _ProfileupdatesState();
}

class _ProfileupdatesState extends ConsumerState<Profileupdates> {
  @override
  Widget build(BuildContext context) {
    var hintstyle =
        TextStyle(color: Colors.white, fontFamily: 'montserrat', fontSize: 15);
    //edu

    TextEditingController InstitutionNameController = TextEditingController();
    TextEditingController Description = TextEditingController();
    TextEditingController MinQualification = TextEditingController();
    TextEditingController StartDate = TextEditingController();
    TextEditingController EndDate = TextEditingController();
//workexperience
    TextEditingController wxname = TextEditingController();
    TextEditingController wxPosition = TextEditingController();
    TextEditingController wxStartDate = TextEditingController();
    TextEditingController exEndDate = TextEditingController();

    dynamic DName;
    dynamic DDes;
    dynamic DInstMinQ;
    dynamic DStartDate;
    dynamic DEndDate;

    printas() {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Alert",style: TextStyle(fontFamily: 'montserrat'),),
            content: Text("Please fill all the fields"),
            actions: <Widget>[
              MaterialButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    }

    Future SaveEdu() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('InstitutionName', InstitutionNameController.text);
      prefs.setString('Description', Description.text);
      prefs.setString('MinQualification', MinQualification.text);
      prefs.setString('StartDate', StartDate.text);
      prefs.setString('EndDate', EndDate.text);
    }

    GetEdu() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      var Iname = prefs.getString('InstitutionName');
      var Des = prefs.getString('Description');
      var Min = prefs.getString('MinQualification');
      var SDate = prefs.getString('StartDate');
      var EDate = prefs.getString('EndDate');

      setState(() {
        DName = Iname;
        DDes = Des;
        DInstMinQ = Min;
        DStartDate = SDate;
        DEndDate = EDate;
      });

      print('$DName');
      print('$DDes');
    }

    final IN = StateProvider((ref) => DName);

    var statein = ref.watch(IN);

    final _formKey = GlobalKey<FormState>();
    bool isLoading = false;
    bool ismoving = false;

    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: (() {
                      print('StateIN : $statein');
                    }),
                    child: Text('profile Updates',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'montserrat',
                            color: Colors.black)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("Career Summary",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'montserrat',
                                color: Colors.black)),
                      ],
                    ),
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
                          //controller: _Jobdescription,
                          decoration: InputDecoration(
                            hintText: 'Education',
                            border: InputBorder.none,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                showBarModalBottomSheet(
                                    context: context,
                                    builder: (context) => Form(
                                          key: _formKey,
                                          child: Container(
                                            height: 700,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Center(
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Container(
                                                    height: 100,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            40,
                                                    decoration: BoxDecoration(
                                                      color: Colors.amber,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: TextFormField(
                                                        maxLines: 3,
                                                        validator: (value) {
                                                          if (value!.isEmpty) {
                                                            return 'Please Enter Institution Name';
                                                          }
                                                          return null;
                                                        },
                                                        controller:
                                                            InstitutionNameController,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Name of Institution',
                                                          hintStyle: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily:
                                                                'montserrat',
                                                          ),
                                                          border:
                                                              InputBorder.none,
                                                          suffixIcon: Icon(
                                                            Icons.school,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Container(
                                                    height: 60,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            40,
                                                    decoration: BoxDecoration(
                                                      color: Colors.amber,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: TextFormField(
                                                        maxLines: 3,
                                                        validator: (value) {
                                                          if (value!.isEmpty) {
                                                            return 'Please Enter Qualification';
                                                          }
                                                          return null;
                                                        },
                                                        controller:
                                                            MinQualification,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Minimum Qualification',
                                                          hintStyle: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily:
                                                                'montserrat',
                                                          ),
                                                          border:
                                                              InputBorder.none,
                                                          suffixIcon: Icon(
                                                            Icons.school,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Container(
                                                    height: 100,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            40,
                                                    decoration: BoxDecoration(
                                                      color: Colors.amber,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: TextFormField(
                                                        maxLines: 3,
                                                        validator: (value) {
                                                          if (value!.isEmpty) {
                                                            return 'Please Enter Description';
                                                          }
                                                          return null;
                                                        },
                                                        controller: Description,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Description',
                                                          hintStyle: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily:
                                                                'montserrat',
                                                          ),
                                                          border:
                                                              InputBorder.none,
                                                          suffixIcon: Icon(
                                                            Icons.file_copy,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Container(
                                                    height: 60,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            40,
                                                    decoration: BoxDecoration(
                                                      color: Colors.amber,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: TextFormField(
                                                        maxLines: 3,
                                                        validator: (value) {
                                                          if (value!.isEmpty) {
                                                            return 'Please Enter Start Date';
                                                          }
                                                          return null;
                                                        },
                                                        controller: StartDate,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Start Date',
                                                          hintStyle: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily:
                                                                'montserrat',
                                                          ),
                                                          border:
                                                              InputBorder.none,
                                                          suffixIcon: Icon(
                                                            Icons.date_range,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Container(
                                                    height: 60,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            40,
                                                    decoration: BoxDecoration(
                                                      color: Colors.amber,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: TextFormField(
                                                        //maxLines: 3,
                                                        validator: (value) {
                                                          if (value!.isEmpty) {
                                                            return 'Please Enter End Date';
                                                          }
                                                          return null;
                                                        },
                                                        controller: EndDate,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: 'End Date',
                                                          hintStyle: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily:
                                                                'montserrat',
                                                          ),
                                                          border:
                                                              InputBorder.none,
                                                          suffixIcon: Icon(
                                                            Icons.school,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 20),
                                                  isLoading
                                                      ? CircularProgressIndicator(
                                                          backgroundColor:
                                                              Colors.black,
                                                        )
                                                      : GestureDetector(
                                                          onTap: (() {
                                                            setState(() {
                                                              isLoading = true;
                                                            });

                                                            Future.delayed(
                                                                    Duration(
                                                                        seconds:
                                                                            1))
                                                                .then((value) {
                                                              //SaveEdu();
                                                              setState(() {
                                                                isLoading =
                                                                    false;
                                                              });
                                                            });
                                                          }),
                                                          child: Container(
                                                            height: 55,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width -
                                                                40,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.black,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: Center(
                                                                child: Text(
                                                                    'Save',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontFamily:
                                                                            'montserrat',
                                                                        fontSize:
                                                                            20))),
                                                          ),
                                                        ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        ismoving = true;
                                                      });

                                                      Future.delayed(Duration(
                                                              seconds: 1))
                                                          .then((value) {
                                                        setState(() {
                                                          ismoving = false;
                                                        });
                                                      });
                                                    },
                                                    child: ismoving
                                                        ? CircularProgressIndicator(
                                                            backgroundColor:
                                                                Colors.black,
                                                          )
                                                        : Container(
                                                            height: 55,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width -
                                                                40,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.black,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: Center(
                                                                child: Text(
                                                                    'Show',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontFamily:
                                                                            'montserrat',
                                                                        fontSize:
                                                                            20))),
                                                          ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ));
                              },
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
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
                  Modal(
                    hintstyle: hintstyle,
                    hinttext: 'Work Exp',
                    modalheight: 600.0,
                    description: 'Add your Work Experience',
                    startdate: 'Start Date',
                    enddate: 'End date',
                    calls: ()=> printas(),
                    
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileUpdates extends StatelessWidget {
  const ProfileUpdates({super.key});

  @override
  Widget build(BuildContext context) {
    var name = 1;
    TextEditingController me = TextEditingController();
    return MaterialApp();
  }
}
