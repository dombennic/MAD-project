import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_firestoreapp/screens/cartpage.dart';
import 'package:flutter/material.dart';

class AddUser extends StatelessWidget {
  final int itemCount;
  final String iName;

  AddUser(this.itemCount, this.iName);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      return users
          .add({'item': iName, 'value': itemCount})
          .then((value) => print("Checked Out Succesfully"))
          .catchError((error) => print("Failed to check out: $error"));
    }

    return TextButton(
      onPressed: addUser,
      child: Text(
        "Checked Out!",
      ),
    );
  }
}
