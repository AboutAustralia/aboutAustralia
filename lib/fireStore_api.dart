import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class FireStoreAPI{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  Future<void> addUser(var displayName, var photoUrl, var userID, var token){
    CollectionReference users = firestore.collection('users');
    users
        .add({
      'displayName': displayName,
      'photoUrl': photoUrl,
      'userID': userID,
      'token': token
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));

  }



}