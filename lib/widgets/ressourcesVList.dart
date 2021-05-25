import 'package:flutter/material.dart';
import 'package:mediatech_app/core/ressource.dart';
import 'package:mediatech_app/modules/screens/ressourceInfoScreen.dart';

class RessourceVList extends StatelessWidget {
  List<Ressource> ressources;

  RessourceVList({Key? key, required this.ressources}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ressources.length,
      itemBuilder: (context, id) {
        return ListTile(
          leading: Image.network(ressources[id].cover),
          title: Text(ressources[id].title),
          subtitle: Text(ressources[id].author),
          trailing: IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => RessourceInfoScreen(ressource: ressources[id]),
            )),
          ),
        );
      },
    );
  }
}
