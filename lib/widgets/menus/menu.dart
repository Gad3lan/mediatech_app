import 'package:flutter/material.dart';
import 'package:mediatech_app/core/user.dart';
import 'package:mediatech_app/modules/screens/profileScreen.dart';
import 'package:mediatech_app/utils/services/clientService.dart';


class Menu extends StatelessWidget {
  //const Menu({Key key}) : super(key: key);

  final padding = EdgeInsets.symmetric(horizontal: 20.0);
  final User user = ClientService().getUser();
  final name = user.name;


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
            builder: (context) => ProfileScreen())
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(height: 48,),
            buildMenuItem(
              text: "text",
              icon: Icons.access_alarm,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(height: 20,),
            Divider(color: Colors.black26,),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
