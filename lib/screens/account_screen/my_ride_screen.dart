import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/colors.dart';
import '../../constant/font_family.dart';
import '../../constant/image_string/image_string.dart';
import '../../constant/sizes.dart';
import '../../constant/text_strings.dart';
import '../../controllers/ride_controller.dart';
import '../../utils/static.dart';

class MyRideScreen extends StatefulWidget {
  const MyRideScreen({super.key});

  @override
  State<MyRideScreen> createState() => _MyRideScreenState();
}

class _MyRideScreenState extends State<MyRideScreen> {

  final controller = Get.find<RideController>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,(){
      controller.fetchMieRideEarning();
      controller.driverHistory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            children: [
              customAppbar(TTexts.MyRidesText),
              SizedBox(height: TSizes.xl,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(
                      height: Get.height / 4,
                      width: Get.width / 2.5,
                      decoration: TWidget.lShadow,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(blackCarImage, height: 80, width: 80,),
                          Text(TTexts.totalRideText,
                            textAlign: TextAlign.center,
                            style: FontsFamily.ExtraBold.copyWith(
                              color: TColors.textPrimary,
                              fontSize: TSizes.fontSizeMd,
                              letterSpacing: 1,
                            ),),
                          SizedBox(height: TSizes.md,),
                          Text(controller.totalRide.value == ""?"0":controller.totalRide.value,
                            style: FontsFamily.ExtraBold.copyWith(
                                color: TColors.info,
                                fontSize: TSizes.fontSizeLg
                            ),)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: TSizes.md,),
                  Flexible(
                    child: Container(
                      height: Get.height / 4,
                      width: Get.width / 2.5,
                      decoration: TWidget.lShadow,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(blackHandImage, height: 80, width: 80,),
                          SizedBox(height: TSizes.md,),
                          Text(TTexts.EarningText,
                            textAlign: TextAlign.center,
                            style: FontsFamily.ExtraBold.copyWith(
                              color: TColors.textPrimary,
                              fontSize: TSizes.fontSizeMd,
                              letterSpacing: 1,
                            ),),
                          SizedBox(height: TSizes.md,),
                          Text("${TTexts.CurrencyCanada} ${controller.totalEarning.value}",
                            style: FontsFamily.ExtraBold.copyWith(
                                color: TColors.info,
                                fontSize: TSizes.fontSizeLg
                            ),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: TSizes.md,),
              Flexible(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.rideHistoryList.length,
                  itemBuilder: (context, index) {
                    var list = controller.rideHistoryList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.symmetric(vertical: 15),
                        width: Get.width,
                        decoration: TWidget.rShadow,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: [

                                      Text(list.rideDate,
                                        style: FontsFamily.ExtraBold.copyWith(
                                            color: TColors.textPrimary,
                                            fontSize: TSizes.fontSizeSm
                                        ),),
                                      SizedBox(width: 10,),
                                      Image.asset(calenderImage, height: 20,
                                        width: 20,
                                        color: TColors.info,),
                                    ],
                                  ),
                                  SizedBox(width: 5,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: [
                                      Text(list.rideTime,
                                        style: FontsFamily.ExtraBold.copyWith(
                                            color: TColors.textPrimary,
                                            fontSize: TSizes.fontSizeSm
                                        ),),
                                      SizedBox(width: 10,),
                                      Image.asset(timeImage, height: 20,
                                        width: 20,
                                        color: TColors.info,),

                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 120,
                                    decoration: TWidget.rShadow,
                                    child: Center(
                                      child: Text(list.status,
                                        style: FontsFamily.ExtraBold.copyWith(
                                            color: TColors.info,
                                            fontSize: TSizes.fontSizeSm
                                        ),),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    height: 30,
                                    decoration: TWidget.rShadow,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center,
                                      children: [
                                        Text(TTexts.FinalCostText,
                                          style: FontsFamily.ExtraBold.copyWith(
                                              color: TColors.textPrimary,
                                              fontSize: TSizes.fontSizeSm
                                          ),),
                                        SizedBox(width: 20,),
                                        Text("${TTexts.CurrencyCanada} ${list.totalPrice}",
                                          style: FontsFamily.ExtraBold.copyWith(
                                              color: TColors.info,
                                              fontSize: TSizes.fontSizeSm
                                          ),)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 20,),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                decoration: TWidget.rShadow,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30, right: 10),
                                  child: Row(
                                    children: [
                                      Text(list.rideStartTime,
                                        style: FontsFamily.ExtraBold.copyWith(
                                            color: TColors.info,
                                            fontSize: TSizes.fontSizeSm
                                        ),),
                                      SizedBox(width: 20,),
                                      Expanded(
                                        child: Text(list.sourceAdd,
                                          style: FontsFamily.ExtraBold.copyWith(
                                              color: TColors.textPrimary,
                                              fontSize: TSizes.fontSizeSm
                                          ),),
                                      ),
                                      Align(
                                          alignment: Alignment.centerRight,
                                          child: Image.asset(
                                            flagImage, height: 20,
                                            width: 20,
                                            color: TColors.info,)
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                decoration: TWidget.rShadow,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30, right: 10),
                                  child: Row(
                                    children: [
                                      Text(list.rideEndTime,
                                        style: FontsFamily.ExtraBold.copyWith(
                                            color: TColors.info,
                                            fontSize: TSizes.fontSizeSm
                                        ),),
                                      SizedBox(width: 20,),
                                      Expanded(
                                        child: Text(list.destinationAdd,
                                          style: FontsFamily.ExtraBold.copyWith(
                                              color: TColors.textPrimary,
                                              fontSize: TSizes.fontSizeSm
                                          ),),
                                      ),
                                      Align(
                                          alignment: Alignment.centerRight,
                                          child: Image.asset(
                                              roundLocationImage, height: 20,
                                              width: 20,
                                              color: TColors.info)
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
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
