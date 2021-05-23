import 'package:flutter/material.dart';
import 'package:mediatech_app/core/role.dart';
import 'package:mediatech_app/core/user.dart';
import 'package:mediatech_app/modules/screens/loginScreen.dart';
import 'package:mediatech_app/modules/screens/profileScreen.dart';
import 'package:mediatech_app/utils/services/clientService.dart';
import 'package:mediatech_app/widgets/menus/adminMenu.dart';
import 'package:mediatech_app/widgets/menus/connectedMenu.dart';
import 'package:mediatech_app/widgets/menus/managerMenu.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final padding = EdgeInsets.symmetric(horizontal: 20.0);
  User user = ClientService.getUser();

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
            builder: (context) => LoginScreen())
        );
    }
  }

  Widget appropriateMenu(BuildContext context) {
    switch (user.role) {
      case Role.connected:
        return ConnectedMenu();
        break;
      case Role.manager:
        return ManagerMenu();
      case Role.admin:
        return AdminMenu();
      default:
        return ListView(
          //padding: padding,
          children: <Widget>[
            buildMenuItem(
              text: "Se connecter",
              icon: Icons.login,
              onClicked: () => selectedItem(context, 0),
            ),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 48,),
            Text(user.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            Text(user.membershipID),
            const SizedBox(height: 5,),
            Expanded(child: appropriateMenu(context)),
          ],
        ),
      ),
    );
  }
}
