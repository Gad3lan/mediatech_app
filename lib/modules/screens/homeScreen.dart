import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mediatech_app/constants/types.dart';
import 'package:mediatech_app/widgets/menus/bottomBarMenu.dart';
import 'package:mediatech_app/widgets/menus/menu.dart';

class HomeScreen extends StatefulWidget {
  //Type currentType;

  //HomeScreen({Key? key, required this.currentType}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String _query = """
    query user {
      user {
        name
        roles
      }
    }
  """;

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
