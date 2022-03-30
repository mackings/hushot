import 'package:flutter/material.dart';

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
        
      ]),
    );
  }
}
