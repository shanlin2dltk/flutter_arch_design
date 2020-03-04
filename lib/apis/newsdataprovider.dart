import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:platform_design/utils/utils.dart';
import 'package:platform_design/models/news.dart';

class NewsDataProvider {
  static const int _itemsLength = 20;
  final  List<Color> colors = getRandomColors(_itemsLength);
  final  List<String> titles = List.generate(_itemsLength, (index) => generateRandomHeadline());
  final  List<String> contents =
        List.generate(_itemsLength, (index) => lorem(paragraphs: 1, words: 24));

  Future<List<News>> getNewsData() async {
  
    return List<News>.generate(_itemsLength, 
      (index) => _generateNews(index));
  }

  News _generateNews(int index){
    final Color color = colors.elementAt(index);
    final String title = titles.elementAt(index);
    final String content = contents.elementAt(index);
    return News(title, content, color);
  }
}