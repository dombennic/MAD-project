import 'package:firebase_firestoreapp/screens/home_page.dart';
import 'package:firebase_firestoreapp/screens/homepage.dart';
import 'package:firebase_firestoreapp/screens/showrecords_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_firestoreapp/services/firebaseauth_service.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'The Interior',
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage('images/cover.jpg'))),
          ),
          ListTile(
            leading: Icon(Icons.menu_book),
            title: Text('Main Menu'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home Page'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Homepagez()),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.bookmark),
            title: Text('Record Page'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RecordsPage()),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () async => {
              await FirebaseAuthService().signOut(),
              Navigator.of(context).pushNamed('/login'),
            },
          ),
        ],
      ),
    );
  }
}
