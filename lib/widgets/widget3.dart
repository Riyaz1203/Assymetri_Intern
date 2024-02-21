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
    return GestureDetector(
      onTap: () {
        Get.find<MyDataController>().changeRandomColor();
      },
      child: Container(
        color: Get.find<MyDataController>().selectedColor,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Widget 3'),
            centerTitle: true,
          ),
          body: Center(
            child: GetBuilder<MyDataController>(
              builder: (_) {
                Color randomColor;
                do {
                  randomColor = _availableColors[
                      Random().nextInt(_availableColors.length)];
                } while (randomColor == _.selectedColor);
                return Container(
                  width: 200,
                  height: 200,
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
      ),
    );
  }
}
