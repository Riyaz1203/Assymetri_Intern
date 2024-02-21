import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/datacontroller.dart';

class SecondTab extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  SecondTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyDataController>(
      builder: (controller) {
        return Scaffold(
          body: Container(
            color: _controller.text.isNotEmpty
                ? controller.selectedColor
                : Colors.transparent,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                        labelText: 'Enter color',
                        labelStyle:
                            TextStyle(fontSize: 20, color: Colors.black)),
                    onChanged: (value) {
                      Get.find<MyDataController>().changeBackgroundColor(value);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
