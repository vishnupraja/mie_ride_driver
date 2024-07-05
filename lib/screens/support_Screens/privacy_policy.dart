import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/controllers/profile_Controller.dart';
import 'package:mie_ride_driver/utils/static.dart';
import '../../constant/colors.dart';
import '../../constant/font_family.dart';


class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: TColors.background,
        leading: GestureDetector(
          onTap: () {
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
                      child: Icon(
                        Icons.arrow_back_ios, color: TColors.textPrimary,
                        size: 20,),
                    )
                ),
              ),
            ),
          ),
        ),
        title: Text("Privacy policy",
          textAlign: TextAlign.center,
          style: FontsFamily.ExtraBold.copyWith(
            color: TColors.textPrimary,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        height: Get.height / 1.2,
        width: Get.width,
        decoration: TWidget.rShadow,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Html(data: "${Get.find<ProfileController>().privacy}")
            ]
        ),
      ),
    );
  }
}
