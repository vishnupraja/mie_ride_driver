import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';
import '../constant/font_family.dart';
import '../constant/image_string/image_string.dart';
import '../constant/sizes.dart';
import '../constant/text_strings.dart';
import '../utils/static.dart';

class ShareAvailability extends StatefulWidget {
  const ShareAvailability({super.key});

  @override
  State<ShareAvailability> createState() => _ShareAvailabilityState();
}

class _ShareAvailabilityState extends State<ShareAvailability> {

  List<String> selectCityList = ["Indore", "Ujjain", "Bhopal"];

  var selectCity = null;

  List<String> startDateList = ["12-02-24", "15-02-2024", "20-02-2024"];

  var startDate = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          children: [
            customAppbar(TTexts.ShareAvailabilityText),
            SizedBox(height: TSizes.xl,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              width: Get.width,
              decoration: TWidget.bShadow,
              child: Column(
                children: [
                  Text(TTexts.SelectTimeText,
                    style: FontsFamily.ExtraBold.copyWith(
                        fontSize: TSizes.fontSizeLg,
                        color: TColors.textPrimary
                    ),),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        decoration: TWidget.bBoxDecoration,
                        child: Center(
                          child: Text(TTexts.FromText,
                          style: FontsFamily.ExtraBold.copyWith(
                            fontSize: TSizes.fontSizeSm,
                            color: TColors.textSecondary
                          ),),
                        ),
                      ),
                      SizedBox(width: 50,),
                      Container(
                        width: 80,
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        decoration: TWidget.bBoxDecoration,
                        child: Center(
                          child: Text(TTexts.ToText,
                            style: FontsFamily.ExtraBold.copyWith(
                                fontSize: TSizes.fontSizeSm,
                                color: TColors.textSecondary
                            ),),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              width: Get.width,
              decoration: TWidget.bBoxDecoration,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: TWidget.bBoxDecoration,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        dropdownColor: TColors.background,
                        hint: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            TTexts.SelectDateText,
                            style: FontsFamily.ExtraBold.copyWith(
                              color: TColors.textSecondary,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        value: startDate,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          size: 30,
                          color: TColors.textPrimary,
                        ),
                        isExpanded: true,
                        items: startDateList.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                value,
                                style: TextStyle(color: TColors.textPrimary),
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            startDate = value;
                            print("date===>$startDate");
                          });
                        }, // Set direction to up
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: TWidget.bBoxDecoration,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        padding: EdgeInsets.symmetric( horizontal: 20),
                        dropdownColor: TColors.background,
                        hint: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            TTexts.SelectStartCityText,
                            style: FontsFamily.ExtraBold.copyWith(
                                color: TColors.textSecondary, fontSize: 15
                            ),
                          ),
                        ),
                        value: selectCity,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          size: 30,
                          color: TColors.textPrimary,
                        ),
                        isExpanded: true,
                        items: selectCityList.map(
                              (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  value,
                                  style: TextStyle(color: TColors.textPrimary),
                                ),
                              ),
                            );
                          },
                        ).toList(),
                        onChanged: (value) {
                          setState(
                                () {
                              selectCity = value;
                              print("vehicle===>$selectCity");
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              width: Get.width,
              decoration: TWidget.bBoxDecoration,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: TWidget.bBoxDecoration,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        padding: EdgeInsets.symmetric( horizontal: 20),
                        dropdownColor: TColors.background,
                        hint: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            TTexts.SelectDropCityText,
                            style: FontsFamily.ExtraBold.copyWith(
                                color: TColors.textSecondary, fontSize: 15
                            ),
                          ),
                        ),
                        value: selectCity,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          size: 30,
                          color: TColors.textPrimary,
                        ),
                        isExpanded: true,
                        items: selectCityList.map(
                              (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  value,
                                  style: TextStyle(color: TColors.textPrimary),
                                ),
                              ),
                            );
                          },
                        ).toList(),
                        onChanged: (value) {
                          setState(
                                () {
                              selectCity = value;
                              print("vehicle===>$selectCity");
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            CustomButton(TTexts.signupButton2Text, BUTTON_IMAGE, () { })
          ],
        ),
      ),
    );
  }
}
