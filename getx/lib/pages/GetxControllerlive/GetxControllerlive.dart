import 'package:get/get.dart';

class LiveController extends GetxController {
  int count = 0;

  void increment() async {
    await Future.delayed(Duration(milliseconds: 3000));
    count++;
    update();
  }

  void clearTask() {
    print('清除任务');
  }

  @override
  void onInit() {
    print('初始化');
    super.onInit();
  }

  @override
  void onReady() {
    print('准备完成');
    super.onReady();
  }

  @override
  void onClose() {
    print('控制器释放');
    super.onClose();
  }
}
