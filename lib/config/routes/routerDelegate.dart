import 'package:flutter/material.dart';
import 'package:mediatech_app/config/routes/pages/ressourceInfoPage.dart';
import 'package:mediatech_app/config/routes/routePath.dart';
import 'package:mediatech_app/core/ressource.dart';
import 'package:mediatech_app/modules/screens/homeScreen.dart';
import 'package:mediatech_app/widgets/unknownScreen.dart';

class RessourceRouterDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  Ressource _selectedRessource;
  bool show404 = false;

  Map<String, int>idList = {
    "123ABC": 0,
    "124ABC": 1,
    "125ABC": 2,
  };

  List<Ressource> ressources = [
    Ressource(
      title: "Lorem Ipsum Dolor Est",
      author: "Lorem Ipsum",
      editor: "Lorem",
      publicationDate: DateTime.now(),
      cover: "https://image.com",
      summary: "Lorem ipsum dolor est sit amet...",
      type: "Dolor",
      genre: "Amet",
      id: "123ABC",
      copies: 42,
      availability: true,
    ),
    Ressource(
      title: "Dolor Est Sit",
      author: "Ipsum Dolor",
      editor: "Ipsum",
      publicationDate: DateTime.now(),
      cover: "https://image.com",
      summary: "Lorem ipsum dolor est sit amet...",
      type: "Sit",
      genre: "Est",
      id: "124ABC",
      copies: 2,
      availability: true,
    ),
    Ressource(
      title: "Consectetur Adipiscing Elit",
      author: "Donec Pretium",
      editor: "Porttitor",
      publicationDate: DateTime.now(),
      cover: "https://image.com",
      summary: "Morbi tincidunt scelerisque libero, vel commodo...",
      type: "Donec",
      genre: "Sed",
      id: "125ABC",
      copies: 21,
      availability: false,
    ),
  ];

  RessourceRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  RoutePath get currentConfiguration {
    if (show404) {
      return RoutePath.unknown();
    }
    return _selectedRessource == null
        ? RoutePath.home()
        : RoutePath.ressource(_selectedRessource.id);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey('BooksListPage'),
          child: HomeScreen(),
        ),
        if (show404)
          MaterialPage(key: ValueKey('UnknownPage'), child: UnknownScreen())
        else if (_selectedRessource != null)
          RessourceInfoPage(ressource: _selectedRessource)
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        // Update the list of pages by setting _selectedBook to null
        _selectedRessource = null;
        show404 = false;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(RoutePath path) async {
    if (path.isUnknown) {
      _selectedRessource = null;
      show404 = true;
      return;
    }

    if (path.isRessourcePage) {
      if (path.id == '') {
        show404 = true;
        return;
      }

      _selectedRessource = ressources[idList[path.id]];
    } else {
      _selectedRessource = null;
    }

    show404 = false;
  }

  void _handleBookTapped(Ressource ressource) {
    _selectedRessource = ressource;
    notifyListeners();
  }
}