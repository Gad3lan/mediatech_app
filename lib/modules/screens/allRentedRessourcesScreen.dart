import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AllRentedRessourcesScreen extends StatelessWidget {
  String _query = """
    query rentedRessources {
      rentals {
        ressource {
          title
          author
          cover
          rentals {
            user {
              name
            }
          }
        }
      }
    }
  """;

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(document: gql(_query)),
      builder: (QueryResult? result, { VoidCallback? refetch, FetchMore? fetchMore }) {
        if (result!.hasException) {
          return Text(result.exception.toString());
        }
        if (result.isLoading) {
          return CircularProgressIndicator();
        }

        final resultList = result.data;
        print(resultList);

        return Text("Done");
      },
    );
  }
}
