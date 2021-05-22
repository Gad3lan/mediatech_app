import 'package:flutter/material.dart';
import 'package:mediatech_app/core/ressource.dart';
import 'package:mediatech_app/modules/screens/ressourceInfoScreen.dart';
import 'package:mediatech_app/utils/services/clientService.dart';
import 'package:mediatech_app/widgets/menus/bottomBarMenu.dart';
import 'package:mediatech_app/widgets/menus/menu.dart';

class RentedRessourcesScreen extends StatelessWidget {
  final List<Ressource>? rentedRessources = ClientService.getRessources();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mes locations")),
      drawer: Menu(),
      bottomNavigationBar: BottomMenuBar(),
      body: rentedRessources != null ? ListView.builder(
        itemCount: rentedRessources!.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.network(rentedRessources![index].cover),
            title: Text(rentedRessources![index].title),
            subtitle: Text(rentedRessources![index].author),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => RessourceInfoScreen(ressource: rentedRessources![index]),
              )),
            ),
          );
        },
      ) : Center(
        child: Text("Vous n'avez emprunté aucun média", style: TextStyle(fontSize: 16),),
      ),
    );
  }
}

