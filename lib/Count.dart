import 'package:get/get.dart';

class MainScreenController extends GetxController {

  RxInt value = 1.obs;


  void add() {
    value.value++;
  }

  void subtract() {
    if (value.value > 0) {
      value.value--;
    }
  }
}