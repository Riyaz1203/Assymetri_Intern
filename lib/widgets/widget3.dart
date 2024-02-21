import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/datacontroller.dart';

class ThirdTab extends StatelessWidget {
  final List<Color> _availableColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.white
  ];

  ThirdTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Get.find<MyDataController>().selectedColor,
      child: Scaffold(
        body: Center(
          child: GetBuilder<MyDataController>(
            builder: (_) {
              Color randomColor;
              do {
                randomColor =
                    _availableColors[Random().nextInt(_availableColors.length)];
              } while (randomColor == _.selectedColor);
              return Container(
                width: double.infinity, // Take the full width of the parent
                height: double.infinity, // Take the full height of the parent
                color: randomColor,
                child: const Center(
                  child: Text(
                    'Widget 3',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
