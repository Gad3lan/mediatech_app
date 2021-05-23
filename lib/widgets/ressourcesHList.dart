import 'package:flutter/material.dart';
import 'package:mediatech_app/core/ressource.dart';
import 'package:mediatech_app/modules/screens/ressourceInfoScreen.dart';

class RessourcesHList extends StatelessWidget {
  String title;
  List<Ressource> ressources;
  RessourcesHList({Key? key, required this.title, required this.ressources}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        children: <Widget>[
          Text(title),
          ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: ressources.length,
            itemBuilder: (context, id) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RessourceInfoScreen(ressource: ressources[id]),
                  ));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.network(ressources[id].cover),
                    const SizedBox(height: 10,),
                    Text(ressources[id].title, style: Theme.of(context).textTheme.headline6,),
                    Text(ressources[id].title, style: Theme.of(context).textTheme.subtitle1,),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
