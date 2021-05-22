import 'package:flutter/material.dart';
import 'package:mediatech_app/modules/screens/errorScreen.dart';
import 'package:mediatech_app/modules/screens/loginScreen.dart';
import 'package:mediatech_app/modules/screens/profileScreen.dart';
import 'package:mediatech_app/modules/screens/readingListScreen.dart';
import 'package:mediatech_app/modules/screens/rentedRessourcesScreen.dart';
import 'package:mediatech_app/widgets/menus/menu.dart';

class ConnectedMenu extends StatelessWidget {
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
        //const SizedBox(height: 5,),
        buildMenuItem(
          text: "Liste de lecture",
          icon: Icons.menu_book,
          onClicked: () => selectedItem(context, 1),
        ),
        //const SizedBox(height: 5,),
        buildMenuItem(
          text: "Mes locations",
          icon: Icons.book,
          onClicked: () => selectedItem(context, 2),
        )
      ],
    );
  }
}
