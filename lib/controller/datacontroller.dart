
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDataController extends GetxController {
  Rx<Color> _selectedColor = Colors.white.obs;

  Color get selectedColor => _selectedColor.value;

  void changeBackgroundColor(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'red':
        _selectedColor.value = Colors.red;
        break;
      case 'blue':
        _selectedColor.value = Colors.blue;
        break;
      case 'green':
        _selectedColor.value = Colors.green;
        break;
      case 'yellow':
        _selectedColor.value = Colors.yellow;
        break;
      case 'white':
        _selectedColor.value = Colors.white;
        break;
      default:
        _selectedColor.value = Colors.white;
    }
  }

  void changeRandomColor() {
    final List<Color> availableColors = [Colors.red, Colors.blue, Colors.green, Colors.yellow, Colors.white];
    Color randomColor;
    do {
      randomColor = availableColors[Random().nextInt(availableColors.length)];
    } while (randomColor == _selectedColor.value);
    _selectedColor.value = randomColor;
  }
}

