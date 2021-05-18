import 'package:mediatech_app/core/ressource.dart';
import 'package:mediatech_app/core/user.dart';
import 'package:mediatech_app/utils/queries/ressourceQuery.dart';
import 'package:mediatech_app/utils/queries/userQuery.dart';

class DBService {
  List<User>? getUsers(UserQuery query) {
    return null;
  }

  List<Ressource>? getRessources(RessourceQuery query) {
    return null;
  }

  bool updateUser(User user) {
    return false;
  }

  bool updateRessource(Ressource ressource) {
    return false;
  }

  bool reserve(Ressource ressource) {
    return false;
  }

  User? getMe() {
    return null;
  }

  String? getLibraryInfo() {
    return null;
  }

  List<Ressource>? getRecommendations() {
    return null;
  }

  List<Ressource>? getMyRessources() {
    return null;
  }

  bool strike(User user) {
    return false;
  }

  List<String>? getRessourcesTypes() {
    return null;
  }

  bool addRessourceType() {
    return false;
  }

  bool deleteRessourceType() {
    return false;
  }

  List<String>? getRessourcesGenres() {
    return null;
  }

  bool addRessourceGenre() {
    return false;
  }

  bool deleteRessourceGenre() {
    return false;
  }
}