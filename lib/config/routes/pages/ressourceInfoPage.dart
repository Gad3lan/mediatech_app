import 'package:flutter/material.dart';
import 'package:mediatech_app/core/ressource.dart';
import 'package:mediatech_app/modules/screens/ressourceInfoScreen.dart';

class RessourceInfoPage extends Page {
  final Ressource ressource;

  RessourceInfoPage({this.ressource}) : super(key: ValueKey(ressource));

  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return RessourceInfoScreen(ressource: ressource);
      },
    );
  }
}