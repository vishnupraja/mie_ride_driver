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
              color: TColors.background,
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
        title: Text(TTexts.AccountText,
          textAlign: TextAlign.center,
          style: FontsFamily.ExtraBold.copyWith(
            color: TColors.textPrimary,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            /*  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Icon(Icons.arrow_back_ios,color: TColors.textPrimary,size: 20,),
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(width: Get.width/5,),
                Align(
                  alignment: Alignment.center,
                  child: Text(TTexts.AccountText,
                    textAlign: TextAlign.center,
                    style: FontsFamily.ExtraBold.copyWith(
                      color: TColors.textPrimary,
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),*/
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
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
                      padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 20),
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
