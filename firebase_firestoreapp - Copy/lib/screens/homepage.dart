import 'package:flutter/material.dart';
import 'package:firebase_firestoreapp/screens/detailpage.dart';
import 'package:firebase_firestoreapp/screens/navdrawer.dart';

class Homepagez extends StatefulWidget {
  Homepagez({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepagez> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   onPressed: () {},
        // ),
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
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

      body:

          // Column(

          // children:[

          //  Image(
          //  image: AssetImage('images/shoe_shop.jpg'),
          //  height: 300,
          //  width: 360,
          // ),

          ListView(
        scrollDirection: Axis.vertical,
        children: [
          _buildListItem('images/crackled.png', 'Crackled Texture', '\$205.0'),
          _buildListItem('images/linoleum.png', 'Linoleum Texture', '\$146.0'),
          _buildListItem('images/rag.png', 'Ragged Texture', '\$130.0'),
          _buildListItem('images/stone.png', 'Stone Texture', '\$128.0'),
          _buildListItem('images/striae.png', 'Striae Texture', '\$132.0'),
          _buildListItem('images/wood.png', 'Wood Texture', '\$139.0'),
        ],
      ),
      // ],
      // ),
    );
  } //build

  Widget _buildListItem(String imgPath, String itemName, String itemPrice) {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Hero(
              tag: imgPath,
              child: Image(
                image: AssetImage(imgPath),
                height: 150,
                width: 100,
              ),
            ),
            Column(
              children: [
                Text(
                  itemName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  itemPrice,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.add_box),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                        iPath: imgPath, iName: itemName, iPrice: itemPrice),
                  ),
                );
              },
            ),
          ],
        ));
  }
} //HomepageState
