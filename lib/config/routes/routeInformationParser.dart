import 'package:flutter/material.dart';
import 'package:mediatech_app/config/routes/routePath.dart';

class RessourceRouteInformationParser extends RouteInformationParser<RoutePath> {
  @override
  Future<RoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);
    // Handle '/'
    if (uri.pathSegments.length == 0) {
      return RoutePath.home();
    }

    // Handle '/book/:id'
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] != 'book') return RoutePath.unknown();
      var remaining = uri.pathSegments[1];
      if (remaining == null || remaining == '') return RoutePath.unknown();
      return RoutePath.ressource(remaining);
    }

    // Handle unknown routes
    return RoutePath.unknown();
  }

  @override
  RouteInformation restoreRouteInformation(RoutePath path) {
    if (path.isUnknown) {
      return RouteInformation(location: '/404');
    }
    if (path.isHomePage) {
      return RouteInformation(location: '/');
    }
    if (path.isRessourcePage) {
      return RouteInformation(location: '/ressource/${path.id}');
    }
    return null;
  }
}