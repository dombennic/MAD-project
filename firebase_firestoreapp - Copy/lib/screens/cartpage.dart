import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'detailpage.dart';
import 'navdrawer.dart';
import 'package:firebase_firestoreapp/services/firestore_service2.dart';
import 'package:firebase_firestoreapp/services/firestore_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Screen2 extends StatefulWidget {
  final int itemCount;
  final String iName;

  Screen2({this.itemCount, this.iName});

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  // String bookAuthor;
  // String bookTitle;
  // String bookDescription;
  final formKey = GlobalKey<FormState>();

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cart Page',
      home: Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          title: Text('CART'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[Colors.red, Colors.blue],
              ),
            ),
          ),
        ),
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                'Confirm Before Checking Out!',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              height: 230,
            ),
            Container(
              height: 120.0,
              alignment: Alignment.center,
              color: Colors.black45,
              child: Text(
                widget.itemCount == null
                    ? 'Quantity is empty'
                    : 'You are purchasing ' +
                        widget.itemCount.toString() +
                        ' pairs of ' +
                        widget.iName.toString(),
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              height: 250,
              alignment: Alignment.bottomCenter,
              child: Form(
                key: formKey,
                child: TextButton(
                  onPressed: _submit,
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    overlayColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered))
                          return Colors.red.withOpacity(0.4);
                        if (states.contains(MaterialState.focused) ||
                            states.contains(MaterialState.pressed))
                          return Colors.red.withOpacity(0.4);
                        return null; // Defer to the widget's default.
                      },
                    ),
                  ),
                  child: Text('Check Out'),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }

  void _submit() {
    if (this.formKey.currentState.validate()) {
      formKey.currentState.save();
    } else {
      return null;
    }
    FirestoreService()
        .addTileData(widget.iName.toString(), widget.itemCount.toString());
    Fluttertoast.showToast(
        msg: "Data saved successfully", gravity: ToastGravity.TOP);
  } //_submit

}
