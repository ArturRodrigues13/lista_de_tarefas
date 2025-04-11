import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeSettings {
  static final List colorOptions = [
    [Colors.amber,Colors.black],
    [Colors.pink,Colors.white],
    [Colors.red,Colors.white],
    [Colors.blue,Colors.white],
    [Colors.green,Colors.white],
    [Colors.deepPurple,Colors.white],
    [Colors.orange,Colors.white],
    [Colors.teal,Colors.white],
  ];

  static MaterialColor getThemeColor() {
    final savedColorIndex = Hive.box('Minha Caixa').get('themeColor', defaultValue: 0);
    return colorOptions[savedColorIndex][0];
  }

  static Color getSecondaryColor() {
    final savedColorIndex = Hive.box('Minha Caixa').get('themeColor', defaultValue: 0);
    return colorOptions[savedColorIndex][1];
  }

  static void saveThemeColor(int index) {
    Hive.box('Minha Caixa').put('themeColor', index);
  }

  // Retorna a cor primária (500)
  static Color get primaryColor => getThemeColor();

  // Retorna a cor mais clara (200)
  static Color get lightColor => getThemeColor()[200]!;

  // Retorna a cor mais escura (700)
  static Color get darkColor => getThemeColor()[700]!;

  // Retorna uma cor com opacidade reduzida (para fundos)
  static Color get fadedColor => getThemeColor().withOpacity(0.6);

}
