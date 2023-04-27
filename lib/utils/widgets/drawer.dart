import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});
  final image =
      "https://tse4.mm.bing.net/th?id=OIP.FjSRywv2jSoO2kdlijRZ4gHaHa&pid=Api&P=0";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shadowColor: Colors.yellow,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                  ),
                  accountName: const Text("Raunak dubey"),
                  accountEmail: const Text("raunakdubey681@gamil.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(image),
                  ))),
          const ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.black,
            ),
            title: Text("Home", textScaleFactor: 1),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.black,
            ),
            title: Text("Profile", textScaleFactor: 1),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.mail_solid,
              color: Colors.black,
            ),
            title: Text("Mail", textScaleFactor: 1),
          )
        ],
      ),
    );
  }
}
