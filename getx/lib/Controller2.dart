/*
 * @Author: dragon
 * @Date: 2021-09-26 15:55:38
 * @LastEditTime: 2021-09-26 16:31:26
 * @LastEditors: dragon
 * @Description: 
 * @FilePath: \getx\lib\Controller2.dart
 */
import 'package:get/get.dart';

class Controller2 extends GetxController {
  // 第一种
  var teacher = Teacher();

  void convertToUpperCase() {
    teacher.name.value = teacher.name.value.toUpperCase();
  }

  // 第二种
  // var teacher = Teacher(name: "Jimi", age: 13).obs;

  // void convertToUpperCase() {
  // //所以，如果我们改变其中的一些变量：
  // teacher.value.name = 'Roi';
  // //小部件不会重建！
  // //对于自定义类，我们需要手动 "通知 "改变。
  // user.refresh();
  //   teacher.update((val) {
  //     teacher.value.name = teacher.value.name.toString().toUpperCase();
  //   });
  // }

  // 第三种
  // var teacher = Teacher();
  // void convertToUpperCase() {
  //   teacher.name.value = teacher.name.value.toUpperCase();
  //   update();
  // }
}

class Teacher {
  var name = "jimi".obs;
  var age = 18.obs;

  // 构造函数创建
  // late String name;
  // late int age;
  // Teacher({this.name, this.age});
}
