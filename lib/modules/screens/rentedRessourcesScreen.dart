import 'package:flutter/material.dart';
import 'package:mediatech_app/core/ressource.dart';
import 'package:mediatech_app/modules/screens/ressourceInfoScreen.dart';
import 'package:mediatech_app/utils/services/clientService.dart';
import 'package:mediatech_app/widgets/menus/bottomBarMenu.dart';
import 'package:mediatech_app/widgets/menus/menu.dart';
import 'package:mediatech_app/widgets/ressourcesVList.dart';

class RentedRessourcesScreen extends StatelessWidget {
  final List<Ressource>? rentedRessources = ClientService.getRessources();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mes locations")),
      drawer: Menu(),
      bottomNavigationBar: BottomMenuBar(),
      body: rentedRessources!.isNotEmpty ? RessourceVList(ressources: rentedRessources!) : Center(
        child: Text("Vous n'avez emprunté aucun média", style: TextStyle(fontSize: 16),),
      ),
    );
  }
}

