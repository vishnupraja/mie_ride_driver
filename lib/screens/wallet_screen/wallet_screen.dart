import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/controllers/wallete_controller.dart';
import 'package:mie_ride_driver/main.dart';
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

  final controller = Get.find<WalletController>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      controller.walletFetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7f7f7),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xfff7f7f7),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Card(
              color: Color(0xfff7f7f7),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Icon(
                        Icons.arrow_back_ios, color: TColors.textPrimary,
                        size: 20,),
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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Container(
              height: Get.height / 2.8,
              width: Get.width / 1,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/shadow.png'))
              ),
              child: Center(
                child:  Obx(() {
                  return Padding(
                    padding: const EdgeInsets.only(top: 130),
                    child: Text(controller.balance.value == "0"
                        ? "${TTexts.Currency} 0"
                        : "${TTexts.Currency} ${controller.balance.value}",
                      style: FontsFamily.ExtraBold.copyWith(
                          color: TColors.buttonPrimary,
                          fontSize: 30
                      ),),
                  );
                }),
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: InkWell(
                onTap: (){
                  Get.toNamed(RouteHelper.getAccountDetailPage());
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 12),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xfff7f7f7),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: TColors.background),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(2, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(TTexts.AccountDetailsText,
                          style: FontsFamily.ExtraBold.copyWith(
                              color: TColors.textPrimary,
                              fontSize: TSizes.fontSizeMd,
                              letterSpacing: 1
                          ),
                        ),
                        Image.asset(walletUserImage,height: TSizes.iconMd,width: TSizes.iconMd,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: InkWell(
                onTap: (){
                  Get.toNamed(RouteHelper.getHistoryPage());
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 12),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xfff7f7f7),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: TColors.background),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(2, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(TTexts.HistoryText,
                          style: FontsFamily.ExtraBold.copyWith(
                              color: TColors.textPrimary,
                              fontSize: TSizes.fontSizeMd,
                              letterSpacing: 1
                          ),
                        ),
                        Image.asset(walletHistoryImage,height: TSizes.iconMd,width: TSizes.iconMd,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
