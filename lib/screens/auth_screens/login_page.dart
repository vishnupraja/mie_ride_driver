import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mie_ride_driver/constant/text_strings.dart';
import 'package:mie_ride_driver/controllers/auth_controller.dart';
import 'package:mie_ride_driver/screens/loader.dart';

import '../../constant/colors.dart';
import '../../constant/font_family.dart';
import '../../constant/image_string/image_string.dart';
import '../../constant/sizes.dart';


import '../../myApp.dart';

import '../../utils/static.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController passwordCtr = TextEditingController();
  TextEditingController phoneCtr = TextEditingController();
  bool isHide = true;

  String countryCode = "";
  String countryFlag = "US";

  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: TWidget.boxDecoration,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset(LANDING_IMAGE,height: height/3,width: width/2 ,),
              ),
            ),
            SizedBox(height: 20.0,),
            Container(
              height: 40,
              child: Text("MIE RIDE",
                style:FontsFamily.bropames.copyWith(
                  color: TColors.textPrimary,
                  fontSize: 40,
                  letterSpacing: 1
                ) ,
              ),
            ),
            Container(
              height: 40,
              child: Text("DRIVER",
                style:FontsFamily.bropames.copyWith(
                  color: TColors.buttonPrimary,
                  fontSize: 40,
                    letterSpacing: 1
                ) ,
              ),
            ),
            SizedBox(height: 20,),
            Text("Unlock your journey with ease",
              textAlign: TextAlign.center,
              style: FontsFamily.Extralight.copyWith(
                color: TColors.textPrimary,
                fontSize: TSizes.fontSizeMd,
              ) ,
            ),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: Container(
                height: 50,
                width: context.width,
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.only(left: 10),
                decoration: TWidget.rShadow,
                child: Center(
                  child: IntlPhoneField(
                    style: FontsFamily.ExtraBold.copyWith(
                        color: TColors.textPrimary,
                        fontSize: TSizes.fontSizeMd
                    ),
                    dropdownTextStyle: FontsFamily.ExtraBold
                        .copyWith(
                        color: TColors.textPrimary,
                        fontSize: TSizes.fontSizeMd
                    ),
                    flagsButtonMargin: EdgeInsets.only(bottom: 7.0),
                    controller: phoneCtr,
                    textInputAction: TextInputAction.next,
                    showDropdownIcon: false,
                    autovalidateMode: AutovalidateMode.disabled,
                    initialCountryCode: TTexts.countryFlag,
                    decoration:  InputDecoration(
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35,),
              child: CustomField(
                hintText: TTexts.password,
                textInputType: TextInputType.visiblePassword,
                textEditingController: passwordCtr,
                ishide: isHide,
                icon: GestureDetector(
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
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(color: TColors.textPrimary),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 20),
              child: CustomButton(TTexts.loginButtonText,BUTTON_IMAGE, () {
                getData();
              }),
            )
          ],
        ),
      ),
    );
  }

  void getData()async{
    if(phoneCtr.text.isEmpty){
      customSnackBar("Please enter mobile number");
    }else if(passwordCtr.text.isEmpty){
      customSnackBar("Please enter your password");
    }else{
      Get.find<AuthController>().login(phoneCtr.text, passwordCtr.text, countryCode.toString());
    }
  }

}
