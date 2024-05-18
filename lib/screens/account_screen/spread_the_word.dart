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
      backgroundColor: Color(0xfff7f7f7),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: TColors.background,
          leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Icon(Icons.arrow_back_ios,color: TColors.textPrimary,size: 20,),
                      )
                  ),
                ),
              ),
            ),
          ),
          title: Text(TTexts.SpreadText,
            textAlign: TextAlign.center,
            style: FontsFamily.ExtraBold.copyWith(
              color: TColors.textPrimary,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
        ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Container(
              height: Get.height/2.5,
              width: Get.width/1.8,
              decoration: BoxDecoration(
                  color: Color(0xFFf7f7f7),
                  image: DecorationImage(image: AssetImage("assets/sp.png"),),
              ),
            ),
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
      )
    );
  }
}
