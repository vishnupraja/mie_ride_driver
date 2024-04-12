import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/route_helper/Route_Helper.dart';

import '../../constant/colors.dart';
import '../../constant/font_family.dart';
import '../../constant/image_string/image_string.dart';
import '../../constant/sizes.dart';
import '../../constant/text_strings.dart';
import '../../utils/static.dart';
class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
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
        title: Text(TTexts.WalletText,
          textAlign: TextAlign.center,
          style: FontsFamily.ExtraBold.copyWith(
            color: TColors.textPrimary,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Container(
              height: Get.height/3.2,
              width: Get.width/2,
              decoration: TWidget.boxDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(HOME_HAND_IMAGE,height: 70,width: 70,),
                  SizedBox(height:TSizes.md,),
                  Text(TTexts.TotalBalanceText,
                    textAlign: TextAlign.center,
                    style: FontsFamily.ExtraBold.copyWith(
                      color: TColors.textPrimary,
                      fontSize: TSizes.fontSizeLg,
                      letterSpacing: 1,
                    ),),
                  SizedBox(height:TSizes.md,),
                  Text("${TTexts.Currency} 200",
                    style: FontsFamily.ExtraBold.copyWith(
                        color: TColors.buttonPrimary,
                        fontSize: TSizes.fontSizeLg
                    ),)
                ],
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: customContainer(TTexts.AccountDetailsText, walletUserImage,(){
                Get.toNamed(RouteHelper.getAccountDetailPage());
              }),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: customContainer(TTexts.HistoryText, walletHistoryImage,(){
                Get.toNamed(RouteHelper.getHistoryPage());
              }),
            ),

            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 40),
              child: CustomButton(TTexts.SubmitText,BUTTON_IMAGE, () {
                /* Get.offNamed(RouteHelper.getBottomPage());*/
              }),
            ),
          ],
        ),
      ),
    );
  }
}
