import 'package:flutter/material.dart';
import 'package:mediatech_app/widgets/menus/bottomBarMenu.dart';
import 'package:mediatech_app/widgets/menus/menu.dart';

class RessourcesInfoScreenConnected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      drawer: Menu(),
      bottomNavigationBar: BottomMenuBar(),
    );
  }
}