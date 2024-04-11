import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../constant/font_family.dart';
import '../../constant/image_string/image_string.dart';
import '../../constant/sizes.dart';
import '../../constant/text_strings.dart';
import '../../utils/static.dart';

class SupportChat extends StatefulWidget {
  const SupportChat({super.key});

  @override
  State<SupportChat> createState() => _SupportChatState();
}

class _SupportChatState extends State<SupportChat> {

  TextEditingController subCtr = TextEditingController();
  TextEditingController msgCtr = TextEditingController();
  List<String> vehicleList = ["hero", "honda", "Bullet"];
  var vehicle = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            customAppbar("Ride support\nchat"),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Container(
                      decoration: TWidget.bBoxDecoration,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20),
                          dropdownColor: TColors.background,
                          hint: Text(
                            TTexts.selectVehicleText,
                            style: FontsFamily.ExtraBold
                                .copyWith(
                              color: TColors.textSecondary,
                              fontSize: TSizes.fontSizeMd,
                            ),
                          ),
                          value: vehicle,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            size: 30,
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
                                    style: TextStyle(
                                        color: TColors
                                            .textPrimary),
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
                    SizedBox(height: 10,),
                    CustomField(
                      textInputType: TextInputType.text,
                      hintText: "Add subject",
                      textEditingController: subCtr,
                      size: TSizes.fontSizeMd,
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
                    SizedBox(height: 50,),
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
      ),
    );
  }
}
