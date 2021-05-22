import 'package:flutter/material.dart';
import 'package:mediatech_app/core/ressource.dart';

class RessourceInfoScreen extends StatelessWidget {
  final Ressource ressource;

  RessourceInfoScreen({required this.ressource});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ressource.title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.network(ressource.cover, height: 300, fit: BoxFit.fitHeight,)),
            const SizedBox(height: 20,),
            Text(ressource.title, style: Theme.of(context).textTheme.headline6,),
            Text(ressource.author, style: Theme.of(context).textTheme.subtitle1,),
            Text(ressource.editor, style: Theme.of(context).textTheme.subtitle1,),
            Text(ressource.publicationDate.year.toString(), style: Theme.of(context).textTheme.subtitle1,),
            const SizedBox(height: 10,),
            Text(ressource.type + ", " + ressource.genre, style: Theme.of(context).textTheme.subtitle1,),
            Text("Nombre d'exemplaires: " + ressource.copies.toString(), style: Theme.of(context).textTheme.subtitle1,),
            Text(ressource.availability ? "Disponible" : "Pas disponible", style: Theme.of(context).textTheme.subtitle2,),
          ],
        ),
      ),
    );
  }
}

