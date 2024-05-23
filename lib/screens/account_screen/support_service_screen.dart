import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/controllers/auth_controller.dart';
import 'package:mie_ride_driver/route_helper/Route_Helper.dart';

import '../../constant/colors.dart';
import '../../constant/font_family.dart';
import '../../constant/image_string/image_string.dart';
import '../../constant/sizes.dart';
import '../../constant/text_strings.dart';
import '../../utils/static.dart';
class SupportService extends StatefulWidget {
  const SupportService({super.key});

  @override
  State<SupportService> createState() => _SupportServiceState();
}

class _SupportServiceState extends State<SupportService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: TColors.background,
        leading: GestureDetector(
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
        title: Text(TTexts.SupportServicesText,
          textAlign: TextAlign.center,
          style: FontsFamily.ExtraBold.copyWith(
            color: TColors.textPrimary,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: TSizes.xl,),
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
             child: GestureDetector(
               onTap: (){
                 show();
               },
               child: Container(
                 height: 50,
                 width: 160,
                 decoration: TWidget.rShadow,
                 child: Center(
                   child: Text(TTexts.DeleteAccountText,
                   style: FontsFamily.ExtraBold.copyWith(
                     fontSize: TSizes.fontSizeMd,
                     color: TColors.acceptColor
                   ),),
                 ),
               ),
             ),
                           ),
          ],
        ),
      ),
    );
  }

  void show()async{
    return  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Account'),
          content: Text('Are you sure you want to delete account?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
              Get.find<AuthController>().deleteAccount();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
