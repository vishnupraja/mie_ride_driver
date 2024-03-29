import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mie_ride_driver/constant/colors.dart';
import 'package:mie_ride_driver/constant/font_family.dart';
import 'package:mie_ride_driver/constant/text_strings.dart';
import 'package:mie_ride_driver/route_helper/Route_Helper.dart';

import '../../constant/image_string/image_string.dart';
import '../../utils/static.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  TextEditingController fNameCtr = TextEditingController();
  TextEditingController lNameCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  TextEditingController phoneCtr = TextEditingController();

  bool isHide = true;

  String countryCode = TTexts.countryCode;
  String countryFlag = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50,),
              customAppbar(TTexts.AccountText),
              Column(
                children: [
                  SizedBox(height: 20,),
                  Text(TTexts.STEPText,
                    style: FontsFamily.Extralight.copyWith(
                        color: TColors.textPrimary,
                        fontSize: 20
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(TTexts.createAccount,
                    style: FontsFamily.ExtraBold.copyWith(
                        color: TColors.textPrimary,
                        fontSize: 15
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 10.0),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(
                              color: Colors.black.withOpacity(0.1)
                          ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                        child: Column(
                          children: [
                            CustomField(
                              hintText: TTexts.firstName,
                              icon: Icon(Icons.person,color: TColors.textPrimary,),
                              textInputType: TextInputType.text,
                              textEditingController: fNameCtr,
                            ),
                            CustomField(
                              hintText: TTexts.lastName,
                              icon: Icon(Icons.person,color: TColors.textPrimary,),
                              textInputType: TextInputType.text,
                              textEditingController: lNameCtr,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Container(
                                height: 50,
                                width: context.width,
                                margin: EdgeInsets.only(top: 5),
                                padding: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: TColors.background,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(2, 2),
                                      blurRadius: 0.1,
                                      color: Color.fromRGBO(0, 0, 0, 0.16),
                                    )],
                                ),
                                child: Center(
                                  child: IntlPhoneField(
                                    controller: phoneCtr,
                                    textInputAction: TextInputAction.next,
                                    showDropdownIcon: false,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    /*disableLengthCheck: true,*/
                                    initialCountryCode: TTexts.countryCode,
                                    decoration: const InputDecoration(
                                        counterText: "",
                                        hintStyle:
                                        TextStyle(color: TColors.textSecondary, fontSize: 12),
                                        hintText: TTexts.phoneNo,
                                        focusedBorder: InputBorder.none,
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none),
                                    onChanged: (phone) {
                                      setState(
                                            () {
                                          countryCode = phone.countryCode;
                                          print(countryCode);
                                          countryFlag = phone.countryISOCode;
                                          log("${countryFlag}");
                                        },
                                      );
                                    },
                                    onCountryChanged: (country) {
                                      setState(
                                            () {
                                          countryCode = '${country.dialCode}';
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
                              hintText: TTexts.email,
                              icon: Icon(Icons.email_sharp,color: TColors.textPrimary,),
                              textInputType: TextInputType.emailAddress,
                              textEditingController: emailCtr,
                            ),
                            CustomField(
                              hintText: TTexts.password,
                              textInputType: TextInputType.visiblePassword,
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
                                  color: TColors.black,
                                )
                                    : Icon(
                                  Icons.visibility_outlined,
                                  color: TColors.black,
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Card(
                                  elevation: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                    child: Center(
                                      child: Text(TTexts.profilePhotoText,
                                        style: FontsFamily.ExtraBold.copyWith(
                                            color: TColors.textSecondary,
                                            fontSize: 15
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Card(
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                      child: Image.asset(USER_IMAGE,height: 50,))
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 20),
                child: CustomButton(TTexts.signupButton1Text,BUTTON_IMAGE, () {
                  Get.toNamed(RouteHelper.getSignupPage2());
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
