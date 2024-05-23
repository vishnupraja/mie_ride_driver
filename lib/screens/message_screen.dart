import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/constant/font_family.dart';
import 'package:mie_ride_driver/constant/image_string/image_string.dart';
import 'package:mie_ride_driver/utils/static.dart';

import '../constant/colors.dart';
import '../constant/sizes.dart';
import '../constant/text_strings.dart';
class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        margin: EdgeInsets.only(left: TSizes.lg, right: TSizes.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    Column(
                      children: [
                        SizedBox(height: Get.height / 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(TSizes.sm),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: Offset(-2, 2),
                                      ),
                                    ],
                                    color: TColors.background),
                                child: Center(child: Icon(Icons.arrow_back_ios, size: 30)),
                              ),
                            ),
                            Text(
                              "David",
                              style: FontsFamily.ExtraBold.copyWith(
                                fontSize: TSizes.fontSizeLg,
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(-2, 2),
                                    ),
                                  ],
                                  color: TColors.background),
                              alignment: Alignment.center,
                              child: Icon(Icons.person, size: 30),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: TSizes.sm, right: TSizes.sm),
                            padding: EdgeInsets.only(left: TSizes.md, right: TSizes.md),
                            width: Get.width,
                            height: Get.height / 16,
                            decoration: TWidget.rShadow,
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    keyboardType: TextInputType.text,
                                    style: Theme.of(context).textTheme.bodyLarge,
                                    decoration: InputDecoration(
                                      hintText: "true",
                                      hintStyle: FontsFamily.ExtraBold.copyWith(
                                          fontSize: TSizes.fontSizeMd, color: TColors.textSecondary),
                                      fillColor: TColors.background,
                                      filled: true,
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Text(
                                  "Ride Problem",
                                  style: FontsFamily.ExtraBold.copyWith(
                                      fontSize: TSizes.fontSizeMd, color: TColors.textSecondary),
                                )
                              ],
                            )),
                      ],
                    ),
                    SizedBox(
                      height: TSizes.xl,
                    ),
                    Container(
                      width: Get.width,
                      height: Get.width / 1,
                      padding: EdgeInsets.only(left: TSizes.lg, right: TSizes.lg, bottom: TSizes.lg),
                      decoration: BoxDecoration(
                        color: TColors.background,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: TColors.background),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(2, 2),
                          ),
                          BoxShadow(
                            color: TColors.background.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(-2, -2),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: TSizes.spaceBtwItems),
                  ],
                ),
              ),
            ),
            Container(
              width: Get.width,
              padding: EdgeInsets.symmetric(horizontal: TSizes.lg, vertical: TSizes.lg),
              decoration: BoxDecoration(
                color: TColors.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(2, 2),
                  ),
                  BoxShadow(
                    color: TColors.background.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(-2, -2),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.add_circle_outline, size: 25),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: TSizes.md, right: TSizes.md),
                      padding: EdgeInsets.only(left: TSizes.md, right: TSizes.md),
                      height: Get.height / 16,
                      decoration: TWidget.rShadow,
                      alignment: Alignment.center,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        style: Theme.of(context).textTheme.bodyLarge,
                        decoration: InputDecoration(
                          hintText: TTexts.AddMessageText,
                          hintStyle: FontsFamily.ExtraBold.copyWith(color: TColors.buttonPrimary),
                          fillColor: TColors.background,
                          filled: true,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.image),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.mic),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
