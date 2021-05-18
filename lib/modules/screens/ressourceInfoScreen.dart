import 'package:flutter/material.dart';
import 'package:mediatech_app/core/ressource.dart';

class RessourceInfoScreen extends StatelessWidget {
  final Ressource ressource;

  RessourceInfoScreen({required this.ressource});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (ressource != null) ...[
              Text(ressource.title, style: Theme.of(context).textTheme.headline6,),
              Text(ressource.author, style: Theme.of(context).textTheme.subtitle1,)
            ]
          ],
        ),
      ),
    );
  }
}

