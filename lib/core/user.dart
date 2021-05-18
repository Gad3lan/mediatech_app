import 'package:flutter/material.dart';
import 'package:mediatech_app/core/role.dart';

class User {
  final String name;
  final String email;
  final String membershipID;
  final Role role;
  final int strikeNumber;

  User({
    required this.name,
    required this.email,
    required this.membershipID,
    required this.role,
    required this.strikeNumber,
  });
}