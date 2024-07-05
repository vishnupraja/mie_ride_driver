import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/controllers/profile_Controller.dart';
import 'package:video_player/video_player.dart';

import '../../controllers/video_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Get.find<ProfileController>().fetchProfile();
    Get.find<SplashController>().videoPlay();
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayer(Get.find<SplashController>().playerController);
  }
}
