import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/constant/colors.dart';
import 'package:mie_ride_driver/route_helper/Route_Helper.dart';
import 'package:mie_ride_driver/screens/ongoing_ride.dart';
import 'my_binding.dart';

String LANDING_IMAGE = "assets/landingImage.png";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "MieRide Driver",
      initialBinding: MyBinding(),
      theme: ThemeData(
        scaffoldBackgroundColor: TColors.background,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteHelper.getSplashRoute(),
      getPages: RouteHelper.route,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: TColors.background,
          ),
          home: Scaffold(
            body: Stack(
              children: [
                child!,
                FloatingWindow(),
              ],
            ),
          ),
        );
      },
    );

  }
}
