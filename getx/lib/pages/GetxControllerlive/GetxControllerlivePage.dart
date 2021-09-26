import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'GetxControllerlive.dart';

class GetxControllerlivePage extends StatelessWidget {
  final LiveController liveController = Get.put(LiveController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('生命周期演示'),
      ),
      body: Column(
        children: [
          GetBuilder<LiveController>(
              initState: (data) => liveController.increment(),
              dispose: (_) => liveController.clearTask(),
              builder: (controler) {
                return Text('count is ${controler.count}');
              })
        ],
      ),
    );
  }
}
