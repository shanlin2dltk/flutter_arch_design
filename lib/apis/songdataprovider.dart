import 'package:flutter/material.dart';
import 'package:platform_design/models/song.dart';
import 'package:platform_design/utils/utils.dart';

class SongDataProvider {
  static const int _itemsLength = 50;

  List<MaterialColor> colors;
  List<String> songNames;

  Future<List<Song>> getSongsData() async {
    colors = getRandomColors(_itemsLength);
    songNames = getRandomNames(_itemsLength);

    return List<Song>.generate(_itemsLength, 
      (index) => _generateSong(index)
    );
  }

  Song _generateSong(int index){
    final MaterialColor color = colors.elementAt(index);
    final String name = songNames.elementAt(index);
    return Song(index, name, color);
  }
}