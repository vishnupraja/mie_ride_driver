import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mie_ride_driver/controllers/wallet_controller.dart';
import 'package:photo_view/photo_view.dart';
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

  String email = "";
  String deposit = "";

  final controller = Get.find<WalletController>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,(){
      controller.fetchBankDetails(() {

        emailCtr.text = controller.emailCtr.value;
        bName.text = controller.bName.value;
        tNumber.text = controller.tNumber.value;
        iNumber.text = controller.iNumber.value;
        account.text = controller.account.value;
        if (controller.type.value == "Direct_Deposite") {
          deposit = controller.type.value;
        } else {
          email = controller.type.value;
        }
        setState(() {

        });

      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              SizedBox(height: 30,),
              customAppbar(TTexts.AccountDetailsText),
              SizedBox(height: 20,),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20,
                            horizontal: 10),
                        margin: EdgeInsets.symmetric(horizontal: 5,
                            vertical: 5),
                        width: Get.width,
                        decoration: TWidget.rShadow,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      email = "Interac_Etransfer";
                                      deposit = "";
                                    });
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: TWidget.rShadow,
                                    child: Center(
                                      child: Icon(Icons.check_circle,
                                          color: email == "Interac_Etransfer" ? TColors
                                              .rideCompleteColor : TColors
                                              .textPrimary),
                                    ),
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
                        padding: EdgeInsets.symmetric(vertical: 20,
                            horizontal: 10),
                        margin: EdgeInsets.symmetric(horizontal: 5,
                            vertical: 5),
                        width: Get.width,
                        decoration: TWidget.rShadow,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      deposit = "Direct_Deposite";
                                      email = "";
                                    });
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: TWidget.rShadow,
                                    child: Center(
                                      child: Icon(Icons.check_circle,
                                          color: deposit == "Direct_Deposite"
                                              ? TColors
                                              .rideCompleteColor
                                              : TColors
                                              .textPrimary),
                                    ),
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
                              textInputType: TextInputType.number,
                              textEditingController: account,
                            ),
                            SizedBox(height: 20,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _showImagePickerBottomSheet(context);
                                  },
                                  child: Container(
                                    decoration: TWidget.rShadow,
                                    child: Container(
                                      width: Get.width / 1.6,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 15),
                                        child: Text(
                                          TTexts.UploadDirectDepositText,
                                          style: FontsFamily.ExtraBold.copyWith(
                                              color: TColors.textSecondary,
                                              fontSize: TSizes.fontSizeMd
                                          ),
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
                                    child: controller.formImageString.value ==
                                        null ?
                                    InkWell(
                                      onTap:(){
                                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                                          return DetailScreen(image: controller.depositForm.value,);
                                        }));
                                      },
                                      child: FadeInImage.assetNetwork(
                                        placeholder: 'assets/userload.gif',
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                        image: controller.depositForm.value,
                                        imageErrorBuilder: (c, o, s) =>
                                            Image.asset(
                                              USER_IMAGE, height: 50,
                                              width: 50,
                                              fit: BoxFit.cover,
                                            ),
                                      ),
                                    ):
                                    InkWell(
                                      onTap:(){
                                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                                          return DetailScreen(image: controller.formImageString.value!.path,);
                                        }));
                                      },
                                      child: Image.file(File(
                                          controller.formImageString.value!
                                              .path), height: 50,
                                        width: 50,
                                        fit: BoxFit.cover,),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      GestureDetector(
                        onTap: (){
                          validation();
                        },
                        child: Container(
                          height: 50,
                          width: Get.width / 2,
                          decoration: TWidget.rShadow,
                          child: Center(
                            child: Text(TTexts.SaveChangesText,
                              style: FontsFamily.ExtraBold.copyWith(
                                  fontSize: TSizes.fontSizeMd,
                                  color: TColors.textPrimary
                              ),),
                          ),
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
    });
  }

  void validation() {
    if(deposit == "Direct_Deposite"){
      if(bName.text.isEmpty){
        customSnackBar("Please enter bank name");
      }else if(tNumber.text.isEmpty){
        customSnackBar("Please enter transit number");
      }else if(iNumber.text.isEmpty){
        customSnackBar("Please enter institution number");
      }else if(account.text.isEmpty){
        customSnackBar("Please enter account number");
      }else if(controller.formImageString.value == null){
        customSnackBar("Please enter Direct deposit from");
      }else{
        controller.addAccountDetails(
            deposit,
            bName.text,
            tNumber.text,
            iNumber.text,
            account.text,
            "", () {
          controller.fetchBankDetails(() {
            emailCtr.text = controller.emailCtr.value;
            bName.text = controller.bName.value;
            tNumber.text = controller.tNumber.value;
            iNumber.text = controller.iNumber.value;
            account.text = controller.account.value;
            if (controller.type.value == "Direct_Deposite") {
              deposit = controller.type.value;
            } else {
              email = controller.type.value;
            }
            setState(() {

            });
          });
        });
      }

    }else{
      if(emailCtr.text.isEmpty){
        customSnackBar("Please enter email address");
      }else{
        controller.addAccountDetails(
            email,
            "",
            "",
            "",
            "",
            emailCtr.text, () {
          controller.fetchBankDetails(() {
            emailCtr.text = controller.emailCtr.value;
            bName.text = controller.bName.value;
            tNumber.text = controller.tNumber.value;
            iNumber.text = controller.iNumber.value;
            account.text = controller.account.value;
            if (controller.type.value == "Direct_Deposite") {
              deposit = controller.type.value;
            } else {
              email = controller.type.value;
            }
            setState(() {

            });
          });
        });
      }

    }

  }

  void _showImagePickerBottomSheet(BuildContext context) {
    ImageHelper.showImagePickerBottomSheet(context, _pickImage);
  }

  void _pickImage(ImageSource source, Function(File) setImageFile) async {
    ImageHelper.pickImage(source, (file) {
      controller.formImageString.value = file;
      Navigator.pop(context);
    });
  }
}
class DetailScreen extends StatefulWidget {
  String image = "";
  DetailScreen({super.key,required this.image});
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          width: double.infinity,
          child: PhotoView(
            imageProvider: NetworkImage(widget.image),
            minScale: PhotoViewComputedScale.contained * 1,
            maxScale: PhotoViewComputedScale.covered * 1,
            enableRotation: false,
            initialScale: PhotoViewComputedScale.contained * 1,

          )
      ),
    );

    /* DoubleTappableInteractiveViewer(
        scaleDuration: const Duration(milliseconds: 600),
    child: Image.network(controller.Image.value,height: double.infinity,width: double.infinity,));*/
  }
}
