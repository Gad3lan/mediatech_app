import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mediatech_app/constants/types.dart';
import 'package:mediatech_app/core/ressource.dart';
import 'package:mediatech_app/widgets/menus/bottomBarMenu.dart';
import 'package:mediatech_app/widgets/menus/menu.dart';
import 'package:mediatech_app/widgets/ressourcesVList.dart';

class HomeScreen extends StatefulWidget {
  String currentType;

  HomeScreen({Key? key, required this.currentType}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Ressource> toList(ressources) {
    List<Ressource> parsedRessources = [];
    for (var elt in ressources) {
      parsedRessources.add(new Ressource(
          title: elt['title'],
          author: elt['author'],
          editor: elt['editor'],
          publicationDate: DateTime.parse(elt['edition_date']),
          cover: elt['cover'],
          summary: elt['resume'],
          type: elt['type']['type'],
          genre: elt['genre']['genre'],
          id: elt['cote'],
          copies: elt['quantity'],
          availability: elt['quantity'] > 0)
      );
    }
    return parsedRessources;
  }

  @override
  Widget build(BuildContext context) {
    final String _query = '''
    query ress() {
      ressource_type (type: "''' + widget.currentType + '''") {
        ressources {
          title
          author
          editor
          edition_date
          cover
          resume
          type {type}
          genre {genre}
          cote
          quantity
        }
      }
    }
  ''';
    // return Query(
    //   options: QueryOptions(document: gql(_query)),
    //   builder: (QueryResult? result, { VoidCallback? refetch, FetchMore? fetchMore }) {
    //     if (result!.hasException) {
    //       return Text(result.exception.toString());
    //     }
    //     if (result.isLoading) {
    //       return Text('Loading');
    //     }
    //     final List users = result.data[]
    //   },
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),//Text(widget.currentType.toString().split('.').last),
      ),
      drawer: Menu(),
      bottomNavigationBar: BottomMenuBar(),
      body: Query(
        options: QueryOptions(document: gql(_query)),
        builder: (QueryResult? result, { VoidCallback? refetch, FetchMore? fetchMore }) {
          if (result!.hasException) {
            return Text(result.exception.toString());
          }
          if (result.isLoading) {
            return CircularProgressIndicator();
          }
          return RessourceVList(ressources: toList(result.data!['ressource_type'][0]['ressources']));
        },
      ),
    );
  }
}
