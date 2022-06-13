import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

//callbacks

//profiler

class Modal extends StatelessWidget {
  var hinttext;
  var position;
  var modalheight;
  var description;
  var startdate;
  var enddate;
  var containermessage;
  final VoidCallback calls;
  var hintstyle = TextStyle(color: Colors.white, fontFamily: 'montserrat', fontSize: 15);
  var icon;
  var controller1;
  var controller2;
  var controller3;
  var controller4;
  var controller5;

  Modal({
    required this.hinttext,
    required this.hintstyle,
    required this.modalheight,
    required this.calls,
    required this.description,
    required this.startdate,
    required this.enddate,
    required this.containermessage,
    required this.position,
    required this.icon,
    required this.controller1,
    required this.controller2,
    required this.controller3,
    required this.controller4,
    required this.controller5,
  });

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width - 30,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(containermessage,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'montserrat',
                      fontSize: 18)),
            ),
            SizedBox(
              width: 30,
            ),
            GestureDetector(
                onTap: () {
                  showBarModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                            height: modalheight,
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                              height: 80,
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      height: 100,
                                      width: MediaQuery.of(context).size.width -
                                          40,
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          controller: controller1,
                                          maxLines: 3,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please Enter Institution Name';
                                            }
                                            return null;
                                          },
                                          //controller: InstitutionNameController,
                                          decoration: InputDecoration(
                                              hintText: hinttext,
                                              hintStyle: hintstyle,
                                              border: InputBorder.none,
                                              suffixIcon: icon),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      height: 60,
                                      width: MediaQuery.of(context).size.width -
                                          40,
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          controller: controller2,
                                          maxLines: 3,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please Enter Qualification';
                                            }
                                            return null;
                                          },
                                          //controller: MinQualification,
                                          decoration: InputDecoration(
                                            hintText: position,
                                            hintStyle: hintstyle,
                                            border: InputBorder.none,
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
                                      width: MediaQuery.of(context).size.width -
                                          40,
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          controller: controller3,
                                          maxLines: 3,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please Enter Description';
                                            }
                                            return null;
                                          },
                                          //controller: Description,
                                          decoration: InputDecoration(
                                            hintText: description,
                                            hintStyle: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'montserrat',
                                            ),
                                            border: InputBorder.none,
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
                                      width: MediaQuery.of(context).size.width -
                                          40,
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          controller: controller4,
                                          maxLines: 3,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please Enter Start Date';
                                            }
                                            return null;
                                          },
                                          // controller: StartDate,
                                          decoration: InputDecoration(
                                            hintText: startdate,
                                            hintStyle: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'montserrat',
                                            ),
                                            border: InputBorder.none,
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
                                      width: MediaQuery.of(context).size.width -
                                          40,
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          controller: controller5,
                                          //maxLines: 3,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please Enter End Date';
                                            }
                                            return null;
                                          },
                                          //controller: EndDate,
                                          decoration: InputDecoration(
                                            hintText: enddate,
                                            hintStyle: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'montserrat',
                                            ),
                                            border: InputBorder.none,
                                            suffixIcon: Icon(
                                              Icons.date_range,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    GestureDetector(
                                      onTap: () => calls(),
                                      child: Container(
                                        height: 60,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                40,
                                        child: Center(
                                            child: Text(
                                          'Save',
                                          style: hintstyle,
                                        )),
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ));
                },
                child: Icon(Icons.add, color: Colors.black, size: 40)),
          ],
        ),
      ),
    );
  }
}

class Thecontainer extends StatelessWidget {
  const Thecontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      

    );
  }
}
