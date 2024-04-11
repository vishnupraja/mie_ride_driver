import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mie_ride_driver/constant/colors.dart';
import 'package:mie_ride_driver/constant/font_family.dart';

import '../../constant/image_string/image_string.dart';
import '../../constant/sizes.dart';
import '../../constant/text_strings.dart';
import '../../controllers/profile_Controller.dart';
import '../../utils/static.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  TextEditingController fNameCtr = TextEditingController();
  TextEditingController lNameCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  TextEditingController nPasswordCtr = TextEditingController();
  TextEditingController rNewPasswordCtr = TextEditingController();
  TextEditingController phoneCtr = TextEditingController();
  TextEditingController vehicleNumber = TextEditingController();

  bool isHide = true;
  bool isNewHide = true;
  bool isRNewHide = true;

  String countryCode = TTexts.countryCode;
  String countryFlag = "";



  List<String> vehicleList = ["hero", "honda", "Bullet"];

  var vehicle = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProfileController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              SizedBox(height: TSizes.xl,),
              customAppbar(TTexts.ProfileText),
              SizedBox(height: TSizes.xl,),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        margin: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: TWidget.bShadow,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.changeScreen.value =
                                        TTexts.PersonalText;
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 15),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    decoration: TWidget.bShadow,
                                    child: Center(
                                      child: Obx(() {
                                        return Text(TTexts.PersonalText,
                                          style: FontsFamily.ExtraBold.copyWith(
                                              fontSize: 13,
                                              color: controller.changeScreen.value != TTexts.PersonalText?TColors.textPrimary:TColors.info
                                          ),);
                                      }),
                                    ),
                                  ),
                                ),

                                InkWell(
                                  onTap: () {
                                    controller.changeScreen.value =
                                        TTexts.CarDetailsText;
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 15),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    decoration: TWidget.bShadow,
                                    child: Center(
                                      child: Obx(() {
                                        return Text(TTexts.CarDetailsText,
                                          style: FontsFamily.ExtraBold.copyWith(
                                              fontSize: 13,
                                              color: controller.changeScreen
                                                  .value !=
                                                  TTexts.CarDetailsText
                                                  ? TColors.textPrimary
                                                  : TColors.info
                                          ),);
                                      }),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 20,),
                            Obx(() {
                              return Visibility(
                                  visible: controller.changeScreen.value ==
                                      TTexts.PersonalText,
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Card(
                                              elevation: 2,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius
                                                      .circular(30)
                                              ),
                                              child: ClipRRect(
                                                  borderRadius: BorderRadius
                                                      .circular(30),
                                                  child: Image.asset(
                                                    USER_IMAGE, height: 50,
                                                    width: 50,
                                                    fit: BoxFit.cover,))
                                          ),
                                          SizedBox(width: 10,),
                                          Expanded(
                                            child: CustomField(
                                              size: TSizes.fontSizeMd,
                                              hintText: TTexts.firstName,
                                              icon: Icon(
                                                Icons.person,
                                                color: TColors.info,),
                                              textInputType: TextInputType.text,
                                              textEditingController: fNameCtr,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      CustomField(
                                        size: TSizes.fontSizeMd,
                                        hintText: TTexts.lastName,
                                        icon: Icon(
                                          Icons.person, color: TColors.info,),
                                        textInputType: TextInputType.text,
                                        textEditingController: fNameCtr,
                                      ),
                                      CustomField(
                                        size: TSizes.fontSizeMd,
                                        hintText: TTexts.email,
                                        icon: Icon(
                                          Icons.email_sharp,
                                          color: TColors.info,),
                                        textInputType: TextInputType
                                            .emailAddress,
                                        textEditingController: emailCtr,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Container(
                                          height: 50,
                                          width: context.width,
                                          margin: EdgeInsets.only(top: 5),
                                          padding: EdgeInsets.only(left: 10),
                                          decoration: TWidget.bBoxDecoration,
                                          child: Center(
                                            child: IntlPhoneField(
                                              flagsButtonMargin: EdgeInsets
                                                  .only(
                                                  top: 3.0),
                                              controller: phoneCtr,
                                              textInputAction: TextInputAction
                                                  .next,
                                              showDropdownIcon: false,
                                              autovalidateMode: AutovalidateMode
                                                  .disabled,
                                              /*disableLengthCheck: true,*/
                                              initialCountryCode: TTexts
                                                  .countryCode,
                                              decoration: InputDecoration(
                                                  counterText: "",
                                                  hintStyle: FontsFamily
                                                      .ExtraBold
                                                      .copyWith(
                                                      color: TColors
                                                          .textSecondary,
                                                      fontSize: TSizes
                                                          .fontSizeMd
                                                  ),
                                                  hintText: TTexts.phoneNo,
                                                  focusedBorder: InputBorder
                                                      .none,
                                                  border: InputBorder.none,
                                                  enabledBorder: InputBorder
                                                      .none),
                                              onChanged: (phone) {
                                                setState(
                                                      () {
                                                    countryCode = phone
                                                        .countryCode;
                                                    print(countryCode);
                                                    countryFlag = phone
                                                        .countryISOCode;
                                                    log("${countryFlag}");
                                                  },
                                                );
                                              },
                                              onCountryChanged: (country) {
                                                setState(
                                                      () {
                                                    countryCode = '${country
                                                        .dialCode}';
                                                    print(countryCode);
                                                    countryFlag = country.code;
                                                    print(countryFlag);
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      CustomField(
                                        size: TSizes.fontSizeMd,
                                        hintText: TTexts.password,
                                        textInputType: TextInputType
                                            .visiblePassword,
                                        textEditingController: passwordCtr,
                                        ishide: isHide,
                                        icon: InkWell(
                                          onTap: () {
                                            setState(() {
                                              isHide = !isHide;
                                            });
                                          },
                                          child: isHide
                                              ? Icon(
                                            Icons.visibility_off_outlined,
                                            color: TColors.info,
                                          )
                                              : Icon(
                                            Icons.visibility_outlined,
                                            color: TColors.info,
                                          ),
                                        ),
                                      ),
                                      CustomField(
                                        size: TSizes.fontSizeMd,
                                        hintText: TTexts.password,
                                        textInputType: TextInputType
                                            .visiblePassword,
                                        textEditingController: nPasswordCtr,
                                        ishide: isNewHide,
                                        icon: InkWell(
                                          onTap: () {
                                            setState(() {
                                              isNewHide = !isNewHide;
                                            });
                                          },
                                          child: isNewHide
                                              ? Icon(
                                            Icons.visibility_off_outlined,
                                            color: TColors.info,
                                          )
                                              : Icon(
                                            Icons.visibility_outlined,
                                            color: TColors.info,
                                          ),
                                        ),
                                      ),
                                      CustomField(
                                        size: TSizes.fontSizeMd,
                                        hintText: TTexts.password,
                                        textInputType: TextInputType
                                            .visiblePassword,
                                        textEditingController: rNewPasswordCtr,
                                        ishide: isRNewHide,
                                        icon: InkWell(
                                          onTap: () {
                                            setState(() {
                                              isRNewHide = !isRNewHide;
                                            });
                                          },
                                          child: isRNewHide
                                              ? Icon(
                                            Icons.visibility_off_outlined,
                                            color: TColors.info,
                                          )
                                              : Icon(
                                            Icons.visibility_outlined,
                                            color: TColors.info,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ));
                            }),

                            Obx(() {
                              return Visibility(
                                visible: controller.changeScreen.value ==
                                    TTexts.CarDetailsText,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomField(
                                      size: TSizes.fontSizeMd,
                                      hintText: TTexts.vehicleNumberText,
                                      textInputType: TextInputType.text,
                                      textEditingController: vehicleNumber,
                                    ),
                                    SizedBox(height: 20,),
                                    Container(
                                      decoration: TWidget.bBoxDecoration,
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          dropdownColor: TColors.background,
                                          hint: Text(
                                            TTexts.selectVehicleText,
                                            style: FontsFamily.ExtraBold
                                                .copyWith(
                                              color: TColors.textSecondary,
                                              fontSize: TSizes.fontSizeMd,
                                            ),
                                          ),
                                          value: vehicle,
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            size: 30,
                                          ),
                                          isExpanded: true,
                                          items: vehicleList.map(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text(
                                                    value,
                                                    style: TextStyle(
                                                        color: TColors
                                                            .textPrimary),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).toList(),
                                          onChanged: (value) {
                                            setState(
                                                  () {
                                                vehicle = value;
                                                print("vehicle===>$vehicle");
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center,
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Container(
                                          decoration: TWidget.bBoxDecoration,
                                          child: Container(
                                            width: Get.width / 1.7,
                                            child: Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  horizontal: 15, vertical: 10),
                                              child: Text(
                                                TTexts.drivingLicenceText,
                                                style: FontsFamily.ExtraBold
                                                    .copyWith(
                                                  color: TColors
                                                      .textSecondary,
                                                  fontSize: TSizes.fontSizeMd,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Card(
                                            elevation: 2,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius
                                                    .circular(
                                                    30)
                                            ),
                                            child: ClipRRect(
                                                borderRadius: BorderRadius
                                                    .circular(
                                                    30),
                                                child: Image.asset(
                                                  USER_IMAGE, height: 50,
                                                  width: 50,
                                                  fit: BoxFit.cover,))
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center,
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Container(
                                          decoration: TWidget.bBoxDecoration,
                                          child: Container(
                                            width: Get.width / 1.7,
                                            child: Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  horizontal: 15, vertical: 10),
                                              child: Text(
                                                TTexts.drivingLicenceText,
                                                style: FontsFamily.ExtraBold
                                                    .copyWith(
                                                  color: TColors
                                                      .textSecondary,
                                                  fontSize: TSizes.fontSizeMd,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Card(
                                            elevation: 2,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius
                                                    .circular(
                                                    30)
                                            ),
                                            child: ClipRRect(
                                                borderRadius: BorderRadius
                                                    .circular(
                                                    30),
                                                child: Image.asset(
                                                  USER_IMAGE, height: 50,
                                                  width: 50,
                                                  fit: BoxFit.cover,))
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center,
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Container(
                                          decoration: TWidget.bBoxDecoration,
                                          child: Container(
                                            width: Get.width / 1.7,
                                            child: Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  horizontal: 15, vertical: 10),
                                              child: Text(
                                                TTexts.drivingLicenceText,
                                                style: FontsFamily.ExtraBold
                                                    .copyWith(
                                                  color: TColors
                                                      .textSecondary,
                                                  fontSize: TSizes.fontSizeMd,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Card(
                                            elevation: 2,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius
                                                    .circular(
                                                    30)
                                            ),
                                            child: ClipRRect(
                                                borderRadius: BorderRadius
                                                    .circular(
                                                    30),
                                                child: Image.asset(
                                                  USER_IMAGE, height: 50,
                                                  width: 50,
                                                  fit: BoxFit.cover,))
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 40),
                        child: CustomButton(
                            TTexts.SubmitText, BUTTON_IMAGE, () {

                        }),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
