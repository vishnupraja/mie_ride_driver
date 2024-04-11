import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/colors.dart';
import '../../constant/font_family.dart';
import '../../constant/sizes.dart';
import '../../constant/text_strings.dart';
import '../../utils/static.dart';
class NewsFeed extends StatelessWidget {
  const NewsFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: TSizes.xl,),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: customAppbar(TTexts.NewsfeedText)),
          Expanded(child: ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                padding: EdgeInsets.symmetric(  vertical: 20),
                decoration: TWidget.bShadow,
                child: Column(
                  children: [
                    Center(
                      child: Text(TTexts.startRideText,
                        style: FontsFamily.ExtraBold.copyWith(
                            fontSize: TSizes.fontSizeMd,
                        ),),
                    ),
                    Center(
                      child: Text(TTexts.startRideText,
                        style: FontsFamily.ExtraBold.copyWith(
                            fontSize: TSizes.fontSizeSm,
                            color: TColors.buttonPrimary
                        ),),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 200,
                      width: Get.width/2,
                      decoration: TWidget.boxDecoration,
                    )
                  ],
                ),
              );
            },))
        ],
      ),
    );
  }
}
