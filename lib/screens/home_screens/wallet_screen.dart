import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Align(
                alignment: Alignment.topCenter,
                child: Text(TTexts.WalletText,
                  style: FontsFamily.ExtraBold.copyWith(
                      color: TColors.textPrimary,
                      fontSize: 25,
                      letterSpacing: 5
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 30),
                child: Column(
                  children: [
                    Container(
                      height: Get.height/3.2,
                      width: Get.width/1.7,
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
                    customContainer(TTexts.AccountDetailsText, walletUserImage,(){}),
                    SizedBox(height: 10,),
                    customContainer(TTexts.HistoryText, walletHistoryImage,(){}),

                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 40),
                      child: CustomButton(TTexts.SubmitText,BUTTON_IMAGE, () {
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
