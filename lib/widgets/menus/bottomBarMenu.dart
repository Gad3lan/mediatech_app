import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:mediatech_app/constants/types.dart';
import 'package:mediatech_app/modules/screens/homeScreen.dart';

class BottomMenuBar extends StatefulWidget {
  BottomMenuBar({Key? key}) : super(key: key);

  @override
  _BottomMenuBarState createState() => _BottomMenuBarState();
}

class _BottomMenuBarState extends State<BottomMenuBar> {
  int _selectedIndex = 0;
  List<String> types = ["Livre", "Journaux", "Film"];

  void _onItemTapped(int index) {
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HomeScreen(currentType: types[index],)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.book),
          label: "Livres",
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.news),
          label: "Journaux",
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.film),
          label: "Films",
        )
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.lightBlue,
      onTap: _onItemTapped,
    );
  }
}

