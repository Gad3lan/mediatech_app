class RoutePath {
  final String id;
  final bool isUnknown;

  RoutePath.home()
      : id = null,
        isUnknown = false;

  RoutePath.ressource(this.id) : isUnknown = false;

  RoutePath.unknown()
      : id = null,
        isUnknown = true;

  bool get isHomePage => id == null;

  bool get isRessourcePage => id != null;
}