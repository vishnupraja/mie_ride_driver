import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/colors.dart';
import '../../constant/font_family.dart';
import '../../constant/image_string/image_string.dart';
import '../../constant/sizes.dart';
import '../../constant/text_strings.dart';
import '../../utils/static.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Align(
              alignment: Alignment.topCenter,
              child: Text(TTexts.notification,
                style: FontsFamily.ExtraBold.copyWith(
                    color: TColors.textPrimary,
                    fontSize: 25,
                    letterSpacing: 5
                ),
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: 50),
                scrollDirection: Axis.vertical,
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      padding: EdgeInsets.only(bottom: 10),
                      width: Get.width,
                      decoration: TWidget.bShadow,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10,top: 5.0),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: TColors.background,
                                  borderRadius: TWidget.borderRadiusOnly,
                                  boxShadow: TWidget.boxShadow,
                                ),
                                child: Center(
                                  child: Icon(Icons.clear, color: TColors.info),
                                ),
                              ),
                            ),
                          ),
                          ListTile(
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: TColors.background,
                                borderRadius: TWidget.borderRadiusOnly,
                                boxShadow: TWidget.boxShadow,
                              ),
                              child: Center(
                                child: Icon(Icons.check_circle, color: TColors.info),
                              ),
                            ),
                            title: Text(
                              TTexts.RideCompleteText,
                              style: FontsFamily.ExtraBold.copyWith(
                                color: TColors.rideCompleteColor,
                                fontSize: TSizes.fontSizeLg,
                              ),
                            ),
                            subtitle: Text(
                              TTexts.sRideCompleteText,
                              style: FontsFamily.ExtraBold.copyWith(
                                color: TColors.textPrimary,
                                fontSize: TSizes.fontSizeSm,
                              ),
                            ),
                            trailing: SizedBox( // Wrap the trailing widget with SizedBox
                              width: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(calenderImage, height: 20, width: 20),
                                      SizedBox(width: 5.0,),
                                      Text(
                                        "2023/12/13",
                                        style: FontsFamily.ExtraBold.copyWith(
                                          color: TColors.info,
                                          fontSize: TSizes.fontSizeSm,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.0,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(timeImage, height: 20, width: 20),
                                      SizedBox(width: 10),
                                      Text(
                                        "4:30 PM",
                                        style: FontsFamily.ExtraBold.copyWith(
                                          color: TColors.info,
                                          fontSize: TSizes.fontSizeSm,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },),
            )

          ],
        ),
      ),
    );
  }
}
