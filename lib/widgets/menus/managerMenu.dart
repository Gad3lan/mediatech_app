import 'package:flutter/material.dart';
import 'package:mediatech_app/modules/screens/allRentedRessourcesScreen.dart';
import 'package:mediatech_app/modules/screens/editRecommendationsList.dart';
import 'package:mediatech_app/modules/screens/editRessourcesScreen.dart';
import 'package:mediatech_app/modules/screens/errorScreen.dart';
import 'package:mediatech_app/modules/screens/loginScreen.dart';
import 'package:mediatech_app/modules/screens/profileScreen.dart';
import 'package:mediatech_app/modules/screens/readingListScreen.dart';
import 'package:mediatech_app/modules/screens/rentedRessourcesScreen.dart';
import 'package:mediatech_app/modules/screens/userListScreen.dart';

class ManagerMenu extends StatelessWidget {
  ManagerMenu({Key? key}) : super(key: key);

  final padding = EdgeInsets.symmetric(horizontal: 20.0);

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.black12;

    return ListTile(
      leading: Icon(icon, color: color,),
      title: Text(text),
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int id) {
    Navigator.of(context).pop();

    switch (id) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProfileScreen()),
        );
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ReadingListScreen()),
        );
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RentedRessourcesScreen()),
        );
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => UserListScreen()),
        );
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EditRessourcesScreen()),
        );
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EditRecommendationsList()),
        );
        break;
      case 6:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AllRentedRessourcesScreen()),
        );
        break;
      default:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ErrorScreen())
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: padding,
      children: <Widget>[
        const SizedBox(height: 48,),
        buildMenuItem(
          text: "Profil",
          icon: Icons.account_circle,
          onClicked: () => selectedItem(context, 0),
        ),
        buildMenuItem(
          text: "Liste de lecture",
          icon: Icons.menu_book,
          onClicked: () => selectedItem(context, 1),
        ),
        buildMenuItem(
          text: "Mes locations",
          icon: Icons.book,
          onClicked: () => selectedItem(context, 2),
        ),
        Divider(color: Colors.black54,),
        Text("Gestion", style: TextStyle(fontSize: 18),),
        SizedBox(height: 5,),
        buildMenuItem(
          text: "Liste des utilisateurs",
          icon: Icons.supervisor_account,
          onClicked: () => selectedItem(context, 3),
        ),
        buildMenuItem(
          text: "Editer les ressources",
          icon: Icons.edit,
          onClicked: () => selectedItem(context, 4),
        ),
        buildMenuItem(
          text: "Editer les recommandations",
          icon: Icons.edit,
          onClicked: () => selectedItem(context, 5),
        ),
        buildMenuItem(
          text: "Ressources louées",
          icon: Icons.assignment,
          onClicked: () => selectedItem(context, 6),
        ),
      ],
    );
  }
}
