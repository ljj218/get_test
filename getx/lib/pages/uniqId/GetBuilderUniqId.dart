import 'package:get/get.dart';

class UniIdController extends GetxController {
  int count = 0;

  void increment() async {
    count++;
    update(['change']);
  }
}
