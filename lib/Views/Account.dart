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
import 'package:image_picker/image_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';

class Acccountpage extends ConsumerStatefulWidget {
  const Acccountpage({Key? key}) : super(key: key);

  @override
  ConsumerState<Acccountpage> createState() => _AcccountpageState();
}

class _AcccountpageState extends ConsumerState<Acccountpage> {
  File? _image;
  String? _imagelink;
  String? _statelink2;

  FirebaseStorage storage = FirebaseStorage.instance;

  PickPhoto() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var pickedimg = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedimg != null) {
        _image = File(pickedimg.path);
      } else {
        print("no image selected");
      }
    });

    Reference reference = storage.ref().child("images/)}");
    UploadTask uploadTask = reference.putFile(_image!);
    uploadTask.then((p0) => p0.ref.getDownloadURL().then((p1) => setState(() {
          _imagelink = p1.toString();
          print(_imagelink);
          prefs.setString("image", _imagelink.toString());
        })));

    var prefsimg = prefs.getString('image');
    print('prefsimg is $prefsimg');

    final Picsprovider = StateProvider((ref) {
      return prefsimg;
    });

    final statep = ref.watch(Picsprovider);
    setState(() {
      _statelink2 = statep!;
    });
  }

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

  Buymembership() async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Buy Premium Membership',
                  style: TextStyle(
                      fontFamily: 'montserrat',
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              content: Text('Our premium Membership is USD 100',
                  style: TextStyle(
                      fontFamily: 'montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              actions: [
                MaterialButton(
                  onPressed: () {},
                  child: Text('Buy Now',
                      style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
                MaterialButton(
                  onPressed: () {},
                  child: Text('Others',
                      style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Exit',
                      style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                )
              ],
            ));
  }

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
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width: 10),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back)),
                      SizedBox(width: 70),
                      Text(
                        'Job Profile',
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 70),
                      GestureDetector(
                          onTap: () {
                            Buymembership();
                          },
                          child: Icon(Icons.person_add)),
                    ],
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
                            hintText: 'Portfolio  Url',
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
                        //pickcv();
                        //SaveProfile();
                        // Getprofile();

                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text(
                                    'Profile Update',
                                    style: TextStyle(fontFamily: 'montserrat'),
                                  ),
                                  content: Text(
                                    'Update Job profile?',
                                    style: TextStyle(fontFamily: 'montserrat'),
                                  ),
                                  actions: <Widget>[
                                    MaterialButton(
                                      child: Text(
                                        'Update Now',
                                        style:
                                            TextStyle(fontFamily: 'montserrat'),
                                      ),
                                      onPressed: () {
                                        //pickcv();
                                        if (Formkey.currentState!.validate()) {
                                          SaveProfile();
                                          Navigator.pop(context);
                                          Getprofile();
                                        Fluttertoast.showToast(
                                          msg: "Profile Updated",
                                          toastLength: Toast.LENGTH_LONG,
                                          gravity: ToastGravity.BOTTOM,
                                        );
                                        Navigator.pop(context);
                                        }
                                        SaveProfile();
                                        
                                      },
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
                                  height: 500,
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 20),
                                      Text(
                                        ' Job Profile',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 20),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 70,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      60,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.amber,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      'Name :\n $hname ',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontFamily:
                                                              'montserrat',
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Center(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 70,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            60,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.amber,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        'Email : \n $hemail ',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            fontFamily:
                                                                'montserrat',
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 50,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      60,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.amber,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      'Location : $hlocation ',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontFamily:
                                                              'montserrat',
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 60,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      60,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.amber,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      'Phone : $hphone ',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontFamily:
                                                              'montserrat',
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
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
