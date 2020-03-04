import 'package:flutter/material.dart';

class News {
  final String title;
  final String content;
  final Color color;

  News(this.title, this.content, this.color);

  List<Object> get props => [title, content, color];

}