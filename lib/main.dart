import 'package:flutter/material.dart';
import 'package:mediatech_app/constants/types.dart';
import 'package:mediatech_app/core/role.dart';
import 'package:mediatech_app/core/user.dart';
import 'package:mediatech_app/modules/screens/homeScreen.dart';
import 'package:mediatech_app/utils/services/clientService.dart';
import 'package:mediatech_app/widgets/menus/bottomBarMenu.dart';
import 'package:mediatech_app/widgets/menus/menu.dart';

void main() {
  runApp(MediaTechApp());
}

class MediaTechApp extends StatefulWidget {
  @override
  _MediaTechAppState createState() => _MediaTechAppState();
}

class _MediaTechAppState extends State<MediaTechApp> {
  User user = new User(
      name: "Alan Adamiak",
      email: "alan.adamiak@gmail.com",
      membershipID: "53TGJT",
      role: Role.Manager,
      strikeNumber: 0
  );

  ClientService clientService = new ClientService(token: "ZITNHEZTHN");
  //ClientService.setUser(user);

  @override
  Widget build(BuildContext context) {
    ClientService.setUser(user);
    return MaterialApp(
      home: HomeScreen(currentType: Type.Livres,),
      debugShowCheckedModeBanner: false,
    );
  }
}