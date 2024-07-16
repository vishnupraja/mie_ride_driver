import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/constant/font_family.dart';
import 'package:mie_ride_driver/controllers/single_controller.dart';
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

  final controller = Get.find<SingleController>();
  TextEditingController massageCtr = TextEditingController();

  String status = "";
  String complainNumber = "";
  String loader = "";
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,(){


      complainNumber = Get.arguments['number'];
      status = Get.arguments['status'];
      controller.fetchSingleQuery(complainNumber, loader);



      _timer = Timer.periodic(Duration(seconds: 2), (timer) {
        loader = "second";
        controller.fetchSingleQuery(complainNumber, loader);
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Container(
          margin: EdgeInsets.only(left: TSizes.lg, right: TSizes.lg),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    Column(
                      children: [
                        SizedBox(height: Get.height / 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(TSizes.sm),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: Offset(-2, 2),
                                      ),
                                    ],
                                    color: TColors.background),
                                child: Center(child: Icon(
                                    Icons.arrow_back_ios, size: 30)),
                              ),
                            ),
                            Text(
                              "David",
                              style: FontsFamily.ExtraBold.copyWith(
                                fontSize: TSizes.fontSizeLg,
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(-2, 2),
                                    ),
                                  ],
                                  color: TColors.background),
                              alignment: Alignment.center,
                              child: Icon(Icons.person, size: 30),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                left: TSizes.sm, right: TSizes.sm),
                            padding: EdgeInsets.only(
                                left: TSizes.md, right: TSizes.md),
                            width: Get.width,
                            height: Get.height / 16,
                            decoration: TWidget.rShadow,
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    keyboardType: TextInputType.text,
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodyLarge,
                                    decoration: InputDecoration(
                                      hintText: "true",
                                      hintStyle: FontsFamily.ExtraBold
                                          .copyWith(
                                          fontSize: TSizes.fontSizeMd,
                                          color: TColors.textSecondary),
                                      fillColor: TColors.background,
                                      filled: true,
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Text(
                                  "Ride Problem",
                                  style: FontsFamily.ExtraBold.copyWith(
                                      fontSize: TSizes.fontSizeMd,
                                      color: TColors.textSecondary),
                                )
                              ],
                            )),
                      ],
                    ),
                    SizedBox(
                      height: TSizes.xl,
                    ),
                    Container(
                      width: Get.width,
                      height: Get.width / 1,
                      padding: EdgeInsets.only(left: TSizes.lg,
                          right: TSizes.lg,
                          bottom: TSizes.lg),
                      decoration: BoxDecoration(
                        color: TColors.background,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: TColors.background),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(2, 2),
                          ),
                          BoxShadow(
                            color: TColors.background.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(-2, -2),
                          ),
                        ],
                      ),
                      child: ListView.builder(
                        reverse: true,
                        shrinkWrap: true,
                        itemCount: controller.fetchSingleQueryList.length,
                        itemBuilder: (BuildContext context, int index) {
                          var reversedList = controller.fetchSingleQueryList;
                          return Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: Row(
                              mainAxisAlignment:
                              reversedList[index].role == "customer"
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              children: [
                                Container(
                                  constraints: BoxConstraints(
                                      maxWidth: MediaQuery
                                          .of(context)
                                          .size
                                          .width -
                                          45),
                                  margin: EdgeInsets.symmetric(
                                    vertical: 2,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: reversedList[index].role ==
                                        "customer"
                                        ? TColors.primary
                                        : Colors.grey,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    reversedList[index].message.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: TSizes.spaceBtwItems),
                  ],
                ),
                Container(
                  width: Get.width,
                  padding: EdgeInsets.symmetric(
                      horizontal: TSizes.lg, vertical: TSizes.lg),
                  decoration: BoxDecoration(
                    color: TColors.background,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(2, 2),
                      ),
                      BoxShadow(
                        color: TColors.background.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(-2, -2),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.add_circle_outline, size: 25),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: TSizes.md,
                              right: TSizes.md),
                          padding: EdgeInsets.only(left: TSizes.md,
                              right: TSizes.md),
                          height: Get.height / 16,
                          decoration: TWidget.rShadow,
                          alignment: Alignment.center,
                          child: TextField(
                            controller: massageCtr,
                            keyboardType: TextInputType.text,
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyLarge,
                            decoration: InputDecoration(
                              hintText: TTexts.AddMessageText,
                              hintStyle: FontsFamily.ExtraBold.copyWith(
                                  color: TColors.buttonPrimary),
                              fillColor: TColors.background,
                              filled: true,
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.image),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.mic),
                      ),
                      SizedBox(width: 5,),
                      GestureDetector(
                        onTap: () {
                          if(status == "closed"){
                            massageCtr.text = "";
                            customSnackBar("your ticket hai been closed you are not able to send other messages");
                          }
                         else if(massageCtr.text.isEmpty){
                            customSnackBar("please write your message");
                          }else{
                            controller.replyThread(complainNumber, massageCtr.text);
                            massageCtr.text = "";
                          }
                        },
                        child: Icon(Icons.send),
                      ),
                    ],
                  ),
                ),
                if(status != "closed")
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                  child:  GestureDetector(
                    onTap: (){
                      controller.closeTicket(complainNumber);
                    },
                    child: Container(
                      decoration: TWidget.rShadow,
                      child: Container(
                        width: Get.width/1.8,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                            child: Center(
                              child: Text("Close Ticket",
                                style: FontsFamily.ExtraBold.copyWith(
                                    fontSize: 15,
                                    color: TColors.textPrimary
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
