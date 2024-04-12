import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';
import '../constant/font_family.dart';
import '../constant/image_string/image_string.dart';
import '../constant/sizes.dart';
import '../constant/text_strings.dart';
import '../utils/static.dart';

class OngoingRide extends StatefulWidget {
  const OngoingRide({super.key});

  @override
  State<OngoingRide> createState() => _OngoingRideState();
}

class _OngoingRideState extends State<OngoingRide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: Get.height/16,),
           Expanded(
             child: ListView.builder(
               itemCount: 5,
                 shrinkWrap: true,
                 itemBuilder: (context, snapshot) {
                 return Padding(
                         padding: const EdgeInsets.symmetric(vertical: 10),
                         child: Container(
                           margin: EdgeInsets.symmetric(horizontal: 10),
                           padding: EdgeInsets.symmetric(vertical: 15),
                           width: Get.width,
                           decoration: TWidget.bShadow,
                           child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         Card(
                           elevation: 2,
                           shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius
                                   .circular(30)
                           ),
                           child: Center(
                             child: ClipRRect(
                               borderRadius: BorderRadius.circular(30),
                                 child: Image.asset(USER_IMAGE,height: 50,width: 50,fit: BoxFit.cover,)),
                           ),
                         ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Sadhu",
                              style: FontsFamily.ExtraBold.copyWith(
                                color: TColors.info,
                                fontSize: TSizes.fontSizeLg
                              ),),
                              Text(TTexts.RideTypeText,
                                style: FontsFamily.ExtraBold.copyWith(
                                    fontSize: TSizes.fontSizeSm
                                ),),
                              Text("Sharing",
                                style: FontsFamily.ExtraBold.copyWith(
                                    color: TColors.info,
                                    fontSize: TSizes.fontSizeSm
                                ),),
                            ],
                          ),
                          SizedBox(width: 30,),
                          Column (
                            children: [
                             Container(
                               margin: EdgeInsets.symmetric(vertical: 10),
                               height: 40,
                               width: 40,
                               decoration: TWidget.bShadow,
                               child: Center(
                                 child: Icon(Icons.location_on_outlined,color: TColors.info,size: 20,),
                               ),
                             ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: TWidget.bShadow,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("ID",
                                      style: FontsFamily.ExtraBold.copyWith(
                                          fontSize: TSizes.fontSizeSm
                                      ),),
                                    SizedBox(width: 5,),
                                    Text("113",
                                      style: FontsFamily.ExtraBold.copyWith(
                                          color: TColors.info,
                                          fontSize: TSizes.fontSizeSm
                                      ),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column (
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                height: 40,
                                width: 40,
                                decoration: TWidget.bShadow,
                                child: Center(
                                  child: Icon(Icons.clear,color: TColors.info,size: 20,),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: TWidget.bShadow,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("ID",
                                      style: FontsFamily.ExtraBold.copyWith(
                                          fontSize: TSizes.fontSizeSm
                                      ),),
                                    SizedBox(width: 5,),
                                    Text("113",
                                      style: FontsFamily.ExtraBold.copyWith(
                                          color: TColors.info,
                                          fontSize: TSizes.fontSizeSm
                                      ),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        decoration: TWidget.bShadow,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30,right: 10),
                          child: Row(
                            children: [
                              Text(TTexts.PickupText,
                                style: FontsFamily.ExtraBold.copyWith(
                                    color: TColors.textSecondary,
                                    fontSize: TSizes.fontSizeSm
                                ),),
                              SizedBox(width: 20,),
                              Expanded(
                                child: Text(TTexts.aPickupText,
                                  style: FontsFamily.ExtraBold.copyWith(
                                      color: TColors.textPrimary,
                                      fontSize: TSizes.fontSizeSm
                                  ),),
                              ),
                              Expanded(
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Image.asset(flagImage,height: 20,width: 20,color: TColors.info,)
                                ),
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
                          padding: const EdgeInsets.only(left: 30,right: 10),
                          child: Row(
                            children: [
                              Text(TTexts.DropOffText,
                                style: FontsFamily.ExtraBold.copyWith(
                                    color: TColors.textSecondary,
                                    fontSize: TSizes.fontSizeSm
                                ),),
                              SizedBox(width: 20,),
                              Expanded(
                                child: Text(TTexts.aDropOffText,
                                  style: FontsFamily.ExtraBold.copyWith(
                                      color: TColors.textPrimary,
                                      fontSize: TSizes.fontSizeSm
                                  ),),
                              ),
                              Expanded(
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Image.asset(roundLocationImage,height: 20,width: 20,color: TColors.info)
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 25,),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: TWidget.bShadow,
                            child: Center(
                              child: Image.asset(callImage,height: 20,width: 20,),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: TWidget.bShadow,
                              child: Center(
                                child: Text("Start ride",
                                style: FontsFamily.ExtraBold.copyWith(
                                  fontSize: TSizes.fontSizeMd,
                                  color: TColors.info
                                ),),
                              ),
                            ),
                          ),
             
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: TWidget.bShadow,
                            child: Center(
                              child: Image.asset(chatImage,height: 20,width: 20,),
                            ),
                          )
                        ],
                      )
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
    );
  }
}
