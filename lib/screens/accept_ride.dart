import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/screens/test_screen.dart';

import '../constant/colors.dart';
import '../constant/font_family.dart';
import '../constant/image_string/image_string.dart';
import '../constant/sizes.dart';
import '../constant/text_strings.dart';
import '../utils/static.dart';

class AcceptRide extends StatefulWidget {
  const AcceptRide({super.key});

  @override
  State<AcceptRide> createState() => _AcceptRideState();
}

class _AcceptRideState extends State<AcceptRide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: Get.height/12,),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, snapshot) {
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
                                  decoration: TWidget.bShadow,
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
                                  decoration: TWidget.bShadow,
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
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  height: 30,
                                  decoration: TWidget.bShadow,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(TTexts.FinalCostText,
                                        style: FontsFamily.ExtraBold.copyWith(
                                            color: TColors.textPrimary,
                                            fontSize: 8.0
                                        ),),
                                      SizedBox(width: 20,),
                                      Text("${TTexts.Currency} 30",
                                        style: FontsFamily.ExtraBold.copyWith(
                                            color: TColors.textPrimary,
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
                                decoration: TWidget.bShadow,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(TTexts.RideStartTimeText,
                                      style: FontsFamily.ExtraBold.copyWith(
                                          color: TColors.textPrimary,
                                          fontSize: TSizes.fontSizeSm
                                      ),),
                                    SizedBox(width: 10,),
                                    Text("11:30 PM",
                                      style: FontsFamily.ExtraBold.copyWith(
                                          color: TColors.info,
                                          fontSize: TSizes.fontSizeSm
                                      ),)
                                  ],
                                ),
                              ),
                              SizedBox(width: 10,),
                              Flexible(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(calenderImage,height: 20,width: 20,),
                                    SizedBox(width: 10,),
                                    Text("2023/12/13",
                                      style: FontsFamily.ExtraBold.copyWith(
                                          color: TColors.info,
                                          fontSize: TSizes.fontSizeSm
                                      ),)
                                  ],
                                ),
                              ),
                              SizedBox(width: 5,),
                              Flexible(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(timeImage,height: 20,width: 20,),
                                    SizedBox(width: 10,),
                                    Text("4:30 PM",
                                      style: FontsFamily.ExtraBold.copyWith(
                                          color: TColors.info,
                                          fontSize: TSizes.fontSizeSm
                                      ),)
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            decoration: TWidget.bShadow,
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
                            decoration: TWidget.bShadow,
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
                                decoration: TWidget.bShadow,
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
              }
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: Get.width,
          padding: EdgeInsets.only(left:TSizes.lg,right:TSizes.lg,bottom: TSizes.lg,top: TSizes.lg),
          decoration: BoxDecoration(
              color: TColors.background,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40)
              ),
              /*border: Border(
                      top: TWidget.borderSide,
                      left: TWidget.borderSide,
                      right: TWidget.borderSide
                  ),*/
              boxShadow:TWidget.boxShadow
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text("00.00.54",
                  style: FontsFamily.ExtraBold.copyWith(
                      fontSize: TSizes.fontSizeMd,
                      color: TColors.info,
                      letterSpacing: 2
                  ),),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5,vertical: 20),
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                decoration: TWidget.bShadow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Amount", style: FontsFamily.ExtraBold.copyWith(
                      fontSize: TSizes.fontSizeMd,
                    ),),
                    Column(
                      children: [
                        Text("Bonus", style: FontsFamily.ExtraBold.copyWith(
                          fontSize: TSizes.fontSizeMd,
                        ),),
                        Text("${TTexts.Currency}10", style: FontsFamily.ExtraBold.copyWith(
                            fontSize: TSizes.fontSizeMd,
                            color: TColors.info
                        ),),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Bonus", style: FontsFamily.ExtraBold.copyWith(
                          fontSize: TSizes.fontSizeMd,
                        ),),
                        Text("${TTexts.Currency}10", style: FontsFamily.ExtraBold.copyWith(
                            fontSize: TSizes.fontSizeMd,
                            color: TColors.info
                        ),),
                      ],
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TestScreen()));
                },
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                    decoration: TWidget.bShadow,
                    child: Center(
                      child: Text("Accept", style: FontsFamily.ExtraBold.copyWith(
                        fontSize: TSizes.fontSizeMd,
                        color: TColors.rideCompleteColor,
                      ),),
                    )
                ),
              ),
              GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                    decoration: TWidget.bShadow,
                    child: Center(
                      child: Text("Decline", style: FontsFamily.ExtraBold.copyWith(
                          fontSize: TSizes.fontSizeMd,
                          color: TColors.acceptColor
                      ),),
                    )
                ),
              )
            ],
          )
      ),
    );
  }
}
