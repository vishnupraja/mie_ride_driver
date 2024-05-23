import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mie_ride_driver/constant/colors.dart';
import 'package:mie_ride_driver/constant/font_family.dart';
import 'package:mie_ride_driver/controllers/auth_controller.dart';

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

  String countryCode = "";
  String countryFlag = "";

  final controller = Get.find<ProfileController>();

  List<String> vehicleList = ["hero", "honda", "Bullet"];


  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Get.find<AuthController>().fetchCars();
      controller.fetchProfile().then((value) {
        if (value == "successfully") {
          fNameCtr.text = TTexts.name;
          lNameCtr.text = TTexts.lastN;
          emailCtr.text = TTexts.Email;
          phoneCtr.text = TTexts.Phone;
          vehicleNumber.text = TTexts.vehicleN;
          selectedCarId = TTexts.vehicle;
          countryCode = TTexts.countryCode;
          countryFlag = TTexts.countryFlag;
        }
      });
    });
  }

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
                      child: Icon(
                        Icons.arrow_back_ios, color: TColors.textPrimary,
                        size: 20,),
                    )
                ),
              ),
            ),
          ),
        ),
        title: Text(TTexts.ProfileText,
          textAlign: TextAlign.center,
          style: FontsFamily.ExtraBold.copyWith(
            color: TColors.textPrimary,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if(controller.profileLoad.value){
          return Center(child: SizedBox(),);
        }else
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 10, vertical: 20),
                margin: EdgeInsets.symmetric(
                    horizontal: 10, vertical: 10),
                decoration:controller.changeScreen.value == TTexts.PersonalText?TWidget.lShadow:TWidget.rShadow,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.changeScreen.value = TTexts.PersonalText;
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 15),
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: TWidget.rShadow,
                            child: Center(
                              child: Obx(() {
                                return Text(TTexts.PersonalText,
                                  style: FontsFamily.ExtraBold.copyWith(
                                      fontSize: 13,
                                      color: controller.changeScreen.value !=
                                          TTexts.PersonalText ? TColors
                                          .textPrimary : TColors.info
                                  ),);
                              }),
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            controller.changeScreen.value =
                                TTexts.CarDetailsText;
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 15),
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: TWidget.rShadow,
                            child: Center(
                              child: Obx(() {
                                return Text(TTexts.CarDetailsText,
                                  style: FontsFamily.ExtraBold.copyWith(
                                      fontSize: 13,
                                      color: controller.changeScreen.value !=
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
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.status.value = "4";
                                        _showImagePickerBottomSheet(context);
                                      },
                                      child: Card(
                                          elevation: 2,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius
                                                  .circular(30)
                                          ),
                                          child: ClipRRect(
                                              borderRadius: BorderRadius
                                                  .circular(30),
                                              child: controller
                                                  .profileImageString.value ==
                                                  null ?
                                              FadeInImage.assetNetwork(
                                                placeholder: 'assets/userload.gif',
                                                width: 50,
                                                height: 50,
                                                fit: BoxFit.cover,
                                                image: profileImage,
                                                imageErrorBuilder: (c, o,
                                                    s) =>
                                                    Image.asset(
                                                      USER_IMAGE, height: 50,
                                                      width: 50,
                                                      fit: BoxFit.cover,
                                                    ),
                                              ) : Image.file(File(
                                                  controller
                                                      .profileImageString
                                                      .value!
                                                      .path), height: 50,
                                                width: 50,
                                                fit: BoxFit.cover,))
                                      ),
                                    ),
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
                                textEditingController: lNameCtr,
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
                                      controller: phoneCtr,
                                      textInputAction: TextInputAction
                                          .next,
                                      showDropdownIcon: false,
                                      autovalidateMode: AutovalidateMode
                                          .disabled,
                                      /*disableLengthCheck: true,*/
                                      initialCountryCode: countryFlag,
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
                                hintText: TTexts.oldPassText,
                                textInputType: TextInputType
                                    .visiblePassword,
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
                                hintText: TTexts.newPassText,
                                textInputType: TextInputType
                                    .visiblePassword,
                                textEditingController: nPasswordCtr,
                                ishide: isNewHide,
                                icon: GestureDetector(
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
                                hintText: TTexts.reNewPassword,
                                textInputType: TextInputType
                                    .visiblePassword,
                                textEditingController: rNewPasswordCtr,
                                ishide: isRNewHide,
                                icon: GestureDetector(
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
                              height: 50,
                              decoration: TWidget.rShadow,
                              child: Obx(() {
                                if (Get
                                    .find<AuthController>()
                                    .vehicleLoading
                                    .value) {
                                  return Center(
                                    child: CircularProgressIndicator(),);
                                } else {
                                  return PopupMenuButton<String>(
                                    color: TColors.background,
                                    constraints: BoxConstraints.tightFor(
                                        width: Get.width / 1.2),
                                    offset: Offset(0, 40),
                                    // Shift menu down by 40 pixels (adjust as needed)
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20),
                                      decoration: BoxDecoration(
                                        color: TColors.background,
                                        // Add border for visual separation
                                        borderRadius: BorderRadius.circular(
                                            8.0), // Add border radius for rounded corners
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text(
                                            selectedCarId != "" ? _getCarName(
                                                selectedCarId!) : TTexts
                                                .selectVehicleText,
                                            style: FontsFamily.ExtraBold
                                                .copyWith(
                                              color: selectedCarId != ""
                                                  ? TColors.textPrimary
                                                  : TColors.textSecondary,
                                              fontSize: 15,
                                            ),
                                          ),
                                          Icon(Icons.arrow_drop_down),
                                        ],
                                      ),
                                    ),
                                    itemBuilder: (BuildContext context) {
                                      return Get
                                          .find<AuthController>()
                                          .vehicleList
                                          .map((value) {
                                        return PopupMenuItem<String>(
                                          value: value['car_id'],
                                          child: Container(
                                            width: double.infinity,
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                value['car_name'],
                                                style: TextStyle(
                                                    color: TColors
                                                        .textPrimary),
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList();
                                    },
                                    onSelected: (String value) {
                                      setState(() {
                                        selectedCarId =
                                            value; // Store the selected car ID
                                        print(
                                            "selectedCarId===>$selectedCarId");
                                      });
                                    },
                                  );
                                }
                              }),
                            ),
                            SizedBox(height: 20,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment
                                  .center,
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.status.value = "1";
                                    _showImagePickerBottomSheet(context);
                                  },
                                  child: Container(
                                    decoration: TWidget.rShadow,
                                    child: Container(
                                      width: Get.width / 1.7,
                                      child: Padding(
                                        padding: const EdgeInsets
                                            .symmetric(
                                            horizontal: 15, vertical: 10),
                                        child: Text(
                                          "Change Driving licence",
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
                                        child: controller.licenceImageString
                                            .value == null ?
                                        FadeInImage.assetNetwork(
                                          placeholder: 'assets/userload.gif',
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover,
                                          image: LImage,
                                          imageErrorBuilder: (c, o, s) =>
                                              Image.asset(
                                                USER_IMAGE, height: 50,
                                                width: 50,
                                                fit: BoxFit.cover,
                                              ),
                                        ) : Image.file(File(
                                            controller.licenceImageString
                                                .value!
                                                .path), height: 50,
                                          width: 50,
                                          fit: BoxFit.cover,)
                                    )
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
                                GestureDetector(
                                  onTap: () {
                                    controller.status.value = "2";
                                    _showImagePickerBottomSheet(context);
                                  },
                                  child: Container(
                                    decoration: TWidget.rShadow,
                                    child: Container(
                                      width: Get.width / 1.7,
                                      child: Padding(
                                        padding: const EdgeInsets
                                            .symmetric(
                                            horizontal: 15, vertical: 10),
                                        child: Text(
                                          "Change Insurance",
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
                                        child: controller.insuranceImageString
                                            .value == null ?
                                        FadeInImage.assetNetwork(
                                          placeholder: 'assets/userload.gif',
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover,
                                          image: IImage,
                                          imageErrorBuilder: (c, o, s) =>
                                              Image.asset(
                                                USER_IMAGE, height: 50,
                                                width: 50,
                                                fit: BoxFit.cover,
                                              ),
                                        ) : Image.file(File(
                                            controller.insuranceImageString
                                                .value!
                                                .path), height: 50,
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
                                GestureDetector(
                                  onTap: () {
                                    controller.status.value = "3";
                                    _showImagePickerBottomSheet(context);
                                  },
                                  child: Container(
                                    decoration: TWidget.rShadow,
                                    child: Container(
                                      width: Get.width / 1.7,
                                      child: Padding(
                                        padding: const EdgeInsets
                                            .symmetric(
                                            horizontal: 15, vertical: 10),
                                        child: Text(
                                          "Change ownership",
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
                                        child: controller.ownerImageString
                                            .value == null ?
                                        FadeInImage.assetNetwork(
                                          placeholder: 'assets/userload.gif',
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover,
                                          image: OImage,
                                          imageErrorBuilder: (c, o, s) =>
                                              Image.asset(
                                                USER_IMAGE, height: 50,
                                                width: 50,
                                                fit: BoxFit.cover,
                                              ),
                                        ) : Image.file(File(
                                            controller.ownerImageString.value!
                                                .path), height: 50,
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
                    horizontal: 20, vertical: 20),
                child: CustomButton(
                    TTexts.SubmitText, BUTTON_IMAGE, () {
                  controller.fNameCtr.value = fNameCtr.text;
                  controller.lNameCtr.value = lNameCtr.text;
                  controller.emailCtr.value = emailCtr.text;
                  controller.passwordCtr.value = nPasswordCtr.text;
                  controller.phoneCtr.value = phoneCtr.text;
                  valid();
                }),
              )
            ],
          ),
        );
      }),
    );
  }

  void _showImagePickerBottomSheet(BuildContext context) {
    ImageHelper.showImagePickerBottomSheet(context, _pickImage);
  }

  void _pickImage(ImageSource source, Function(File) setImageFile) async {
    ImageHelper.pickImage(source, (file) {
      if (controller.status.value == "1") {
        controller.licenceImageString.value = file;
      } else if (controller.status.value == "2") {
        controller.insuranceImageString.value = file;
      } else if (controller.status.value == "3") {
        controller.ownerImageString.value = file;
      } else {
        controller.profileImageString.value = file;
      }
      Navigator.pop(context);
    });
  }


  String? selectedCarId = "";

  String _getCarName(String carId) {
    var car = Get
        .find<AuthController>()
        .vehicleList
        .firstWhere((element) => element['car_id'] == carId, orElse: () => {});
    return car.isNotEmpty
        ? car['car_name']
        : ''; // Return car name or empty string if not found
  }

  void valid() async {
    if (passwordCtr.text.isNotEmpty) {
      print("vi");
      if (nPasswordCtr.text.isEmpty) {
        customSnackBar("Please enter new password");
      }
      else if (rNewPasswordCtr.text.isEmpty) {
        customSnackBar("Please Re-enter new password");
      }
      else if (nPasswordCtr.text != rNewPasswordCtr.text) {
        customSnackBar("Password and Re-new password does not match");
      }
      else {

        controller.updateProfile(vehicleNumber.text, selectedCarId.toString(),
            countryCode.toString(), countryFlag.toString(), passwordCtr.text,context);
        passwordCtr.text = "";
        nPasswordCtr.text = "";
        rNewPasswordCtr.text = "";
      }
    } else {
      controller.updateProfile(
          vehicleNumber.text, selectedCarId.toString(), countryCode.toString(),
          countryFlag.toString(), passwordCtr.text,context);
      passwordCtr.text = "";
      nPasswordCtr.text = "";
      rNewPasswordCtr.text = "";
    }
  }


}
