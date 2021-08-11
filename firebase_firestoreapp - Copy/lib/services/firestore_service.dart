import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_firestoreapp/model/tile.dart';

class FirestoreService {
  // Create a CollectionReference called bookCollection that references
  // the firestore collection
  final CollectionReference tileCollection =
      FirebaseFirestore.instance.collection('tile');
  Future<void> addTileData(String iName, String itemCount) async {
    var docRef = FirestoreService().tileCollection.doc();
    print('add docRef: ' + docRef.id);
    await tileCollection.doc(docRef.id).set({
      'uid': docRef.id,
      'Tile Name': iName,
      'Total Quantity': itemCount,
    });
  } //addBookData

  Future<List<Tile>> readTileData() async {
    List<Tile> tileList = [];
    QuerySnapshot snapshot = await tileCollection.get();
    snapshot.docs.forEach((document) {
      Tile tile = Tile.fromMap(document.data());
      tileList.add(tile);
    });
    print('Tilelist: $tileList');
    return tileList;
  } //readBookData

  Future<void> deleteTileData(String docId) async {
    tileCollection.doc(docId).delete();
    print('deleting uid: ' + docId);
  } //deleteBookData

  //for your reference
  Future<void> updateTileData(String iName, String itemCount) async {
    var docRef = FirestoreService().tileCollection.doc();
    print('update docRef: ' + docRef.id);
    await tileCollection.doc(docRef.id).update({
      'uid': docRef.id,
      'Tile Name': iName,
      'Total Quantity': itemCount,
    });
  } //updateBookData
  //for your reference
//  Future<void> deleteBookDoc() async {
//  Await bookCollection.get();.then((snapshot) {
//  for (DocumentSnapshot ds in snapshot.docs) {
//  ds.reference.delete();
//  }
//  });
//  } //deleteBookDoc
} //FirestoreService
