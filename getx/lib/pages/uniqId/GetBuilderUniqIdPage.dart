import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'GetBuilderUniqId.dart';

class GetxControllerlivePage extends StatelessWidget {
  final UniIdController uniIdController = Get.put(UniIdController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('生命周期演示'),
      ),
      body: Column(
        children: [
          GetBuilder<UniIdController>(
            builder: (controler) {
              return Text(
                'count is ${controler.count}',
                style: TextStyle(color: Colors.grey),
              );
            },
          ),
          GetBuilder<UniIdController>(
            id: 'change',
            builder: (controler) {
              return Text('count is ${controler.count}');
            },
          ),
          ElevatedButton(
              onPressed: () {
                uniIdController.increment();
              },
              child: Text('++'))
        ],
      ),
    );
  }
}
