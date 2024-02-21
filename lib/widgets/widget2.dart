import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/datacontroller.dart';

class SecondTab extends StatefulWidget {
  SecondTab({Key? key}) : super(key: key);

  @override
  _SecondTabState createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget 2'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Enter color'),
              onChanged: (value) {
                setState(() {
                  // Pass the color name string to changeBackgroundColor method
                  Get.find<MyDataController>().changeBackgroundColor(value);
                });
              },
            ),
            SizedBox(height: 20),
            // Container that dynamically changes its background color based on input
            GetBuilder<MyDataController>(
              builder: (controller) {
                return Container(
                  width: 200,
                  height: 200,
                  color: _controller.text.isNotEmpty
                      ? controller.selectedColor
                      : Colors.transparent, // Show transparent color if input is empty
                  alignment: Alignment.center,
                  child: Text(
                    'Widget 2',
                    style: TextStyle(fontSize: 20),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
