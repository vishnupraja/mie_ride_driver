import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/constant/font_family.dart';
import 'package:mie_ride_driver/constant/image_string/image_string.dart';
import 'package:mie_ride_driver/utils/static.dart';

import '../constant/colors.dart';
import '../constant/sizes.dart';
import '../constant/text_strings.dart';
class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left:TSizes.lg,right:TSizes.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            Column(
              children:[
                SizedBox(height: Get.height/16,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(TSizes.sm),
                        decoration: TWidget.bBoxDecoration,
                        child: Icon(Icons.arrow_back_ios,size: 30,),
                      ),
                    ),

                    Text("David",style: FontsFamily.ExtraBold.copyWith(
                      fontSize: TSizes.fontSizeLg,
                    ),),

                    Container(
                      height: 50,
                      width: 50,
                      padding: EdgeInsets.all(10),
                      decoration: TWidget.bBoxDecoration,
                      alignment: Alignment.center,
                      child: Icon(Icons.person,size: 30,),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),

                Container(
                    margin:EdgeInsets.only(left:TSizes.sm,right:TSizes.sm),
                    padding: EdgeInsets.only(left:TSizes.md,right:TSizes.md),
                    width: Get.width,
                    height: Get.height/16,
                    decoration: TWidget.bBoxDecoration,
                    alignment: Alignment.center,
                    child:Row(
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.text,
                            style: Theme.of(context).textTheme.bodyLarge,
                            decoration: InputDecoration(
                              hintText: "Subject",
                              hintStyle: FontsFamily.ExtraBold.copyWith(
                                fontSize: TSizes.fontSizeMd,
                                color: TColors.textSecondary
                              ),
                              fillColor: TColors.background,
                              filled: true,
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              //  prefixIcon: Icon(Icons.account_circle_outlined,color: Colors.black,)
                            ),
                          ),
                        ),
                        Text("Ride Problem",style:FontsFamily.ExtraBold.copyWith(
                            fontSize: TSizes.fontSizeMd,
                            color: TColors.textSecondary
                        ),)
                      ],
                    )
                ),

              ],
            ),
            SizedBox(
              height: TSizes.xl,
            ),
            Container(
              width: Get.width,
              height: Get.width/1,
              padding: EdgeInsets.only(left:TSizes.lg,right:TSizes.lg,bottom: TSizes.lg),
              decoration: BoxDecoration(
                  color: TColors.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  ),
                  border: Border(
                      top: TWidget.borderSide,
                      bottom: TWidget.borderSide,
                      left: TWidget.borderSide,
                      right: TWidget.borderSide
                  ),
                  boxShadow:TWidget.boxShadow
              ),),





            SizedBox(height: TSizes.spaceBtwItems,),
          ],
        ),
      ),
      bottomNavigationBar: Container(
          width: Get.width,
          padding: EdgeInsets.only(left:TSizes.lg,right:TSizes.lg,bottom: TSizes.lg,top: TSizes.lg),
          decoration: BoxDecoration(
              color: TColors.background,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40)
              ),
              border: Border(
                  top: TWidget.borderSide,
                  left: TWidget.borderSide,
                  right: TWidget.borderSide
              ),
              boxShadow:TWidget.boxShadow
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment:MainAxisAlignment.spaceBetween ,
            children: [

              GestureDetector(
                onTap: (){},
                child: Icon(Icons.add_circle_outline),
              ),

              Expanded(
                child: Container(

                  margin: EdgeInsets.only(left:TSizes.md,right:TSizes.md),
                  padding: EdgeInsets.only(left:TSizes.md,right:TSizes.md),
                  height: Get.height/16,
                  decoration: TWidget.bBoxDecoration,
                  alignment: Alignment.center,
                  child:   TextField(
                    keyboardType: TextInputType.text,
                    style: Theme.of(context).textTheme.bodyLarge,
                    decoration: InputDecoration(
                      hintText: TTexts.AddMessageText.toUpperCase(),
                      fillColor: TColors.background,
                      filled: true,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      //  prefixIcon: Icon(Icons.account_circle_outlined,color: Colors.black,)
                    ),
                  ),
                ),
              ),

              GestureDetector(
                onTap: (){},
                child: Icon(Icons.image),
              ),  GestureDetector(
                onTap: (){},
                child: Icon(Icons.mic),
              )


            ],
          )
      ),
    );
  }
}
