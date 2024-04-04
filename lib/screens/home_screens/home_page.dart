import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/constant/colors.dart';
import 'package:mie_ride_driver/constant/font_family.dart';
import 'package:mie_ride_driver/constant/sizes.dart';
import 'package:mie_ride_driver/constant/text_strings.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(
                      height: Get.height/4,
                      width: Get.width/2.5,
                      decoration: TWidget.bShadow,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(HOME_HAND_IMAGE,height: 70,width: 70,),
                          SizedBox(height:TSizes.md,),
                          Text(TTexts.RevenueText,
                          textAlign: TextAlign.center,
                          style: FontsFamily.ExtraBold.copyWith(
                            color: TColors.textPrimary,
                            fontSize: TSizes.fontSizeMd,
                            letterSpacing: 1,
                          ),),
                          SizedBox(height:TSizes.md,),
                          Text("${TTexts.Currency} 100",
                            style: FontsFamily.ExtraBold.copyWith(
                                color: TColors.buttonPrimary,
                                fontSize: TSizes.fontSizeLg
                            ),)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: TSizes.md,),
                  Flexible(
                    child: Container(
                      height: Get.height/4,
                      width: Get.width/2.5,
                      decoration: TWidget.bShadow,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                color: TColors.background,
                                borderRadius: TWidget.borderRadiusOnly,
                                border: Border.all(
                                    color: TColors.buttonPrimary,
                                  width: 5
                                ),
                                boxShadow:TWidget.boxShadow
                            ),
                            child: Center(
                              child: Text("4.5"),
                            ),
                          ),
                          SizedBox(height:TSizes.md,),
                          Text(TTexts.DRattingText,
                            textAlign: TextAlign.center,
                            style: FontsFamily.ExtraBold.copyWith(
                              color: TColors.textPrimary,
                              fontSize: TSizes.fontSizeMd,
                              letterSpacing: 1,
                            ),),
                          SizedBox(height:TSizes.md,),
                          RatingBarIndicator(
                            rating: 4.5,
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: TColors.buttonPrimary,
                            ),
                            itemCount: 5,
                            itemSize: 20.0,
                            unratedColor: Colors.amber.withAlpha(50),
                            direction:  Axis.horizontal,
                          ),
        
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: TSizes.lg,),
              Container(
                width: double.infinity,
                height: Get.height/4.5,
                decoration: TWidget.bShadow,
                child: Center(
                  child: Text(TTexts.adText,
                  style: FontsFamily.ExtraBold.copyWith(
                    color: TColors.textSecondary,
                    fontSize: TSizes.fontSizeMd
                  ),
                  ),
                ),
              ),
              SizedBox(height: TSizes.lg,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(
                      height: Get.height/4,
                      width: Get.width/2.5,
                      decoration: TWidget.bShadow,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                color: TColors.background,
                                borderRadius: TWidget.borderRadiusOnly,
                                border: Border.all(
                                    color: TColors.buttonPrimary,
                                    width: 5
                                ),
                                boxShadow:TWidget.boxShadow
                            ),
                            child: Center(
                              child: Icon(Icons.check_circle,color: TColors.buttonPrimary,),
                            ),
                          ),
                          SizedBox(height:TSizes.sm,),
                          Text(TTexts.AvailabilityText,
                            textAlign: TextAlign.center,
                            style: FontsFamily.ExtraBold.copyWith(
                              color: TColors.textPrimary,
                              fontSize: TSizes.fontSizeMd,
                              letterSpacing: 1,
                            ),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: TSizes.md,),
                  Flexible(
                    child: InkWell(
                      onTap: (){
                        Get.toNamed(RouteHelper.getShareRoutePage());
                      },
                      child: Container(
                        height: Get.height/4,
                        width: Get.width/2.5,
                        decoration: TWidget.bShadow,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: TColors.background,
                                  borderRadius: TWidget.borderRadiusOnly,
                                  border: Border.all(
                                      color: TColors.buttonPrimary,
                                      width: 5
                                  ),
                                  boxShadow:TWidget.boxShadow
                              ),
                              child: Center(
                                child: Icon(Icons.check_circle,color: TColors.buttonPrimary,),
                              ),
                            ),
                            SizedBox(height:TSizes.md,),
                            Text(TTexts.RouteText,
                              textAlign: TextAlign.center,
                              style: FontsFamily.ExtraBold.copyWith(
                                color: TColors.textPrimary,
                                fontSize: TSizes.fontSizeMd,
                                letterSpacing: 1,
                              ),),
                          ],
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
    );
  }
}
