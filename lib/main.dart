import 'package:flutter/material.dart';
import 'package:mediatech_app/config/routes/routeInformationParser.dart';
import 'package:mediatech_app/config/routes/routerDelegate.dart';
import 'package:mediatech_app/widgets/menus/menu.dart';

void main() {
  runApp(MediaTechApp());
}

class Book {
  final String title;
  final String author;

  Book(this.title, this.author);
}


class MediaTechApp extends StatefulWidget {
  @override
  _MediaTechAppState createState() => _MediaTechAppState();
}

class _MediaTechAppState extends State<MediaTechApp> {
  RessourceRouterDelegate _routerDelegate = RessourceRouterDelegate();
  RessourceRouteInformationParser _routeInformationParser = RessourceRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          title: Text("Home"),
        ),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp.router(
  //     title: 'Books App',
  //     routerDelegate: _routerDelegate,
  //     routeInformationParser: _routeInformationParser,
  //   );
  // }
}