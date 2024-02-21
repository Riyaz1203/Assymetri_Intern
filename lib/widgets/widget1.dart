import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/datacontroller.dart';
import 'widget2.dart';
import 'widget3.dart';

class Widget1 extends StatelessWidget {
  const Widget1({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Widget 1'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GetBuilder<MyDataController>(
              builder: (controller) {
                final colorNames = {
                  Colors.red: 'Red',
                  Colors.blue: 'Blue',
                  Colors.green: 'Green',
                  Colors.yellow: 'Yellow',
                  Colors.white: 'White',
                };
                final selectedColor = controller.selectedColor;
                final selectedColorName =
                    colorNames[selectedColor] ?? 'Unknown';

                return Container(
                  color: selectedColor,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  child: Text(
                    'Selected Color: $selectedColorName',
                    style: const TextStyle(color: Colors.black),
                  ),
                );
              },
            ),
            const SizedBox(
                height: 10), 
            const TabBar(
              tabs: [
                Tab(text: 'Widget 2'),
                Tab(text: 'Widget 3'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SecondTab(),
                  ThirdTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
