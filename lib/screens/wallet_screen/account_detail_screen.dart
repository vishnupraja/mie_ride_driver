import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/colors.dart';
import '../../constant/font_family.dart';
import '../../constant/image_string/image_string.dart';
import '../../constant/sizes.dart';
import '../../constant/text_strings.dart';
import '../../utils/static.dart';
class AccountDetail extends StatefulWidget {
  const AccountDetail({super.key});

  @override
  State<AccountDetail> createState() => _AccountDetailState();
}

class _AccountDetailState extends State<AccountDetail> {

  TextEditingController emailCtr = TextEditingController();
  TextEditingController bName = TextEditingController();
  TextEditingController tNumber = TextEditingController();
  TextEditingController iNumber = TextEditingController();
  TextEditingController account = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            SizedBox(height: 30,),
            customAppbar(TTexts.AccountDetailsText),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                    margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                    width: Get.width,
                    decoration: TWidget.bBoxDecoration,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: TColors.background,
                                borderRadius: TWidget.borderRadiusOnly,
                                boxShadow: TWidget.boxShadow,
                              ),
                              child: Center(
                                child: Icon(Icons.check_circle, color: TColors.textPrimary),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(TTexts.InteractEText,
                                  style: FontsFamily.ExtraBold.copyWith(
                                      fontSize: TSizes.fontSizeELg,
                                      color: TColors.textPrimary
                                  ),),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        CustomField(
                          size: TSizes.fontSizeMd,
                          hintText: TTexts.email,
                          textInputType: TextInputType.emailAddress,
                          textEditingController: emailCtr,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                    margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                    width: Get.width,
                    decoration: TWidget.bBoxDecoration,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: TColors.background,
                                borderRadius: TWidget.borderRadiusOnly,
                                boxShadow: TWidget.boxShadow,
                              ),
                              child: Center(
                                child: Icon(Icons.check_circle, color: TColors.rideCompleteColor),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(TTexts.DirectDepositText,
                                  style: FontsFamily.ExtraBold.copyWith(
                                      fontSize: TSizes.fontSizeELg,
                                      color: TColors.textPrimary
                                  ),),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        CustomField(
                          size: TSizes.fontSizeMd,
                          hintText: TTexts.BankNameText,
                          textInputType: TextInputType.text,
                          textEditingController: bName,
                        ),
                        CustomField(
                          size: TSizes.fontSizeMd,
                          hintText: TTexts.TransitNumberText,
                          textInputType: TextInputType.text,
                          textEditingController: tNumber,
                        ),
                        CustomField(
                          size: TSizes.fontSizeMd,
                          hintText: TTexts.InstitutionNumberText,
                          textInputType: TextInputType.text,
                          textEditingController: iNumber,
                        ),
                        CustomField(
                          size: TSizes.fontSizeMd,
                          hintText: TTexts.AccountText,
                          textInputType: TextInputType.text,
                          textEditingController: account,
                        ),
                        SizedBox(height: 20,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: TWidget.bBoxDecoration,
                              child: Container(
                                width: Get.width/1.6,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                                  child: Text(TTexts.UploadDirectDepositText,
                                    style: FontsFamily.ExtraBold.copyWith(
                                        color: TColors.textSecondary,
                                        fontSize: TSizes.fontSizeMd
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.asset(USER_IMAGE,height: 50,width: 50,fit: BoxFit.cover,))
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 40,
                    width: Get.width/2,
                    decoration: TWidget.bBoxDecoration,
                    child: Center(
                      child: Text(TTexts.SaveChangesText,
                      style: FontsFamily.ExtraBold.copyWith(
                        fontSize: TSizes.fontSizeMd,
                        color: TColors.textPrimary
                      ),),
                    ),
                  ),
                ],
              ),
            ),
          )
          ],
        ),
      ),
    );
  }
}
