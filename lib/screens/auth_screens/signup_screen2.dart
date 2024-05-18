import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mie_ride_driver/constant/sizes.dart';
import 'package:mie_ride_driver/controllers/auth_controller.dart';
import 'package:mie_ride_driver/route_helper/Route_Helper.dart';

import '../../constant/colors.dart';
import '../../constant/font_family.dart';
import '../../constant/image_string/image_string.dart';
import '../../constant/text_strings.dart';
import '../../utils/static.dart';

class SignupScreen2 extends StatefulWidget {
  const SignupScreen2({super.key});

  @override
  State<SignupScreen2> createState() => _SignupScreen2State();
}

class _SignupScreen2State extends State<SignupScreen2> {

  var controller = Get.find<AuthController>();

  TextEditingController vehicleNumber = TextEditingController();

  List<String> vehicleList = ["hero", "honda", "Bullet"];

  var vehicle = null;

  @override
  void initState() {
    super.initState();
    controller.fetchCars();
  }

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
                Text(TTexts.STEPText2,
                  style: FontsFamily.ExtraBolds.copyWith(
                      color: TColors.textPrimary,
                      fontSize: 25
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 10.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 15.0),
                    decoration: TWidget.rShadow,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomField(
                            hintText: TTexts.vehicleNumberText,
                            textInputType: TextInputType.text,
                            textEditingController: vehicleNumber,
                          ),
                          SizedBox(height: 20,),
                          Container(
                            height: 50,
                            decoration: TWidget.rShadow,
                            child: Obx(() {
                              if(controller.vehicleLoading.value){
                                return Center(child: CircularProgressIndicator(),);
                              }else{
                                return PopupMenuButton<String>(
                                  color: TColors.background,
                                  constraints: BoxConstraints.tightFor(width: Get.width/1.2),
                                  offset: Offset(0, 40), // Shift menu down by 40 pixels (adjust as needed)
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                      color: TColors.background,
                                      // Add border for visual separation
                                      borderRadius: BorderRadius.circular(8.0), // Add border radius for rounded corners
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          selectedCarId != "" ? _getCarName(selectedCarId!) : TTexts.selectVehicleText,
                                          style: FontsFamily.ExtraBold.copyWith(
                                            color: selectedCarId != "" ? TColors.textPrimary : TColors.textSecondary,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Icon(Icons.arrow_drop_down),
                                      ],
                                    ),
                                  ),
                                  itemBuilder: (BuildContext context) {
                                    return controller.vehicleList.map((value) {
                                      return PopupMenuItem<String>(
                                        value: value['car_id'],
                                        child: Container(
                                          width: double.infinity,
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              value['car_name'],
                                              style: TextStyle(color: TColors.textPrimary),
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList();
                                  },
                                  onSelected: (String value) {
                                    setState(() {
                                      selectedCarId = value; // Store the selected car ID
                                      print("selectedCarId===>$selectedCarId");
                                    });
                                  },
                                );
                              }

                            }),
                          ),
                          SizedBox(height: 20,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.status.value = "1";
                                  _showImagePickerBottomSheet(context);
                                },
                                child: Container(
                                  width: Get.width / 1.7,
                                  decoration: TWidget.rShadow,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 12),
                                    child: Text(TTexts.drivingLicenceText,
                                      style: FontsFamily.ExtraBold.copyWith(
                                          color: TColors.textSecondary,
                                          fontSize: TSizes.fontSizeMd
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    color: TColors.background,
                                    borderRadius: BorderRadius.circular(30),

                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: Offset(
                                            -2, 2), // Adjust these values
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: controller.licenceImageString.value == null ?
                                      Image.asset(USER_IMAGE, height: 50,
                                        width: 50,
                                        fit: BoxFit.cover,) :
                                      Image.file(File(
                                          controller.licenceImageString.value!
                                              .path), height: 50,
                                        width: 50,
                                        fit: BoxFit.cover,)
                                  )
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.status.value = "2";
                                  _showImagePickerBottomSheet(context);
                                },
                                child: Container(
                                  width: Get.width / 1.7,
                                  decoration: TWidget.rShadow,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 12),
                                    child: Text(TTexts.OwnershipText,
                                      style: FontsFamily.ExtraBold.copyWith(
                                          color: TColors.textSecondary,
                                          fontSize: TSizes.fontSizeMd
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    color: TColors.background,
                                    borderRadius: BorderRadius.circular(30),

                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: Offset(
                                            -2, 2), // Adjust these values
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: controller.
                                    ownerImageString1
                                        .value == null ?
                                    Image.asset(USER_IMAGE, height: 50,
                                      width: 50,
                                      fit: BoxFit.cover,) :
                                    Image.file(File(
                                        controller.ownerImageString1.value!
                                            .path), height: 50,
                                      width: 50,
                                      fit: BoxFit.cover,),
                                  )
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.status.value = "3";
                                  _showImagePickerBottomSheet(context);
                                },
                                child: Container(
                                  width: Get.width / 1.7,
                                  decoration: TWidget.rShadow,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 12),
                                    child: Text(TTexts.InsuranceText,
                                      style: FontsFamily.ExtraBold.copyWith(
                                          color: TColors.textSecondary,
                                          fontSize: TSizes.fontSizeMd
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: TColors.background,
                                  borderRadius: BorderRadius.circular(30),

                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(
                                          -2, 2), // Adjust these values
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: controller.insuranceImageString.value ==
                                      null ?
                                  Image.asset(USER_IMAGE, height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,) :
                                  Image.file(File(
                                      controller.insuranceImageString.value!
                                          .path), height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Image.asset(SIGNUP_PRI_IMAGE, height: 20,),
                        ),
                      ),
                      SizedBox(width: 25,),
                      Expanded(child: Text(TTexts.signupPrivacyText,
                        style: FontsFamily.ExtraBold.copyWith(
                            color: TColors.textPrimary,
                            fontSize: 12
                        ),
                      ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 60, vertical: 40),
                  child: CustomButton(
                      TTexts.signupButton2Text, BUTTON_IMAGE, () {
                    validation();
                  }),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  String? selectedCarId = "";

  String _getCarName(String carId) {
    var car = controller.vehicleList.firstWhere((element) => element['car_id'] == carId, orElse: () => {});
    return car.isNotEmpty ? car['car_name'] : ''; // Return car name or empty string if not found
  }

  void validation()async{

    if(vehicleNumber.text.isEmpty){
      customSnackBar("Please enter vehicle number");
    }else if(selectedCarId == ""){
      customSnackBar("Please select vehicle");
    }else if(controller.licenceImageString.value == null){
      customSnackBar("Please upload licence");
    }else if(controller.ownerImageString1.value == null){
      customSnackBar("Please upload ownership");
    }else if(controller.insuranceImageString.value == null){
      customSnackBar("Please upload insurance");
    }else{
      controller.signup(
          vehicleNumber.text,
          selectedCarId,
         );
    }

  }

  void _showImagePickerBottomSheet(BuildContext context) {
    ImageHelper.showImagePickerBottomSheet(context, _pickImage);
  }

  void _pickImage(ImageSource source, Function(File) setImageFile) async {
    ImageHelper.pickImage(source, (file) {
      if (controller.status.value == "1") {
        controller.licenceImageString.value = file;
      } else if (controller.status.value == "2") {
        controller.ownerImageString1.value = file;
      } else {
        controller.insuranceImageString.value = file;
      }
      print("path -------${controller.licenceImageString.value}");
      Navigator.pop(context);
    });
  }


}
