import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/route_helper/Route_Helper.dart';

import '../../constant/colors.dart';
import '../../constant/font_family.dart';
import '../../constant/image_string/image_string.dart';
import '../../constant/sizes.dart';
import '../../constant/text_strings.dart';
import '../../utils/static.dart';
class SupportService extends StatelessWidget {
  const SupportService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: TSizes.appBarHeight,),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: customAppbar(TTexts.SupportServicesText)),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  children: [
                    customContainer(TTexts.ContactFormText, contactFormImage,(){
                      Get.toNamed(RouteHelper.getContactFormPage());
                    }),
                    SizedBox(height: 15,),
                    customContainer(TTexts.FAQText, faqImage,(){
                      Get.toNamed(RouteHelper.getFAQPage());
                    }),
                    SizedBox(height: 15,),
                    customContainer(TTexts.TermsConditionsText, termConditionImage,(){
                      Get.toNamed(RouteHelper.getTermConditionPage());
                    }),
                    SizedBox(height: 15,),
                    customContainer(TTexts.PrivacyText, privacyImage,(){
                      Get.toNamed(RouteHelper.getPrivacyPolicyPage());
                    }),
                    SizedBox(height: 50 ,),
                   Center(
                     child: Container(
                       height: 50,
                       width: 160,
                       decoration: TWidget.bShadow,
                       child: Center(
                         child: Text(TTexts.DeleteAccountText,
                         style: FontsFamily.ExtraBold.copyWith(
                           fontSize: TSizes.fontSizeMd,
                           color: TColors.acceptColor
                         ),),
                       ),
                     ),
                   )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
