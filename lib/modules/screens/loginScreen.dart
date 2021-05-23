import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
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

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Connexion"),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email",
              ),
            ),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
              ),
            ),
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
                      );
                      ClientService.setUser(user);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomeScreen()),
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
                    child: Text("Connexion")
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
