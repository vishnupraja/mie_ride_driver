import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/constant/image_string/image_string.dart';
import 'package:mie_ride_driver/route_helper/Route_Helper.dart';

import '../../constant/colors.dart';
import '../../constant/font_family.dart';
import '../../constant/text_strings.dart';
import '../../utils/static.dart';
class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Align(
                alignment: Alignment.topCenter,
                child: Text(TTexts.AccountText,
                  style: FontsFamily.ExtraBold.copyWith(
                      color: TColors.textPrimary,
                      fontSize: 25,
                      letterSpacing: 5
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  children: [
                    customContainer(TTexts.ProfileText, userImage,(){}),
                    customContainer(TTexts.MyRidesText, carImage,(){
                      Get.toNamed(RouteHelper.getMyRidePage());
                    }),
                    customContainer(TTexts.SpreadText, spreadImage,(){}),
                    customContainer(TTexts.ExclusiveText, dealzoneImage,(){}),
                    customContainer(TTexts.NewsfeedText, newsImage,(){}),
                    customContainer(TTexts.SupportServicesText, supportImage,(){}),
                    customContainer(TTexts.RideSupportText, chatImage,(){}),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 40),
                      child: CustomButton(TTexts.SignOutText,BUTTON_IMAGE, () {
                       /* Get.offNamed(RouteHelper.getBottomPage());*/
                      }),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
