import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mediatech_app/constants/types.dart';
import 'package:mediatech_app/core/role.dart';
import 'package:mediatech_app/core/user.dart';
import 'package:mediatech_app/modules/screens/homeScreen.dart';
import 'package:mediatech_app/modules/screens/loginScreen.dart';
import 'package:mediatech_app/utils/services/clientService.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final HttpLink link = HttpLink("http://localhost:8080/graphql");

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: GraphQLCache(),
      link: link,
    ),
  );


  runApp(MediaTechApp(client: client,));
}

class MediaTechApp extends StatefulWidget {
  final ValueNotifier<GraphQLClient> client;
  MediaTechApp({Key? key, required this.client}): super(key: key);
  @override
  _MediaTechAppState createState() => _MediaTechAppState();
}

class _MediaTechAppState extends State<MediaTechApp> {
  ClientService clientService = new ClientService(token: "ZITNHEZTHN");
  //ClientService.setUser(user);

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: widget.client,
      child: CacheProvider(
        child: MaterialApp(
          home: LoginScreen(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}