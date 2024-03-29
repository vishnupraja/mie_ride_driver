import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/constant/sizes.dart';
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

  TextEditingController vehicleNumber = TextEditingController();

  List<String> vehicleList = ["hero", "honda", "Bullet"];
  
  var vehicle = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50,),
              customAppbar(TTexts.AccountText),
              Column(
                children: [
                  SizedBox(height: 20,),
                  Text(TTexts.STEPText2,
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
                      color: TColors.textWhite,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(
                              color: Colors.black.withOpacity(0.1)
                          ),),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
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
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(2, 2),
                                      blurRadius: 0.1,
                                      color: Color.fromRGBO(0, 0, 0, 0.16),
                                    )],
                                  color: TColors.background
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  dropdownColor: TColors.white,
                                  hint: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      TTexts.selectVehicleText,
                                      style: FontsFamily.ExtraBold.copyWith(
                                          color: TColors.textSecondary, fontSize: 12
                                      ),
                                    ),
                                  ),
                                  value: vehicle,
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 25,
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
                                            style: TextStyle(color: TColors.textPrimary),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Card(
                                  elevation: 2,
                                  child: Container(
                                    width: Get.width/1.7,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                      child: Text(TTexts.drivingLicenceText,
                                        style: FontsFamily.ExtraBold.copyWith(
                                            color: TColors.textSecondary,
                                            fontSize: TSizes.fontSizeSm
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
                                        child: Image.asset(USER_IMAGE,height: 50,fit: BoxFit.cover,))
                                ),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Card(
                                  elevation: 2,
                                  child: Container(
                                    width: Get.width/1.7,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                      child: Text(TTexts.drivingLicenceText,
                                        style: FontsFamily.ExtraBold.copyWith(
                                            color: TColors.textSecondary,
                                            fontSize: TSizes.fontSizeSm
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
                                        child: Image.asset(USER_IMAGE,height: 50,fit: BoxFit.cover,))
                                ),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Card(
                                  elevation: 2,
                                  child: Container(
                                    width: Get.width/1.7,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                      child: Text(TTexts.drivingLicenceText,
                                        style: FontsFamily.ExtraBold.copyWith(
                                            color: TColors.textSecondary,
                                            fontSize: TSizes.fontSizeSm
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
                                        child: Image.asset(USER_IMAGE,height: 50,fit: BoxFit.cover,))
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,top: 10),
                    child: Row(
                      children: [
                        Card(
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Image.asset(SIGNUP_PRI_IMAGE,height: 20,),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(child: Text(TTexts.signupPrivacyText,
                        style: FontsFamily.ExtraBold.copyWith(
                          color: TColors.textPrimary,
                          fontSize: TSizes.fontSizeSm
                        ),
                        ))
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 40),
                child: CustomButton(TTexts.signupButton2Text,BUTTON_IMAGE, () {
                  Get.offNamed(RouteHelper.getLoginPage());
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
