import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/constant/colors.dart';
import 'package:mie_ride_driver/constant/font_family.dart';
import 'package:mie_ride_driver/constant/sizes.dart';
import 'package:mie_ride_driver/route_helper/Route_Helper.dart';


import '../../constant/image_string/image_string.dart';
import '../../constant/text_strings.dart';
import '../bottom_screen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: Colors.black.withOpacity(0.1)
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset(LANDING_IMAGE,height: height/3,width: width/1.7 ,),
              ),
            ),
            SizedBox(height: 30.0,),
            Text(TTexts.appName,
            style:FontsFamily.bropames.copyWith(
              color: TColors.textPrimary,
              fontSize: 40,
            ) ,
            ),
            Text(TTexts.appName2,
              style:FontsFamily.bropames.copyWith(
                color: TColors.info,
                fontSize: 40,
              ) ,
            ),
            SizedBox(height: 20,),
            Text(TTexts.earningText,
              textAlign: TextAlign.center,
              style: FontsFamily.Extralight.copyWith(
                color: TColors.textPrimary,
                fontSize: TSizes.fontSizeMd,
              ) ,
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: InkWell(
                onTap: (){
                  Get.toNamed(RouteHelper.getSignupPage());
                },
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: Text(TTexts.createAccountSmallText,
                        style:FontsFamily.ExtraBold.copyWith(
                          color: TColors.textPrimary,
                          fontSize: TSizes.fontSizeSm,
                        ) ,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (builder) => BottomNavigationBarWithCards()));
                },
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: Text(TTexts.loginText,
                        style:FontsFamily.ExtraBold.copyWith(
                          color: TColors.textPrimary,
                          fontSize: TSizes.fontSizeSm,
                        ) ,
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

