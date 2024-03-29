import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/constant/colors.dart';
import 'package:mie_ride_driver/route_helper/Route_Helper.dart';

import 'my_binding.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "MieRide Driver",
      initialBinding: MyBinding(),
      theme: ThemeData(
        scaffoldBackgroundColor: TColors.background,
        cardTheme: CardTheme(
          color: TColors.background
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteHelper.getLandingPage(),
      getPages: RouteHelper.route,
    );
  }
}