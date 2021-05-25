import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mediatech_app/widgets/menus/bottomBarMenu.dart';
import 'package:mediatech_app/widgets/menus/menu.dart';

class UserListScreen extends StatelessWidget {
  String _query = """
    query users {
      user {
        name
        email
        membership_id
        rentals {
          ressource {
            title
          }
        }
      }
    }
  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Liste des utilisateurs")),
      drawer: Menu(),
      bottomNavigationBar: BottomMenuBar(),
      body: Query(
        options: QueryOptions(document: gql(_query)),
        builder: (QueryResult? result, { VoidCallback? refetch, FetchMore? fetchMore}) {
          print(result);
          if (result!.hasException) {
            return Text(result.exception.toString());
          }
          if (result.isLoading) {
            return CircularProgressIndicator();
          }
          return Text("Done");
        },
      ),
    );
  }
}