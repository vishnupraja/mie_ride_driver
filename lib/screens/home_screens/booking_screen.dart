import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/constant/sizes.dart';
import 'package:mie_ride_driver/utils/static.dart';

import '../../constant/colors.dart';
import '../../constant/font_family.dart';
import '../../constant/image_string/image_string.dart';
import '../../constant/text_strings.dart';
class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            customAppbar(TTexts.BookingsText),
            SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: 50),
                scrollDirection: Axis.vertical,
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.symmetric(vertical: 15),
                        width: Get.width,
                        decoration: TWidget.bShadow,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 30,
                                      decoration: TWidget.bBoxDecoration,
                                      child: Center(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(TTexts.IDText,
                                              style: FontsFamily.ExtraBold.copyWith(
                                                  color: TColors.textPrimary,
                                                  fontSize: TSizes.fontSizeSm
                                              ),),
                                            Text("113",
                                              style: FontsFamily.ExtraBold.copyWith(
                                                  color: TColors.info,
                                                  fontSize: TSizes.fontSizeSm
                                              ),)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                                      height: 30,
                                      decoration: TWidget.bBoxDecoration,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(TTexts.RideTypeText,
                                            style: FontsFamily.ExtraBold.copyWith(
                                                color: TColors.textPrimary,
                                                fontSize: 8.0
                                            ),),
                                          SizedBox(width: 1,),
                                          Text("Sharing",
                                            style: FontsFamily.ExtraBold.copyWith(
                                                color: TColors.info,
                                                fontSize: 8.0
                                            ),)
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 5),
                                      height: 30,
                                      decoration: TWidget.bBoxDecoration,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(TTexts.FinalCostText,
                                            style: FontsFamily.ExtraBold.copyWith(
                                                color: TColors.textPrimary,
                                                fontSize: 8.0
                                            ),),
                                          SizedBox(width: 10,),
                                          Text("${TTexts.Currency} 30",
                                            style: FontsFamily.ExtraBold.copyWith(
                                                color: TColors.buttonPrimary,
                                                fontSize: 8.0
                                            ),)
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 20,),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                                    height: 30,
                                    decoration: TWidget.bBoxDecoration,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(TTexts.RideStartTimeText,
                                          style: FontsFamily.ExtraBold.copyWith(
                                              color: TColors.textPrimary,
                                              fontSize: TSizes.fontSizeSm
                                          ),),
                                        SizedBox(width: 5,),
                                        Text("11:30 PM",
                                          style: FontsFamily.ExtraBold.copyWith(
                                              color: TColors.info,
                                              fontSize: 8
                                          ),)
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Flexible(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(calenderImage,height: 15,width: 15,),
                                        SizedBox(width: 5,),
                                        Text("2023/12/13",
                                          style: FontsFamily.ExtraBold.copyWith(
                                              color: TColors.info,
                                              fontSize: 8
                                          ),)
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Flexible(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(timeImage,height: 15,width: 15,),
                                        SizedBox(width: 5,),
                                        Text("4:30 PM",
                                          style: FontsFamily.ExtraBold.copyWith(
                                              color: TColors.info,
                                              fontSize: 8
                                          ),)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                decoration: TWidget.bBoxDecoration,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: Text(TTexts.PickupText,
                                          style: FontsFamily.ExtraBold.copyWith(
                                              color: TColors.textSecondary,
                                              fontSize: TSizes.fontSizeSm
                                          ),),
                                      ),
                                      SizedBox(width: 20,),
                                      Flexible(
                                        child: Text(TTexts.aPickupText,
                                          style: FontsFamily.ExtraBold.copyWith(
                                              color: TColors.textPrimary,
                                              fontSize: TSizes.fontSizeSm
                                          ),),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                decoration: TWidget.bBoxDecoration,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: Text(TTexts.DropOffText,
                                          style: FontsFamily.ExtraBold.copyWith(
                                              color: TColors.textSecondary,
                                              fontSize: TSizes.fontSizeSm
                                          ),),
                                      ),
                                      SizedBox(width: 20,),
                                      Flexible(
                                        child: Text(TTexts.aDropOffText,
                                          style: FontsFamily.ExtraBold.copyWith(
                                              color: TColors.textPrimary,
                                              fontSize: TSizes.fontSizeSm
                                          ),),
                                      )
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(height: 20,),
                              Center(
                                child: Container(
                                    height: 40,
                                    width: 150,
                                    decoration: TWidget.bBoxDecoration  ,
                                    child: Center(
                                      child: Text(TTexts.BPickupText,
                                        style: FontsFamily.ExtraBold.copyWith(
                                            color: TColors.info,
                                            fontSize: TSizes.fontSizeMd
                                        ),),
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },),
            ),
          ],
        ),
      ),
    );
  }
}
