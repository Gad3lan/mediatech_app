import 'package:flutter/material.dart';
import 'package:mediatech_app/core/user.dart';
import 'package:mediatech_app/utils/services/clientService.dart';
import 'package:mediatech_app/widgets/menus/bottomBarMenu.dart';
import 'package:mediatech_app/widgets/menus/menu.dart';

class ProfileScreen extends StatelessWidget {
  User user = ClientService.getUser();

  Widget line(String title, String content) {
    return Row(
      children: <Widget>[
        Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
        Text(': ' + content, style: TextStyle(fontSize: 14),),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
      ),
      drawer: Menu(),
      bottomNavigationBar: BottomMenuBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.account_circle, size: 100.0, color: Colors.black26,),
            const SizedBox(height: 20,),
            line("Nom", user.name),
            const SizedBox(height: 10,),
            line("Email", user.email),
            const SizedBox(height: 10,),
            line("Numéro d'adhérent", user.membershipID),
            const SizedBox(height: 10,),
            line("Role", user.role.toString()),
            const SizedBox(height: 10,),
            line("Nombre d'avertissements", user.strikeNumber.toString()),
          ],
        ),
      ),
    );
  }
}
