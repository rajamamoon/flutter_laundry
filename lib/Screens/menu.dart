import 'package:flutter/material.dart';
import 'package:laundry_app/Screens/ProfilePage.dart';
import 'package:laundry_app/Screens/login.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.red, Color(0xff2550255)],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                '',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/logo.png'))),
            ),
            ListTile(
              leading: Icon(Icons.input),
              title: Text('Home'),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text('Profile'),
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()))
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.border_color),
              title: Text('Feedback'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()))
              },
            ),
          ],
        ),
      ),
    );
  }
}
