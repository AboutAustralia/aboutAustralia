import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:math';
import 'dart:core';

class FireStoreAPI{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  Future<void> addUser(var displayName, var photoUrl, var userID, var token, var uid){

    CollectionReference users = firestore.collection('users');
    users.doc(uid)
        .set({
      'displayName': displayName,
      'photoUrl': photoUrl,
      'userID': userID,
      'token': token,
      'uid': uid
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));

  }


  Future<void> addQuestion(var question, var postedBy,){

    var rand = Random(DateTime.now().millisecondsSinceEpoch.abs());
    int qID = rand.nextInt(999999999);
    CollectionReference users = firestore.collection('questions');
    users.doc(qID.toString())
        .set({
      'question': question,
      'postedBy': postedBy,
      'time': DateTime.now(),
      'qID': qID,
      'answer': null,
      'useful': 0,
      'interested': 0
    })
        .then((value) => print("Question added"))
        .catchError((error) => print("Failed to add question: $error"));
  }
  Future<void> getUserInfo(var uid){

    CollectionReference users = firestore.collection('users');
    users.doc(uid)
        .get()
        .then((value) => print("Got 'em"))
        .catchError((error) => print("Failed to get user: $error"));

  }
}
//flutter packages pub run build_runner watch — delete-conflicting-outputs