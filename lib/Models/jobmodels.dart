import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Jobs {
  String? Jobtitle;
  String? Description;
  String? Location;
  String? Amount;
  String? PeopleRequired;


 

  Jobs({
    this.Description,
    this.Location,
    this.Amount,
    this.Jobtitle,
    this.PeopleRequired,
   
  
   
  });

  factory Jobs.fromJson(DocumentSnapshot snapshot) => Jobs(
        Description: snapshot["jobDescription"],
        Location: snapshot["jobLocation"],
        Amount: snapshot["jobAmount"],
        Jobtitle: snapshot["jobTitle"],
        PeopleRequired: snapshot["peopleRequired"],
      
      
      
      );
}
