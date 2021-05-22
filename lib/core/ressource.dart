import 'package:flutter/material.dart';

class Ressource {
  final String title;
  final String author;
  final String editor;
  final DateTime publicationDate;
  final String cover;
  final String summary;
  final String type;
  final String genre;
  final String id;
  final int copies;
  final bool availability;

  Ressource({
    required this.title,
    required this.author,
    required this.editor,
    required this.publicationDate,
    required this.cover,
    required this.summary,
    required this.type,
    required this.genre,
    required this.id,
    required this.copies,
    required this.availability,
  });
}