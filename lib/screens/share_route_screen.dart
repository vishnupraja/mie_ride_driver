import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/controllers/home_controller.dart';

import '../constant/colors.dart';
import '../constant/font_family.dart';
import '../constant/image_string/image_string.dart';
import '../constant/sizes.dart';
import '../constant/text_strings.dart';
import '../utils/static.dart';

class ShareRouteScreen extends StatefulWidget {
  const ShareRouteScreen({super.key});

  @override
  State<ShareRouteScreen> createState() => _ShareRouteScreenState();
}

class _ShareRouteScreenState extends State<ShareRouteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          children: [
            customAppbar(TTexts.ShareRouteText),
            SizedBox(height: TSizes.xl,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              width: Get.width,
              decoration: TWidget.rShadow,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    decoration: TWidget.rShadow,
                    child: Row(
                      children: [
                        Text(TTexts.StartPointText,
                          style: FontsFamily.ExtraBold.copyWith(
                              color: TColors.textSecondary,
                              fontSize: TSizes.fontSizeMd
                          ),),
                        SizedBox(width: 20,),
                        Expanded(
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Image.asset(flagImage, height: 20,
                                  width: 20,
                                  color: TColors.textPrimary)
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    decoration: TWidget.rShadow,
                    child: Row(
                      children: [
                        Text(TTexts.EndPointText,
                          style: FontsFamily.ExtraBold.copyWith(
                              color: TColors.textSecondary,
                              fontSize: TSizes.fontSizeMd
                          ),),
                        SizedBox(width: 20,),
                        Expanded(
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Image.asset(
                                endpointImage, height: 20, width: 20,)
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.symmetric(vertical: 20),
              width: Get.width,
              decoration: TWidget.rShadow,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Obx(() {
                          return GestureDetector(
                            onTap: () {
                              Get
                                  .find<HomeController>()
                                  .startTime
                                  .value = "Start time";
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 20, right: 10),
                              height: 20,
                              width: 20,
                              decoration: TWidget.rShadow,
                              child: Center(
                                child: Icon(
                                  Icons.check_circle, color: Get
                                    .find<HomeController>()
                                    .startTime
                                    .value == "Start time" ? TColors
                                    .rideCompleteColor : TColors.textPrimary,
                                  size: 15,),
                              ),
                            ),
                          );
                        }),
                        GestureDetector(
                          onTap: () {
                            Get
                                .find<HomeController>()
                                .startTime
                                .value = "Start time";
                          },
                          child: Container(
                            height: 40,
                            width: 120,
                            decoration: TWidget.rShadow,
                            child: Center(
                              child: Text(TTexts.StartTimeText,
                                style: FontsFamily.ExtraBold.copyWith(
                                    color: TColors.textPrimary,
                                    fontSize: TSizes.fontSizeMd
                                ),),
                            ),
                          ),
                        ),
                        SizedBox(width: 30,),
                        Obx(() {
                          return GestureDetector(
                            onTap: () {
                              Get
                                  .find<HomeController>()
                                  .startTime
                                  .value = "Reach time";
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 20,),
                              height: 20,
                              width: 20,
                              decoration: TWidget.rShadow,
                              child: Center(
                                child: Icon(
                                  Icons.check_circle, color: Get
                                    .find<HomeController>()
                                    .startTime
                                    .value == "Reach time" ? TColors
                                    .rideCompleteColor : TColors.textPrimary,
                                  size: 15,),
                              ),
                            ),
                          );
                        }),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                Get
                                    .find<HomeController>()
                                    .startTime
                                    .value = "Reach time";
                              },
                              child: Container(
                                height: 40,
                                width: 120,
                                decoration: TWidget.rShadow,
                                child: Center(
                                  child: Text(TTexts.ReachTimeText,
                                    style: FontsFamily.ExtraBold.copyWith(
                                        color: TColors.textPrimary,
                                        fontSize: TSizes.fontSizeMd
                                    ),),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    decoration: TWidget.rShadow,
                    child: Row(
                      children: [
                        Text(TTexts.SelectTimeText,
                          style: FontsFamily.ExtraBold.copyWith(
                              color: TColors.textSecondary,
                              fontSize: TSizes.fontSizeMd
                          ),),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    decoration: TWidget.rShadow,
                    child: Row(
                      children: [
                        Text(TTexts.SelectDateText,
                          style: FontsFamily.ExtraBold.copyWith(
                              color: TColors.textSecondary,
                              fontSize: TSizes.fontSizeMd
                          ),),
                        SizedBox(width: 20,),
                        Expanded(
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Image.asset(calenderImage, height: 20,
                                width: 20,
                                color: TColors.textPrimary,)
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: TWidget.rShadow,
                  child: Center(
                    child: Text(TTexts.SeatsAvailableText,
                      style: FontsFamily.ExtraBold.copyWith(
                          color: TColors.textPrimary,
                          fontSize: TSizes.fontSizeMd
                      ),),
                  ),
                ),
                SizedBox(width: 20,),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.find<HomeController>().decrement();
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 20),
                        height: 40,
                        width: 40,
                        decoration: TWidget.rShadow,
                        child: Center(
                          child: Icon(
                            Icons.remove,
                            color: TColors.textPrimary, size: 15,),
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: TWidget.rShadow,
                      child: Center(
                        child: Obx(() {
                          return Text(Get
                              .find<HomeController>()
                              .counter
                              .toString(),
                            style: FontsFamily.ExtraBold.copyWith(
                                color: TColors.textPrimary,
                                fontSize: TSizes.fontSizeMd
                            ),);
                        }),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.find<HomeController>().increment();
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20, right: 10),
                        height: 40,
                        width: 40,
                        decoration: TWidget.rShadow,
                        child: Center(
                          child: Icon(
                            Icons.add, color: TColors.textPrimary, size: 15,),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 50, vertical: 40),
              child: CustomButton(TTexts.SubmitText, BUTTON_IMAGE, () {
                /* Get.offNamed(RouteHelper.getBottomPage());*/
              }),
            )
          ],
        ),
      ),
    );
  }
}
