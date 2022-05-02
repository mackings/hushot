import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hushot_technologies/Views/Homescreen.dart';
import 'package:hushot_technologies/Views/Signin.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:file_picker/file_picker.dart';

class Acccountpage extends ConsumerStatefulWidget {
  const Acccountpage({Key? key}) : super(key: key);

  @override
  ConsumerState<Acccountpage> createState() => _AcccountpageState();
}

class _AcccountpageState extends ConsumerState<Acccountpage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _proposalController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  SaveProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', _nameController.text);
    prefs.setString('email', _emailController.text);
    prefs.setString('location', _locationController.text);
    prefs.setString('proposal', _proposalController.text);
    prefs.setString('phone', _phoneController.text);
  }

  Getprofile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var name = prefs.getString('name');
    var email = prefs.getString('email');
    var location = prefs.getString('location');
    var proposal = prefs.getString('proposal');
    var phone = prefs.getString('phone');

    print("Prefs Got $name ");

    setState(() {
      hname = name;
      hemail = email;
      hlocation = location;
      hproposal = proposal;
      hphone = phone;
    });

    var Rivername = StateProvider((refs) {
      return name;
    });
  }

  var cv;

  pickcv() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var Procv = await FilePicker.platform.pickFiles();
    if (Procv != null) {
      setState(() {
        cv = Procv.files.first.path;
        print('cv path is $cv');

        prefs.setString('cvlink', cv);

      });
    } else {}
  }

  dynamic hname;
  dynamic hemail;
  dynamic hlocation;
  dynamic hproposal;
  dynamic hphone;

  @override
  void initState() {
    // TODO: implement initState
    //Getprofile();
    super.initState();
  }

  final Formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Form(
          key: Formkey,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Text(
                    'Account',
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 40),
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
                          controller: _nameController,
                          decoration: InputDecoration(
                            hintText: 'Full Names',
                            border: InputBorder.none,
                            suffixIcon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            hintStyle: TextStyle(fontFamily: 'montserrat'),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Name is required';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
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
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            border: InputBorder.none,
                            suffixIcon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            hintStyle: TextStyle(fontFamily: 'montserrat'),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email is required';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
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
                          controller: _phoneController,
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                            border: InputBorder.none,
                            suffixIcon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            hintStyle: TextStyle(fontFamily: 'montserrat'),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Phone is required';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
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
                          controller: _locationController,
                          decoration: InputDecoration(
                            hintText: 'Location',
                            border: InputBorder.none,
                            suffixIcon: Icon(
                              Icons.maps_home_work,
                              color: Colors.white,
                            ),
                            hintStyle: TextStyle(fontFamily: 'montserrat'),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Name is required';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width - 30,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: _proposalController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Proposal',
                            hintStyle: TextStyle(
                              fontFamily: 'montserrat',
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        pickcv();
                        SaveProfile();
                        Getprofile();
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
                              child: Text('Update Profile',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'montserrat'))),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Getprofile();
                        showMaterialModalBottomSheet(
                            bounce: true,
                            isDismissible: true,
                            backgroundColor: Colors.black,
                            context: context,
                            builder: (context) => Container(
                                  height: 400,
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20),
                                      Text(
                                        ' Job Profile',
                                        style: TextStyle(
                                            color: Colors.amber,
                                            fontSize: 30,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 20),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Name :\n $hname  ',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontFamily: 'montserrat',
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Email : \n $hemail ',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontFamily: 'montserrat',
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Location : $hlocation ',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontFamily: 'montserrat',
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Phone : $hphone ',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontFamily: 'montserrat',
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
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
                              child: Text('Preview profile',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'montserrat'))),
                        ),
                      ),
                    ),
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
