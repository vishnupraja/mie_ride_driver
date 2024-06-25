import 'package:get/get.dart';
import 'package:mie_ride_driver/controllers/auth_controller.dart';
import 'package:mie_ride_driver/controllers/profile_Controller.dart';
import 'package:mie_ride_driver/controllers/ride_controller.dart';
import 'controllers/home_controller.dart';
import 'controllers/permission_controller.dart';
import 'controllers/single_controller.dart';
import 'controllers/video_controller.dart';
import 'controllers/wallet_controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
     Get.put(HomeController());
     Get.put(SplashController());
     Get.put(ProfileController());
     Get.put(AuthController());
     Get.put(WalletController());
     Get.put(SingleController());
     Get.put(RideController());
     Get.put(PermissionController());
  }
}