import 'package:mediatech_app/core/ressource.dart';
import 'package:mediatech_app/core/role.dart';
import 'package:mediatech_app/core/user.dart';

class ClientService {
  final String? token;
  static User _user = new User(
    name: "Utilisateur anonyme",
    email: "",
    membershipID: "",
    role: Role.not_connected,
    strikeNumber: 0,
    password: "",
  );

  static List<Ressource> _rentedRessources = [];

  ClientService({this.token});

  static void setUser(User newUser) {
    _user = newUser;
  }

  static User getUser() {
    return _user;
  }

  static List<Ressource> getRessources() {
    return _rentedRessources;
  }

  static void setRessources(List<Ressource> ressources) {
    _rentedRessources = ressources;
  }

  String? getToken() {
    return null;
  }

  // Utilité inconnue
  // bool saveInfo() {
  //   return false;
  // }
}