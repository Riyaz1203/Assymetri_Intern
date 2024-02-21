import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/datacontroller.dart';
import 'widgets/widget2.dart';
import 'widgets/widget3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.put(MyDataController());
      }),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Widget 1'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Widget 2'),
              Tab(text: 'Widget 3'),
            ],
          ),
        ),
        body: Column(
          children: [
            // Display selected color name from Widget 2
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
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              },
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
