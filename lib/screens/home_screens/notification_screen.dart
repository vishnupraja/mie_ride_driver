import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/controllers/single_controller.dart';

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
  final controller = Get.find<SingleController>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,(){
      controller.notification();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              customAppbar(TTexts.notification),
              SizedBox(height: 20,),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 20),
                  scrollDirection: Axis.vertical,
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.notificationList.length,
                  itemBuilder: (context, index) {
                    var list = controller.notificationList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        padding: EdgeInsets.only(bottom: 10),
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: TColors.background,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: TColors.background),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(2, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 20, top: 5.0),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: TColors.background,
                                    borderRadius: TWidget.borderRadiusOnly,
                                    boxShadow: TWidget.boxShadow,
                                  ),
                                  child: Center(
                                    child: Icon(
                                        Icons.clear, color: TColors.info,size: 15,),
                                  ),
                                ),
                              ),
                            ),
                            ListTile(
                              leading: Container(
                                height: 40,
                                width: 40,
                                decoration: TWidget.rShadow,
                                child: Center(
                                  child: Icon(
                                      Icons.check_circle, color: TColors.info),
                                ),
                              ),
                              title: Text(
                                list.title,
                                style: FontsFamily.ExtraBold.copyWith(
                                  color:  list.title == "Ride complete"
                                      ? TColors.rideCompleteColor
                                      : list.title == "Driver started ride"
                                      ?  TColors.info
                                      : list.title == "Driver is arriving"
                                      ?  TColors.rideArriveColor
                                      : list.title == "New Booking Request"?
                                        Colors.red:TColors.acceptColor,
                                  fontSize: 12,
                                ),
                              ),
                              subtitle: Text(
                                list.message,
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
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Image.asset(calenderImage, height: 20,
                                          width: 20,
                                          color: TColors.info,),
                                        SizedBox(width: 5.0,),
                                        Text(
                                          list.date,
                                          style: FontsFamily.ExtraBold.copyWith(
                                            color: TColors.textPrimary,
                                            fontSize: TSizes.fontSizeSm,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.0,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center,
                                      children: [
                                        Image.asset(timeImage, height: 20,
                                          width: 20,
                                          color: TColors.info,),
                                        SizedBox(width: 10),
                                        Text(
                                          list.time,
                                          style: FontsFamily.ExtraBold.copyWith(
                                            color: TColors.textPrimary,
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
    });
  }
}
