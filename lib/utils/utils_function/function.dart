
import 'dart:ui';

import '../../models/level_models.dart';
LevelModel getLevelFromString(String level){
  switch(level){
    case 'easy':
    {
      return LevelModel.easy;
    }
    case 'hard':
      {
        return LevelModel.hard;
      }
    default:
    {
      return LevelModel.medium;
    }
  }
}

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}