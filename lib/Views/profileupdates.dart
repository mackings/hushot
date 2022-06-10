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
    final fuser = FirebaseAuth.instance.currentUser;
    var hintstyle =
        TextStyle(color: Colors.white, fontFamily: 'montserrat', fontSize: 15);
    //edu

    TextEditingController InstitutionNameController = TextEditingController();
    TextEditingController Description = TextEditingController();
    TextEditingController MinQualification = TextEditingController();
    TextEditingController StartDate = TextEditingController();
    TextEditingController EndDate = TextEditingController();
//workexperience

    TextEditingController wxName = TextEditingController();
    TextEditingController wxPosition = TextEditingController();
    TextEditingController wxStartDate = TextEditingController();
    TextEditingController exEndDate = TextEditingController();

    Future saveworkexperience() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('wxname', wxName.text);
      prefs.setString('wxPosition', wxPosition.text);
      prefs.setString('wxStartDate', wxStartDate.text);
      prefs.setString('exEndDate', exEndDate.text);
    }

    Future Getworkexperience() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var wxNamedata = prefs.getString('wxname');
      var wxPositiondata = prefs.getString('wxPosition');
      var wxStartDatedata = prefs.getString('wxStartDate');
      var exEndDatedata = prefs.getString('exEndDate');

      print(wxNamedata);
      print(wxPositiondata);
      print(wxStartDatedata);
      print(exEndDatedata);
    }

    dynamic DName;
    dynamic DDes;
    dynamic DInstMinQ;
    dynamic DStartDate;
    dynamic DEndDate;
    dynamic Dwex;

    printas() {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Alert",
              style: TextStyle(fontFamily: 'montserrat'),
            ),
            content: Text("Datas saved Successfully"),
            actions: <Widget>[
              MaterialButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                  //Navigator.pop(context);
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

    Future savetodb() async {
      await FirebaseFirestore.instance
          .collection('Profiles')
          .doc(fuser!.uid)
          .set({
        'InstitutionName': InstitutionNameController.text,
        'Description': Description.text,
        'MinQualification': MinQualification.text,
        'StartDate': StartDate.text,
        'EndDate': EndDate.text,
      }).whenComplete(() => print('saved'));
    }

    

    Future Fetchuserdata() async {
      await FirebaseFirestore.instance
          .collection('Profiles')
          .doc(fuser!.uid)
          .get()
          .then((value) {
        DName = value.data()!['InstitutionName'];
        DDes = value.data()!['Description'];
        DInstMinQ = value.data()!['MinQualification'];
        var Dwex = value.data()!['WorkExperience'];
      });

      print('DName$DName');
      print('Experience$Dwex');
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
                  Modal(
                    containermessage: 'Educational Background',
                    hintstyle: hintstyle,
                    hinttext: 'Institution Name',
                    position: 'Degree Type',
                    modalheight: 600.0,
                    description: 'About Institution',
                    startdate: 'Start Date',
                    enddate: 'End date',
                    icon: Icon(Icons.school, color: Colors.white),
                    //calls: ()=> printas(),
                    calls: () async {
                      savetodb();
                      print('Hiii');
                    },
                    controller1: InstitutionNameController,
                    controller2: Description,
                    controller3: MinQualification,
                    controller4: StartDate,
                    controller5: EndDate,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Modal(
                    containermessage:
                        'Work experience as acquired\n in your field ',
                    hintstyle: hintstyle,
                    hinttext: 'Company Name',
                    position: 'Position',
                    modalheight: 600.0,
                    description: 'Add your Work Experience',
                    startdate: 'Start Date',
                    enddate: 'End date',
                    icon: Icon(Icons.people, color: Colors.white),
                    //calls: ()=> printas(),
                    calls: () async {
                     // savetodb2();
                      //Fetchuserdata();
                    },
                    controller1: wxName,
                    controller2: wxPosition,
                    controller3: wxStartDate,
                    controller4: exEndDate,
                    controller5: null,
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
