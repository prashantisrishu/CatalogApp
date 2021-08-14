import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final imageUrl = "https://avatars.githubusercontent.com/u/53404310?s=400&u=88d313585c1cde294b0f76de5921ea508cea1c2b&v=4";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
         children: [
           DrawerHeader(
             padding: EdgeInsets.zero,
             child: UserAccountsDrawerHeader(
               margin: EdgeInsets.zero,
               accountName: Text("Prashant Mishra"), 
               accountEmail: Text("prashantisrishu13@gmail.com"),
               currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl), 
               ),
              ),
            ),
            ListTile(
              leading: Icon(
               CupertinoIcons.home,
               color: Colors.white, 
              ),
              title: Text("Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                color: Colors.white
              ),
              ),
            ),
            ListTile(
              leading: Icon(
               CupertinoIcons.profile_circled,
               color: Colors.white,
               ),
               title: Text("Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                   color: Colors.white,
                ),
              ), 
            ),
            ListTile(
              leading: Icon(
               CupertinoIcons.mail,
               color: Colors.white,
               ),
               title: Text("Mail me",
                textScaleFactor: 1.2,
                style: TextStyle(
                   color: Colors.white,
                ),
              ), 
            ),
          ],
        ), 
      ),
    );
  }
}