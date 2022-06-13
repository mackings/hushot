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
  var hintstyle =
      TextStyle(color: Colors.white, fontFamily: 'montserrat', fontSize: 15);
  List listwidgets;
  var newwid = Column();
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
    required this.listwidgets,
    required this.newwid,
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
                                child: newwid,
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
  var conicon;
  var conheight;
  var conmaxlines;
  var coniconstyle = Colors.white;
  var conhint;
  var concontroller;
  var conhintstyle;

  Thecontainer({
    required this.conicon,
    required this.coniconstyle,
    required this.conhint,
    required this.concontroller,
    required this.conhintstyle,
    required this.conheight,
    required this.conmaxlines,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: conheight,
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: concontroller,
          maxLines: conmaxlines,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please Enter Start Date';
            }
            return null;
          },
          // controller: StartDate,
          decoration: InputDecoration(
            hintText: conhint,
            hintStyle: TextStyle(
              color: Colors.white,
              fontFamily: 'montserrat',
            ),
            border: InputBorder.none,
            suffixIcon: conicon,
            suffixStyle: conhintstyle,
          ),
        ),
      ),
    );
  }
}

class Callbackbtn extends StatelessWidget {
  final VoidCallback callback;
  final btntext;

  Callbackbtn({
    required this.btntext,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
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
              child: Text(btntext,
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'montserrat'))),
        ),
      ),
    );
  }
}
