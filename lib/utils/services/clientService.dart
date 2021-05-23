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
  );

  static List<Ressource> _rentedRessources = [
    Ressource(
        title: "Gathering Darkness",
        author: "Morgan Rhodes, Michelle Rowen",
        editor: "Tree House",
        publicationDate: new DateTime(2014),
        cover: "https://images.gr-assets.com/books/1419103977m/17342700.jpg",
        summary: "Bursa Cursuss assimilant! Tabes velox bulla est. "
            "Urbss manducare, tanquam camerarius bulla.",
        type: "Book",
        genre: "Fantasy",
        id: "ABS241",
        copies: 2,
        availability: false
    ),
    Ressource(
        title: "The Readers of Broken Wheel Recommend",
        author: "Katarina Bivald, Alice Menzies",
        editor: "Tree House",
        publicationDate: new DateTime(2013),
        cover: "https://images.gr-assets.com/books/1452107441m/25573977.jpg",
        summary: "Going to the great unknown doesn’t acquire history anymore "
            "than loving creates holographic relativity.",
        type: "Book",
        genre: "Biography",
        id: "TEP467",
        copies: 3,
        availability: true
    ),
    Ressource(
        title: "The Art Forger",
        author: "B.A. Shapiro",
        editor: "Blue library",
        publicationDate: new DateTime(2012),
        cover: "https://images.gr-assets.com/books/1348518546m/14568987.jpg",
        summary: "The grog commands with life, desire the pacific ocean "
            "before it laughs.",
        type: "Book",
        genre: "Mystery",
        id: "ETG345",
        copies: 0,
        availability: false
    ),
    Ressource(
        title: "How the Grinch Stole Christmas!",
        author: "Tracey Bond",
        editor: "Lovely comics",
        publicationDate: new DateTime(1957),
        cover: "https://images.gr-assets.com/books/1327958149m/113946.jpg",
        summary: "For a bitter iced cheesecake, add some rum and curry.",
        type: "Comic",
        genre: "Humor",
        id: "OHK351",
        copies: 4,
        availability: true
    ),
  ];

  ClientService({this.token});

  static void setUser(User newUser) {
    _user = newUser;
  }

  static User getUser() {
    return _user;
  }

  static List<Ressource>? getRessources() {
    return _rentedRessources;
  }

  String? getToken() {
    return null;
  }

  // Utilité inconnue
  // bool saveInfo() {
  //   return false;
  // }
}