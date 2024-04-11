import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../constant/font_family.dart';
import '../../constant/sizes.dart';
import '../../constant/text_strings.dart';
import '../../utils/static.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {

  TextEditingController nameCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController subCtr = TextEditingController();
  TextEditingController msgCtr = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: TSizes.appBarHeight,),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: customAppbar(TTexts.ContactFormText)),
          SizedBox(height: TSizes.appBarHeight,),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    height: 50,
                    decoration: TWidget.bShadow,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(TTexts.ContactSupportText,
                            style: FontsFamily.ExtraBold.copyWith(
                                color: TColors.info,
                                fontSize: TSizes.fontSizeMd,
                                letterSpacing: 1
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: TColors.info,
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: Center(
                              child: Icon(Icons.call,color: TColors.white,size: 15,),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: TSizes.xl,),
                  Center(
                    child: Text(TTexts.WriteSupportText,
                      style: FontsFamily.ExtraBold.copyWith(
                        fontSize: TSizes.fontSizeELg,
                      ),
                    ),
                  ),
                  CustomField(
                    size: TSizes.fontSizeMd,
                    hintText: "Full name",
                    textInputType: TextInputType.text,
                    textEditingController: nameCtr,
                  ),
                  CustomField(
                    size: TSizes.fontSizeMd,
                    hintText: TTexts.email,
                    textInputType: TextInputType.text,
                    textEditingController: emailCtr,
                  ),
                  CustomField(
                    size: TSizes.fontSizeMd,
                    hintText: "Subject line",
                    textInputType: TextInputType.text,
                    textEditingController: subCtr,
                  ),
                  SizedBox(height: 20,),
                  Container(
                    decoration: TWidget.bShadow,
                    child: TextFormField(
                      style: FontsFamily.ExtraBold.copyWith(
                        color: TColors.textPrimary,
                        fontSize: TSizes.fontSizeMd
                      ),
                      controller: msgCtr,
                      textInputAction:TextInputAction.done,
                      maxLines: 8,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: TTexts.AddMessageText,
                        hintStyle: FontsFamily.ExtraBold.copyWith(
                          fontSize: TSizes.fontSizeMd,
                          color: TColors.textSecondary,
                        ),
                        contentPadding: EdgeInsets.only(left: 12,top: 5)
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Center(
                    child: Container(
                      height: 50,
                      width: 160,
                      decoration: TWidget.bShadow,
                      child: Center(
                        child: Text(TTexts.SendMessageText,
                          style: FontsFamily.ExtraBold.copyWith(
                              fontSize: TSizes.fontSizeMd,
                            color: TColors.info
                          ),),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}