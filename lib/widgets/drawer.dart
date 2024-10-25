import 'package:flutter/material.dart';
import 'package:medicine_warehouse/pages/homePage.dart';
import 'package:medicine_warehouse/pages/loginPage.dart';
import 'package:medicine_warehouse/pages/profilePage.dart';

import '../constant.dart';
import '../pages/trackingPage.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: kFirstColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text(
                    'Top Pharma',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                Text(
                    'warehouse name',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 18,
                    ),
                  ),
              ],
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              // Navigate to the home page
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            title: Text('Tracking'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TrackingPage()),
              );
            },
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          SizedBox(height: 405,),
          ListTile(
            tileColor: kFirstColor,
            leading: Icon(
                      Icons.logout_outlined,
                      color: kSecondColor,
                    ),
            title: Text(
                      " LogOut",
                      style: TextStyle(
                        fontSize: 18,
                        color: kSecondColor,
                      ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            }
          ),
        ],
      ),
    );
  }
}
