/*
 * @Author: dragon
 * @Date: 2021-09-26 15:55:04
 * @LastEditTime: 2021-09-26 16:52:11
 * @LastEditors: dragon
 * @Description: 
 * @FilePath: \getx\lib\Other.dart
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controller2.dart';

class Other extends StatelessWidget {
  //第一种
  final Controller2 c = Get.put(Controller2());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('三生三世十里桃花'),
        ),
        body: Column(
          children: [
            //第一种
            // Obx(() => Text('${c.teacher.name}')),
            // 第二种
            // GetX<Controller2>(
            //     init: Controller2(),
            //     builder: (controler) {
            //       return Text('${c.teacher.value.name}');
            //     }),
            // 第三种
            GetBuilder<Controller2>(
                init: Controller2(),
                builder: (controller) {
                  return Text('${c.teacher.name}');
                }),
            ElevatedButton(
                onPressed: () {
                  c.convertToUpperCase();

                  //查找
                  // Get.find<Controller2>().convertToUpperCase();
                },
                child: Text('UpperCase'))
          ],
        ),
      ),
    );
  }
}
