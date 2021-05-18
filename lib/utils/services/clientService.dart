import 'package:mediatech_app/core/ressource.dart';
import 'package:mediatech_app/core/user.dart';

class ClientService {
  final String token;
  final User user;

  const ClientService();
  const ClientService({required this.token, required this.user});

  User? getUser() {
    return user;
  }

  List<Ressource>? getRessources() {
    return null;
  }

  String? getToken() {
    return null;
  }

  // Utilité inconnue
  // bool saveInfo() {
  //   return false;
  // }
}