import 'package:flutter/material.dart';
import 'package:mediatech_app/constants/types.dart';
import 'package:mediatech_app/widgets/menus/bottomBarMenu.dart';
import 'package:mediatech_app/widgets/menus/menu.dart';

class HomeScreen extends StatefulWidget {
  Type currentType;

  HomeScreen({Key? key, required this.currentType}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.currentType.toString().split('.').last),
      ),
      drawer: Menu(),
      bottomNavigationBar: BottomMenuBar(),
    );
  }
}
