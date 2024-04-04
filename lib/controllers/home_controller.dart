import 'package:get/get.dart';

class HomeController extends GetxController{

  var selectedIndex = 2.obs;

  var counter = 0.obs;

  void increment() => counter++;
  void decrement() {
    if (counter > 0) {
      counter--;
    }
  }
}