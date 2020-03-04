import 'package:flutter/material.dart';

class Song {
  final int id;
  final String name;
  final MaterialColor color;

  Song(this.id, this.name, this.color);

  List<Object> get props => [id, name, color];
}