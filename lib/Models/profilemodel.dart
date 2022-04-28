import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Profile {
  String ? Name;
  String ? Email;
  String ? Phone;
  String ? Address;
  String ? Jobtitle;

  Profile({
    this.Name,
    this.Email,
    this.Phone,
    this.Address,
    this.Jobtitle,
  });

  factory Profile.fromJson(DocumentSnapshot snapshot) => Profile(
        Name: snapshot["Name"],
        Email: snapshot["Email"],
        Phone: snapshot["Phone"],
        Address: snapshot["Address"],
        Jobtitle: snapshot["Jobtitle"],
      );

}