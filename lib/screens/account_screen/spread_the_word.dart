import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/colors.dart';
import '../../constant/font_family.dart';
import '../../constant/image_string/image_string.dart';
import '../../constant/sizes.dart';
import '../../constant/text_strings.dart';
import '../../utils/static.dart';

class SpreadWordScreen extends StatefulWidget {
  const SpreadWordScreen({super.key});

  @override
  State<SpreadWordScreen> createState() => _SpreadWordScreenState();
}

class _SpreadWordScreenState extends State<SpreadWordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            SizedBox(height: TSizes.xl,),
            customAppbar(TTexts.SpreadText),
            SizedBox(height: TSizes.xl,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: Get.height/2.8,
                      width: Get.width/1.7,
                      decoration: TWidget.boxDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(SpreadImage,height: 70,width: 70,),
                          SizedBox(height:TSizes.md,),
                          Text(TTexts.SpreadText,
                            textAlign: TextAlign.center,
                            style: FontsFamily.ExtraBold.copyWith(
                              color: TColors.textPrimary,
                              fontSize: TSizes.fontSizeLg,
                              letterSpacing: 1,
                            ),),
                          SizedBox(height:TSizes.md,),
                          Text(TTexts.ExpandText,
                            textAlign: TextAlign.center,
                            style: FontsFamily.ExtraBold.copyWith(
                                color: TColors.textPrimary,
                                fontSize: TSizes.fontSizeMd
                            ),)
                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
                    Text(TTexts.inviteText,
                      textAlign: TextAlign.center,
                      style: FontsFamily.ExtraBold.copyWith(
                        color: TColors.textPrimary,
                        fontSize: TSizes.fontSizeMd,
                      ),),
                    SizedBox(height: 30,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                      decoration: TWidget.bShadow,
                      child: Row(
                        children: [
                          Text(TTexts.linkText,
                          style: FontsFamily.ExtraBold.copyWith(
                            fontSize: 12,
                            color: TColors.textPrimary
                          ),),
                          SizedBox(width: 5,),
                          Icon(Icons.copy)
                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 40),
                      child: CustomButton(
                          TTexts.bInviteText, BUTTON_IMAGE, () {

                      }),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
