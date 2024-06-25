import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/constant/colors.dart';
import 'package:mie_ride_driver/constant/font_family.dart';
import 'package:mie_ride_driver/constant/sizes.dart';
import 'package:mie_ride_driver/controllers/permission_controller.dart';
import 'package:mie_ride_driver/main.dart';
import 'package:mie_ride_driver/route_helper/Route_Helper.dart';
import 'package:mie_ride_driver/utils/static.dart';
import '../../constant/text_strings.dart';
import '../../controllers/profile_Controller.dart';
import '../../myApp.dart';
import '../loader.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  MySharedPreferences sp = MySharedPreferences();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: TWidget.boxDecoration,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Image(image: AssetImage(LANDING_IMAGE),
                  height: MediaQuery.of(context).size.height/3,width: MediaQuery.of(context).size.width/2 ,),
              ),
            ),
            SizedBox(height: 40.0,),
            Text(TTexts.appName,
            style:FontsFamily.bropames.copyWith(
              color: TColors.textPrimary,
              fontSize: 40,
            ),
            ),
            Text(TTexts.appName2,
              style:FontsFamily.bropames.copyWith(
                color: TColors.buttonPrimary,
                fontSize: 35,
              ) ,
            ),
            SizedBox(height: 20,),
            Text(TTexts.earningText,
              textAlign: TextAlign.center,
              style: FontsFamily.Extralight.copyWith(
                color: TColors.textPrimary,
                fontSize: TSizes.fontSizeMd,
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: GestureDetector(
                onTap: (){
                  Get.toNamed(RouteHelper.getSignupPage());
                },
                child: Container(
                  decoration: TWidget.rShadow,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Center(
                      child: Text(TTexts.createAccountSmallText,
                        style:FontsFamily.ExtraBold.copyWith(
                          color: TColors.textPrimary,
                          fontSize: TSizes.fontSizeLg,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              child: GestureDetector(
                onTap: (){
                  Get.toNamed(RouteHelper.getLoginPage());
                },
                child: Container(
                  decoration: TWidget.rShadow,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Center(
                      child: Text(TTexts.loginText,
                        style:FontsFamily.ExtraBold.copyWith(
                          color: TColors.textPrimary,
                          fontSize: TSizes.fontSizeLg,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}

