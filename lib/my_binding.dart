import 'package:get/get.dart';
import 'package:mie_ride_driver/controllers/profile_Controller.dart';


import 'controllers/home_controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
     Get.put(HomeController());
     Get.put(ProfileController());
  }
}