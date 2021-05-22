import 'package:mediatech_app/core/role.dart';

class UserQuery {
  final String? name;
  final String? email;
  final String? membershipID;
  final Role? role;
  final int? strikeNumber;

  UserQuery({
    this.name,
    this.email,
    this.membershipID,
    this.role,
    this.strikeNumber,
  });
}