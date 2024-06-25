import 'dart:async';

import 'package:get/get.dart';
import 'package:mie_ride_driver/controllers/permission_controller.dart';
import 'package:video_player/video_player.dart';

import '../route_helper/Route_Helper.dart';
import '../utils/static.dart';

class SplashController extends GetxController {

  var loader=false.obs;


  VideoPlayerController? _controller;
  VideoPlayerController get playerController=>_controller!;

  MySharedPreferences sp = MySharedPreferences();

  @override
  void onInit() {
    super.onInit();
    initVideo();
  }

  Future<void> initVideo()async{

    _controller = VideoPlayerController.asset("assets/splash.mp4");
   _controller!.initialize().then((value) {
     update();
   });
  }

  void videoPlay(){
    Get.find<PermissionController>().permissionHandle();
    Get.find<PermissionController>().handleLocationPermission();
    _controller!.play();
    update();
      Future.delayed(Duration(seconds: 5), () async {
        if (await sp.getBoolValue(sp.Login_key) != true) {
          Get.offAllNamed(RouteHelper.getLandingPage());
        } else {
          Get.offAllNamed(RouteHelper.getBottomPage());
        }
      });





  }
  void videoStop(){

  }

}