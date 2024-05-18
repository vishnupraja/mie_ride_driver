import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/constant/font_family.dart';
import 'package:mie_ride_driver/constant/sizes.dart';
import 'package:mie_ride_driver/constant/text_strings.dart';
import 'package:mie_ride_driver/controllers/single_controller.dart';
import 'package:mie_ride_driver/utils/static.dart';

import '../../constant/colors.dart';

class DealZone extends StatelessWidget {
  const DealZone({super.key});

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
        title: Text(TTexts.DealsZoneText,
          textAlign: TextAlign.center,
          style: FontsFamily.ExtraBold.copyWith(
            color: TColors.textPrimary,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(
            shrinkWrap: true,
              itemCount: Get.find<SingleController>().couponList.length,
              itemBuilder: (context, index) {
              var list = Get.find<SingleController>().couponList[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  decoration: TWidget.rShadow,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          width: Get.width,
                          height: 100,
                          decoration: TWidget.rShadow,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(list["title"],
                            textAlign: TextAlign.center,
                            style: FontsFamily.ExtraBold.copyWith(
                              fontSize: TSizes.fontSizeMd,
                              color: TColors.buttonPrimary
                            ),),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          height: 40,
                          width: 150,
                          decoration: TWidget.rShadow,
                          child: Center(
                            child: Text("Apply",
                            style: FontsFamily.ExtraBold.copyWith(
                              fontSize: TSizes.fontSizeMd,
                            ),),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },))
        ],
      ),
    );
  }
}
