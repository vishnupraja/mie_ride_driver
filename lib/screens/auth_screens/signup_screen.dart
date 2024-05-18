import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mie_ride_driver/constant/colors.dart';
import 'package:mie_ride_driver/constant/font_family.dart';
import 'package:mie_ride_driver/constant/text_strings.dart';
import 'package:mie_ride_driver/route_helper/Route_Helper.dart';

import '../../constant/image_string/image_string.dart';
import '../../controllers/auth_controller.dart';
import '../../utils/static.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  var controller = Get.find<AuthController>();

  TextEditingController fNameCtr    = TextEditingController();
  TextEditingController lNameCtr    = TextEditingController();
  TextEditingController emailCtr    = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  TextEditingController phoneCtr    = TextEditingController();

  bool isHide = true;

  String countryFlag = TTexts.countryFlag;
  String countryCode = "";


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: TColors.background,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Card(
                color: TColors.background,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Icon(Icons.arrow_back_ios,
                          color: TColors.textPrimary, size: 20,),
                      )
                  ),
                ),
              ),
            ),
          ),
          title: Text(TTexts.AccountText,
            textAlign: TextAlign.center,
            style: FontsFamily.ExtraBold.copyWith(
              color: TColors.textPrimary,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10,),
                Text(TTexts.STEPText,
                  style: FontsFamily.ExtraBolds.copyWith(
                      color: TColors.textPrimary,
                      fontSize: 20
                  ),
                ),
                SizedBox(height: 10,),
                Text(TTexts.createAccount,
                  style: FontsFamily.ExtraBold.copyWith(
                      color: TColors.textPrimary,
                      fontSize: 18,
                      letterSpacing: 2
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 15.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 5.0),
                    decoration: BoxDecoration(

                        color: TColors.background,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: TWidget.boxShadow
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomField(
                            hintText: TTexts.firstName,
                            icon: Icon(
                              Icons.person, color: TColors.textPrimary,),
                            textInputType: TextInputType.text,
                            textEditingController: fNameCtr,
                          ),
                          CustomField(
                            hintText: TTexts.lastName,
                            icon: Icon(
                              Icons.person, color: TColors.textPrimary,),
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
                              decoration: TWidget.rShadow,
                              child: Center(
                                child: IntlPhoneField(
                                  flagsButtonMargin: EdgeInsets.only(top: 3.0),
                                  controller: phoneCtr,
                                  textInputAction: TextInputAction.next,
                                  showDropdownIcon: false,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  /*disableLengthCheck: true,*/
                                  initialCountryCode: TTexts.countryFlag,
                                  decoration: InputDecoration(
                                      counterText: "",
                                      hintStyle:
                                      FontsFamily.ExtraBold.copyWith(
                                          color: TColors.textSecondary,
                                          fontSize: 15),
                                      hintText: TTexts.phoneNo,
                                      focusedBorder: InputBorder.none,
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none),
                                  onChanged: (phone) {
                                    setState(
                                          () {
                                       controller.code.value = phone.countryCode;
                                        print(controller.code.value);
                                       controller.flag.value = phone.countryISOCode;
                                        log("${controller.flag.value}");
                                      },
                                    );
                                  },
                                  onCountryChanged: (country) {
                                    setState(
                                          () {
                                            controller.code.value = '+${country.dialCode}';
                                        print(countryCode);
                                            controller.flag.value = country.code;
                                        print(controller.flag.value);
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          CustomField(
                            hintText: TTexts.email,
                            icon: Icon(
                              Icons.email_sharp, color: TColors.textPrimary,),
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
                          SizedBox(height: 25,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  _showImagePickerBottomSheet(context);
                                },
                                child: Container(
                                  decoration: TWidget.rShadow,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
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
                              ),
                              Card(
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: controller.profileImageString.value == null ?
                                      Image.asset(USER_IMAGE, height: 50,
                                        width: 50,
                                        fit: BoxFit.cover,)
                                          : Image.file(
                                          File(controller.profileImageString.value!.path), height: 50,
                                          width: 50,
                                          fit: BoxFit.cover)
                                  )
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 20),
                  child: Center(
                    child: CustomButton(
                        TTexts.signupButton1Text, BUTTON_IMAGE, () {
                          controller.fNameCtr.value = fNameCtr.text;
                          controller.lNameCtr.value = lNameCtr.text;
                          controller.emailCtr.value = emailCtr.text;
                          controller.passwordCtr.value = passwordCtr.text;
                          controller.phoneCtr.value = phoneCtr.text;
                          validation();
                    }),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }


  void validation()async{

    if(fNameCtr.text.isEmpty){
      customSnackBar("Please enter first name");
    }else if(lNameCtr.text.isEmpty){
      customSnackBar("Please enter last name");
    }else if(phoneCtr.text.isEmpty){
      customSnackBar("Please enter mobile number");
    }else if(emailCtr.text.isEmpty){
      customSnackBar("Please enter email address");
    }else if(!isValidEmail(emailCtr.text)){
      customSnackBar("Please enter valid email address");
    }else if(passwordCtr.text.isEmpty){
      customSnackBar("Please enter your password");
    }else if(controller.profileImageString.value == null){
      customSnackBar("Please upload profile photo");
    }else{
      Get.toNamed(RouteHelper.getSignupPage2());
    }

  }



  void _showImagePickerBottomSheet(BuildContext context) {
    ImageHelper.showImagePickerBottomSheet(context, _pickImage);
  }

  void _pickImage(ImageSource source, Function(File) setImageFile) async {
    ImageHelper.pickImage(source, (file) {
      controller.profileImageString.value = file;
      Navigator.pop(context);
    });
  }
}

