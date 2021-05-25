import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mediatech_app/core/ressource.dart';
import 'package:mediatech_app/core/role.dart';
import 'package:mediatech_app/core/user.dart';
import 'package:mediatech_app/utils/services/clientService.dart';

class RessourceInfoScreen extends StatelessWidget {
  final Ressource ressource;

  String _rentRessource = '''
    mutation borow(\$email: String!, \$password: String!, \$ressId: String!) {
      login(email: \$email, password: \$password) {
        name
      }
      borrow_ressource(cote: \$ressId) {
        ressource {
          title
          author
          editor
          edition_date
          cover
          resume
          type {
            type
          }
          genre {
            genre
          }
          cote
          quantity
        }
      }
    }
  ''';

  RessourceInfoScreen({required this.ressource});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ressource.title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.network(ressource.cover, height: 300, fit: BoxFit.fitHeight,)),
            const SizedBox(height: 20,),
            Text(ressource.title, style: Theme.of(context).textTheme.headline6,),
            Text(ressource.author, style: Theme.of(context).textTheme.subtitle1,),
            Text(ressource.editor, style: Theme.of(context).textTheme.subtitle1,),
            Text(ressource.publicationDate.year.toString(), style: Theme.of(context).textTheme.subtitle1,),
            const SizedBox(height: 10,),
            Text(ressource.type + ", " + ressource.genre, style: Theme.of(context).textTheme.subtitle1,),
            Text("Nombre d'exemplaires: " + ressource.copies.toString(), style: Theme.of(context).textTheme.subtitle1,),
            Text(ressource.availability ? "Disponible" : "Pas disponible", style: Theme.of(context).textTheme.subtitle2,),
            if (ClientService.getUser().role != Role.not_connected)
              Mutation(
                options: MutationOptions(
                  document: gql(_rentRessource),
                  onCompleted: (dynamic result) {
                    if (result != null) {
                      print("Result: ");
                      print(result['borrow_ressource']['ressource']);
                      print(result['borrow_ressource']['ressource']['title']);
                      var rented = result['borrow_ressource']['ressource'];
                      List<Ressource> rentedRessources = ClientService.getRessources();
                      rentedRessources.add(new Ressource(
                          title: rented['title'],
                          author: rented['author'],
                          editor: rented['editor'],
                          publicationDate: DateTime.parse(rented['edition_date']),
                          cover: rented['cover'],
                          summary: rented['resume'],
                          type: rented['type']['type'],
                          genre: rented['genre']['genre'],
                          id: rented['cote'],
                          copies: rented['quantity'],
                          availability: rented['quantity'] > 0
                      ));
                      ClientService.setRessources(rentedRessources);
                    }
                  },
                ),
                builder: (RunMutation? runMutation, QueryResult? result) {
                  User user = ClientService.getUser();
                  if (result!.hasException) {
                    print(result.exception.toString());
                  }
                  return TextButton(
                      onPressed: () async {
                        runMutation!({
                          'email': user.email,
                          'password': user.password,
                          'ressId': ressource.id,
                        });
                      },
                      style: TextButton.styleFrom(backgroundColor: Colors.blue, primary: Colors.white),
                      child: Text("Louer")
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}

