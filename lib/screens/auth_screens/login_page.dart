import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mie_ride_driver/constant/text_strings.dart';

import '../../constant/colors.dart';
import '../../constant/font_family.dart';
import '../../constant/image_string/image_string.dart';
import '../../constant/sizes.dart';
import '../../route_helper/Route_Helper.dart';
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

  String countryCode = "US";
  String countryFlag = "";

  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: TWidget.boxDecoration,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset(LANDING_IMAGE,height: height/3,width: width/1.7 ,),
              ),
            ),
            SizedBox(height: 30.0,),
            Text("MIE RIDE",
              style:FontsFamily.bropames.copyWith(
                color: TColors.textPrimary,
                fontSize: 35,
              ) ,
            ),
            Text("DRIVER",
              style:FontsFamily.bropames.copyWith(
                color: TColors.info,
                fontSize: 35,
              ) ,
            ),
            SizedBox(height: 10,),
            Text("Unlock your journey with ease",
              textAlign: TextAlign.center,
              style: FontsFamily.ExtraBold.copyWith(
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
                decoration: TWidget.bBoxDecoration,
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35,vertical: 5),
              child: CustomField(
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
              padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 40),
              child: CustomButton(TTexts.loginButtonText,BUTTON_IMAGE, () {
                Get.offNamed(RouteHelper.getBottomPage());
              }),
            )
          ],
        ),
      ),
    );
  }
}
