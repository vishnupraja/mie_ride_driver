import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/constant/image_string/image_string.dart';
import 'package:mie_ride_driver/route_helper/Route_Helper.dart';
import 'package:mie_ride_driver/screens/rating_screen.dart';

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
              customAppbar(TTexts.AccountText),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  children: [
                    customContainer(TTexts.ProfileText, userImage,(){
                      Get.toNamed(RouteHelper.getProfilePage());
                    }),
                    customContainer(TTexts.MyRidesText, carImage,(){
                      Get.toNamed(RouteHelper.getMyRidePage());
                    }),
                    customContainer(TTexts.SpreadText, spreadImage,(){
                      Get.toNamed(RouteHelper.getSpreadWordScreenPage());
                    }),
                    customContainer(TTexts.ExclusiveText, dealzoneImage,(){
                      Get.toNamed(RouteHelper.getDealZonePage());
                    }),
                    customContainer(TTexts.NewsfeedText, newsImage,(){
                      Get.toNamed(RouteHelper.getNewsFeedPage());
                    }),
                    customContainer(TTexts.SupportServicesText, supportImage,(){
                      Get.toNamed(RouteHelper.getSupportServicePage());
                    }),
                    customContainer(TTexts.RideSupportText, chatImage,(){
                      Get.toNamed(RouteHelper.getSupportChatPage());
                    }),
                    customContainer("Message", chatImage,(){
                      Get.toNamed(RouteHelper.getMessageScreenPage());
                    }),
                    customContainer("AcceptRide", chatImage,(){
                      Get.toNamed(RouteHelper.getAcceptRidePage());
                    }),
                    customContainer("onGoingRide", chatImage,(){
                      Get.toNamed(RouteHelper.getOngoingRidePage());
                    }),
                    customContainer("Rating", chatImage,(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RatingScreen()));
                    }),
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
