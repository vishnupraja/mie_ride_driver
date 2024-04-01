import 'package:get/get.dart';


import 'controllers/home_controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
     Get.put(HomeController());
  }
}