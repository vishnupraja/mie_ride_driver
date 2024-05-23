import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/constant/colors.dart';
import 'package:mie_ride_driver/constant/font_family.dart';
import 'package:mie_ride_driver/constant/sizes.dart';
import 'package:mie_ride_driver/constant/text_strings.dart';
import 'package:mie_ride_driver/controllers/single_controller.dart';
import 'package:mie_ride_driver/route_helper/Route_Helper.dart';
import 'package:mie_ride_driver/utils/static.dart';

import '../../constant/image_string/image_string.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric( vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Container(
                        height: Get.height / 4.5,
                        width: Get.width / 2.8,
                        decoration: TWidget.lShadow,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(HOME_HAND_IMAGE, height: 70, width: 70,),
                            SizedBox(height: TSizes.md,),
                            Text(TTexts.RevenueText,
                              textAlign: TextAlign.center,
                              style: FontsFamily.ExtraBold.copyWith(
                                color: TColors.textPrimary,
                                fontSize: TSizes.fontSizeMd,
                                letterSpacing: 1,
                              ),),
                            SizedBox(height: TSizes.md,),
                            Text("${TTexts.Currency} 100",
                              style: FontsFamily.ExtraBold.copyWith(
                                  color: TColors.buttonPrimary,
                                  fontSize: TSizes.fontSizeLg
                              ),)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: TSizes.lg,),
                    Flexible(
                      child: GestureDetector(
                        onTap: (){
                          Get.toNamed(RouteHelper.getRatingPage());
                        },
                        child: Container(
                          height: Get.height / 4.5,
                          width: Get.width / 2.8,
                          decoration: TWidget.lShadow,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(() {
                                return Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: TColors.background,
                                      borderRadius: TWidget.borderRadiusOnly,
                                      border: Border.all(
                                          color: TColors.buttonPrimary,
                                          width: 5
                                      ),
                                      boxShadow: TWidget.boxShadow
                                  ),
                                  child: Center(
                                    child: Text("${Get.find<SingleController>().ratingList.value!.overallRating}"),
                                  ),
                                );
                              }),
                              SizedBox(height: TSizes.md,),
                              Text(TTexts.DRattingText,
                                textAlign: TextAlign.center,
                                style: FontsFamily.ExtraBold.copyWith(
                                  color: TColors.textPrimary,
                                  fontSize: TSizes.fontSizeMd,
                                  letterSpacing: 1,
                                ),),
                              SizedBox(height: TSizes.md,),
                              RatingBarIndicator(
                                rating: double.parse(Get.find<SingleController>().ratingList.value!.overallRating),
                                itemBuilder: (context, index) =>
                                    Icon(
                                      Icons.star,
                                      color: TColors.buttonPrimary,
                                    ),
                                itemCount: 5,
                                itemSize: 20.0,
                                unratedColor: Colors.amber.withAlpha(50),
                                direction: Axis.horizontal,
                              ),
      
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  width: Get.width/1.1,
                  height: Get.height / 3.5,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/bgcontainer.png"),
                        fit: BoxFit.fill
                      )
                  ),
                  child: Center(
                    child: Text(TTexts.adText,
                      style: FontsFamily.ExtraBold.copyWith(
                          color: TColors.textSecondary,
                          fontSize: TSizes.fontSizeMd
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(
                              RouteHelper.getShareAvailabilityPage());
                        },
                        child: Container(
                          height: Get.height / 4.3,
                          width: Get.width / 2.2,
                          decoration: BoxDecoration(
                              color: Color(0xFFf7f7f7),
                              image: DecorationImage(image: AssetImage("assets/shareAvailability.png"),)
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.getShareRoutePage());
                        },
                        child: Container(

                          height: Get.height / 4.3,
                          width: Get.width / 2.2,
                          decoration: BoxDecoration(
                              color: Color(0xFFf7f7f7),
                            image: DecorationImage(image: AssetImage("assets/shareRought.png"))
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
