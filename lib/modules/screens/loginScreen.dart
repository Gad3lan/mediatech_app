import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mediatech_app/constants/types.dart';
import 'package:mediatech_app/core/ressource.dart';
import 'package:mediatech_app/core/role.dart';
import 'package:mediatech_app/core/user.dart';
import 'package:mediatech_app/modules/screens/homeScreen.dart';
import 'package:mediatech_app/utils/services/clientService.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String _errorMessage = "";

  @override
  Widget build(BuildContext context) {
    final String _loginMutation = """
      mutation userLogin(\$email: String!, \$password: String!) {
        login(email: \$email, password: \$password) {
          membership_id
          email
          name
          nb_strikes
          role
          rentals {
            ressource {
              title
              author
              editor
              edition_date
              cover
              resume
              type {type}
              genre {genre}
              cote
              quantity
            }
          }
        }
      }
    """;

    Role getRole(String roleStr) {
      Role role;
      switch (roleStr) {
        case 'not_connected':
          role = Role.not_connected;
          break;
        case 'connected':
          role = Role.connected;
          break;
        case 'manager':
          role = Role.manager;
          break;
        case 'admin':
          role = Role.admin;
          break;
        default:
          role = Role.not_connected;
          break;
      }
      return role;
    }

    List<Ressource> toList(ressources) {
      List<Ressource> parsedRessources = [];
      for (var elt in ressources) {
        parsedRessources.add(new Ressource(
            title: elt['ressource']['title'],
            author: elt['ressource']['author'],
            editor: elt['ressource']['editor'],
            publicationDate: DateTime.parse(elt['ressource']['edition_date']),
            cover: elt['ressource']['cover'],
            summary: elt['ressource']['resume'],
            type: elt['ressource']['type']['type'],
            genre: elt['ressource']['genre']['genre'],
            id: elt['ressource']['cote'],
            copies: elt['ressource']['quantity'],
            availability: elt['ressource']['quantity'] > 0)
        );
      }
      return parsedRessources;
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Connexion", style: Theme.of(context).textTheme.headline4,),
            const SizedBox(height: 15.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email",
              ),
            ),
            const SizedBox(height: 5.0,),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
              ),
            ),
            const SizedBox(height: 10.0,),
            Mutation(
              options: MutationOptions(
                  document: gql(_loginMutation),
                  onCompleted: (dynamic result) {
                    if (result != null) {
                      print(result);

                      String roleStr = "Role." + result['login']['membership_id'];
                      User user = new User(
                        name: result['login']['name'],
                        email: result['login']['email'],
                        membershipID: result['login']['membership_id'],
                        role: getRole(result['login']['role']),
                        strikeNumber: result['login']['nb_strikes'],
                        password: passwordController.text,
                      );
                      ClientService.setUser(user);
                      print(result['login']['rentals']);
                      ClientService.setRessources(toList(result['login']['rentals']));
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomeScreen(currentType: "Livre")),
                      );
                    } else {
                      setState(() {
                        _errorMessage = "Mauvaise combinaison email-mot de passe";
                      });
                      passwordController.text = "";
                    }
                  }
              ),
              builder: (RunMutation? runMutation, QueryResult? result) {
                if (result!.hasException) {
                  print(result.exception.toString());
                }
                return TextButton(
                    onPressed: () async {
                      print(emailController.text);
                      print(passwordController.text);

                      runMutation!({
                        'email': emailController.text,
                        'password': passwordController.text,
                      });
                    },
                    style: TextButton.styleFrom(backgroundColor: Colors.blue, primary: Colors.white),
                    child: Text("Se Connecter")
                );
              },
            ),
            Text(_errorMessage, style: TextStyle(color: Colors.red),)
          ],
        ),
      ),
    );
  }
}
