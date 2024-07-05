import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/constant/colors.dart';
import 'package:mie_ride_driver/constant/font_family.dart';
import 'package:mie_ride_driver/constant/sizes.dart';
import 'package:mie_ride_driver/constant/text_strings.dart';
import 'package:mie_ride_driver/controllers/booking_controller.dart';
import 'package:mie_ride_driver/controllers/single_controller.dart';
import 'package:mie_ride_driver/route_helper/Route_Helper.dart';
import 'package:mie_ride_driver/screens/wallet_screen/wallet_screen.dart';
import 'package:mie_ride_driver/utils/static.dart';

import '../../constant/image_string/image_string.dart';
import '../accept_ride.dart';
import '../bannerScreen.dart';
import '../ongoing_ride.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    /*if(Get.find<BookingController>().BookingId.value != ""){
      Future.delayed(Duration.zero,(){
        Get.to(AcceptRide());
      });
    }*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: InkWell(
                        onTap: () {
                          Get.to(WalletScreen());
                        },
                        child: Container(
                          height: Get.height / 4.5,
                          width: Get.width / 2.8,
                          decoration: TWidget.lShadow,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                HOME_HAND_IMAGE, height: Get.height / 16,
                                width: Get.width / 5,),
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
                    ),
                    SizedBox(width: TSizes.lg,),
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
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
                                if (Get
                                    .find<BookingController>()
                                    .ongoingList
                                    .length != 0) {
                                  Future.delayed(Duration.zero, () {
                                    if (Get
                                        .find<BookingController>()
                                        .checkValue == "1") {
                                      hideFloatingWindow();
                                    } else {
                                      showFloatingWindow();
                                    }
                                  });
                                } else {
                                  Future.delayed(Duration.zero, () {
                                    hideFloatingWindow();
                                  });
                                }
                                return Container(
                                  height: Get.height / 14,
                                  width: Get.width / 6.5,
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
                                    child: Text("${Get
                                        .find<SingleController>()
                                        .ratingList
                                        .value!
                                        .overallRating}"),
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
                              Obx(() {
                                final ratingValue = Get.find<SingleController>().ratingList.value?.overallRating;
                                if (ratingValue != null) {
                                  return RatingBarIndicator(
                                    rating: double.parse(ratingValue),
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star,
                                      color: TColors.buttonPrimary,
                                    ),
                                    itemCount: 5,
                                    itemSize: 20.0,
                                    unratedColor: Colors.amber.withAlpha(50),
                                    direction: Axis.horizontal,
                                  );
                                } else {
                                  return RatingBarIndicator(
                                    rating: 0.0,
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star,
                                      color: TColors.buttonPrimary,
                                    ),
                                    itemCount: 5,
                                    itemSize: 20.0,
                                    unratedColor: Colors.amber.withAlpha(50),
                                    direction: Axis.horizontal,
                                  ); // or any fallback widget or indicator
                                }
                              }),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  width: Get.width / 1.1,
                  height: Get.height / 4,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(10),
                  child: Container(
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                        color: TColors.background,
                        borderRadius: BorderRadius.all(
                            Radius.circular(40)),
                        boxShadow: [
                          BoxShadow(
                            color: TColors.background,
                            blurRadius: 10,
                            spreadRadius: 10,
                          )
                        ]),
                    child: BannerWidget(),
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
                              image: DecorationImage(image: AssetImage(
                                  "assets/shareAvailability.png"),)
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
                              image: DecorationImage(
                                  image: AssetImage("assets/shareRought.png"))
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
