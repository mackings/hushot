import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class Showaf extends StatefulWidget {
  final hint;
  final Icon;
  final controller;
  final Function onPressed;

  const Showaf(
      {Key? key,
      required this.hint,
      required this.Icon,
      required this.onPressed,
      required this.controller})
      : super(key: key);

  @override
  State<Showaf> createState() => _ShowafState();
}

class _ShowafState extends State<Showaf> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [

        TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hint,
            prefixIcon: Icon(widget.Icon),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),




         CarouselSlider(
                items: [
                  GestureDetector(
                    onTap: () {
                     // Navigator.pushReplacement(context,
                      //    MaterialPageRoute(builder: (context) => Orgform()));
                      print('Job1');
                    },
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width - 15,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text('Babtech Computers',
                              style: TextStyle(
                                  fontFamily: 'montserrat',
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              SizedBox(width: 40),
                              Text('Job Title:',
                                  style: TextStyle(
                                      fontFamily: 'montserrat',
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(width: 10),
                              Text('Backend Developer',
                                  style: TextStyle(
                                      fontFamily: 'montserrat',
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(width: 70),
                              Text('Job Status:',
                                  style: TextStyle(
                                      fontFamily: 'montserrat',
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(width: 10),
                              Text('Available',
                                  style: TextStyle(
                                      fontFamily: 'montserrat',
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                options: CarouselOptions(
                  height: 90,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                ),
              ),
        
      ]),
    );
  }
}
