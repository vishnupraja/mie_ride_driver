import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/controllers/addressController.dart';
import 'package:mie_ride_driver/controllers/home_controller.dart';
import '../constant/colors.dart';
import '../constant/font_family.dart';
import '../constant/image_string/image_string.dart';
import '../constant/sizes.dart';
import '../constant/text_strings.dart';
import '../utils/address_bottomsheet.dart';
import '../utils/static.dart';

class ShareRouteScreen extends StatefulWidget {
  const ShareRouteScreen({super.key});

  @override
  State<ShareRouteScreen> createState() => _ShareRouteScreenState();
}

class _ShareRouteScreenState extends State<ShareRouteScreen> {


  TextEditingController startTimeCtr = TextEditingController();
  TextEditingController startPointCtr = TextEditingController();
  TextEditingController endPointCtr = TextEditingController();
  TextEditingController startDateCtr = TextEditingController();
  TextEditingController endTimeCtr = TextEditingController();
  TextEditingController endDateCtr = TextEditingController();

  final AddressController controller = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          children: [
            customAppbar(TTexts.ShareRouteText),
            SizedBox(height: TSizes.xl,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              width: Get.width,
              decoration: TWidget.rShadow,
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20),
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      decoration: TWidget.rShadow,
                      child: TextFormField(
                        readOnly: true,
                        onTap: () async {
                          var result = await Get.to<String>(
                              AddressSearchPage());
                          if (result != null) {
                            startPointCtr.text = result;
                          }
                        },
                        controller: startPointCtr,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: TTexts.StartPointText,
                            hintStyle: FontsFamily.ExtraBold.copyWith(
                                color: TColors.textSecondary,
                                fontSize: TSizes.fontSizeMd
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, bottom: 8, left: 10),
                              child: ImageIcon(AssetImage(
                                flagImage,
                              ),
                                  size: 20),
                            )
                        ),
                      )
                  ),
                  SizedBox(height: 20,),
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20),
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      decoration: TWidget.rShadow,
                      child: TextFormField(
                        readOnly: true,
                        onTap: () async {
                          var result = await Get.to<String>(
                              AddressSearchPage());
                          if (result != null) {
                            endPointCtr.text = result;
                          }
                        },
                        controller: endPointCtr,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: TTexts.EndPointText,
                            hintStyle: FontsFamily.ExtraBold.copyWith(
                                color: TColors.textSecondary,
                                fontSize: TSizes.fontSizeMd
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 10),
                              child: ImageIcon(AssetImage(
                                endpointImage,
                              ),
                                  size: 20),
                            )
                        ),
                      )
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.symmetric(vertical: 20),
              width: Get.width,
              decoration: TWidget.rShadow,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Obx(() {
                          return GestureDetector(
                            onTap: () {
                              Get
                                  .find<HomeController>()
                                  .startTime
                                  .value = "Start time";
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 20, right: 10),
                              height: 20,
                              width: 20,
                              decoration: TWidget.rShadow,
                              child: Center(
                                child: Icon(
                                  Icons.check_circle, color: Get
                                    .find<HomeController>()
                                    .startTime
                                    .value == "Start time" ? TColors
                                    .rideCompleteColor : TColors.textPrimary,
                                  size: 15,),
                              ),
                            ),
                          );
                        }),
                        GestureDetector(
                          onTap: () {
                            Get
                                .find<HomeController>()
                                .startTime
                                .value = "Start time";
                          },
                          child: Obx(() {
                            return Container(
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Get
                                    .find<HomeController>()
                                    .startTime
                                    .value == "Start time"
                                    ? TColors.rideCompleteColor
                                    : TColors.background,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: TColors.background),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: Offset(
                                        2, 2), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(TTexts.StartTimeText,
                                  style: FontsFamily.ExtraBold.copyWith(
                                      color: Get
                                          .find<HomeController>()
                                          .startTime
                                          .value == "Start time"
                                          ? TColors.white
                                          : TColors.textPrimary,
                                      fontSize: TSizes.fontSizeMd
                                  ),),
                              ),
                            );
                          }),
                        ),
                        SizedBox(width: 30,),
                        Obx(() {
                          return GestureDetector(
                            onTap: () {
                              Get
                                  .find<HomeController>()
                                  .startTime
                                  .value = "Reach time";
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 20,),
                              height: 20,
                              width: 20,
                              decoration: TWidget.rShadow,
                              child: Center(
                                child: Icon(
                                  Icons.check_circle, color: Get
                                    .find<HomeController>()
                                    .startTime
                                    .value == "Reach time" ? TColors
                                    .rideCompleteColor : TColors.textPrimary,
                                  size: 15,),
                              ),
                            ),
                          );
                        }),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                Get
                                    .find<HomeController>()
                                    .startTime
                                    .value = "Reach time";
                              },
                              child: Obx(() {
                                return Container(
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    color: Get
                                        .find<HomeController>()
                                        .startTime
                                        .value == "Reach time" ? TColors
                                        .rideCompleteColor : TColors.background,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: TColors.background),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: Offset(
                                            2, 2), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(TTexts.ReachTimeText,
                                      style: FontsFamily.ExtraBold.copyWith(
                                          color: Get
                                              .find<HomeController>()
                                              .startTime
                                              .value == "Reach time"   ? TColors.white
                                          : TColors.textPrimary,
                                          fontSize: TSizes.fontSizeMd
                                      ),),
                                  ),
                                );
                              }),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Obx(() {
                    return Visibility(
                      visible: Get
                          .find<HomeController>()
                          .startTime
                          .value == "Start time",
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              status = "1";
                              _selectTime(context);
                              setState(() {

                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              decoration: TWidget.rShadow,
                              child: Row(
                                children: [
                                  Text(_selectedTime == null
                                      ? TTexts.SelectTimeText
                                      : _selectedTime!.format(context),
                                    style: FontsFamily.ExtraBold.copyWith(
                                        color: TColors.textSecondary,
                                        fontSize: TSizes.fontSizeMd
                                    ),),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          GestureDetector(
                            onTap: () {
                              status2 = "1";
                              _selectDate(context);
                              setState(() {

                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              decoration: TWidget.rShadow,
                              child: Row(
                                children: [
                                  Text(_selectedDate == null
                                      ? TTexts.SelectDateText
                                      : _selectedDate!.toString().substring(
                                      0, 10),
                                    style: FontsFamily.ExtraBold.copyWith(
                                        color: TColors.textSecondary,
                                        fontSize: TSizes.fontSizeMd
                                    ),),
                                  SizedBox(width: 20,),
                                  Expanded(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Image.asset(
                                          calenderImage, height: 20,
                                          width: 20,
                                          color: TColors.textPrimary,)
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  Obx(() {
                    return Visibility(
                      visible: Get
                          .find<HomeController>()
                          .startTime
                          .value == "Reach time",
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              status = "2";
                              _selectTime(context);
                              setState(() {

                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              decoration: TWidget.rShadow,
                              child: Row(
                                children: [
                                  Text(_selectedTime2 == null
                                      ? TTexts.SelectReachTimeText
                                      : _selectedTime2!.format(context),
                                    style: FontsFamily.ExtraBold.copyWith(
                                        color: TColors.textSecondary,
                                        fontSize: TSizes.fontSizeMd
                                    ),),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          GestureDetector(
                            onTap: () {
                              status2 = "2";
                              _selectDate(context);
                              setState(() {

                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              decoration: TWidget.rShadow,
                              child: Row(
                                children: [
                                  Text(_selectedDate2 == null ?
                                  TTexts.SelectReachDateText
                                      : _selectedDate2.toString().substring(
                                      0, 10),
                                    style: FontsFamily.ExtraBold.copyWith(
                                        color: TColors.textSecondary,
                                        fontSize: TSizes.fontSizeMd
                                    ),),
                                  SizedBox(width: 20,),
                                  Expanded(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Image.asset(
                                          calenderImage, height: 20,
                                          width: 20,
                                          color: TColors.textPrimary,)
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: TWidget.rShadow,
                  child: Center(
                    child: Text(TTexts.SeatsAvailableText,
                      style: FontsFamily.ExtraBold.copyWith(
                          color: TColors.textPrimary,
                          fontSize: TSizes.fontSizeMd
                      ),),
                  ),
                ),
                SizedBox(width: 20,),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.find<HomeController>().decrement();
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 20),
                        height: 40,
                        width: 40,
                        decoration: TWidget.rShadow,
                        child: Center(
                          child: Icon(
                            Icons.remove,
                            color: TColors.textPrimary, size: 15,),
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: TWidget.rShadow,
                      child: Center(
                        child: Obx(() {
                          return Text(Get
                              .find<HomeController>()
                              .counter
                              .toString(),
                            style: FontsFamily.ExtraBold.copyWith(
                                color: TColors.textPrimary,
                                fontSize: TSizes.fontSizeMd
                            ),);
                        }),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.find<HomeController>().increment();
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20, right: 10),
                        height: 40,
                        width: 40,
                        decoration: TWidget.rShadow,
                        child: Center(
                          child: Icon(
                            Icons.add, color: TColors.textPrimary, size: 15,),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 50, vertical: 40),
              child: CustomButton(TTexts.SubmitText, BUTTON_IMAGE, () {
                validation();
              }),
            )
          ],
        ),
      ),
    );
  }

  var status = "";
  var status2 = "";

  TimeOfDay? _selectedTime, _selectedTime2; // Make _selectedTime nullable

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay initialTime;
    if (status == "1" && _selectedTime != null) {
      initialTime = _selectedTime!;
    } else if (_selectedTime2 != null) {
      initialTime = _selectedTime2!;
    } else {
      initialTime = TimeOfDay.now();
    }

    await showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery
              .of(context)
              .size
              .height / 3,
          color: Color.fromARGB(255, 255, 255, 255),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Row to position the button at the top right corner
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CupertinoButton(
                      child: Text('OK'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 4,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.time,
                    initialDateTime: DateTime(
                      DateTime
                          .now()
                          .year,
                      DateTime
                          .now()
                          .month,
                      DateTime
                          .now()
                          .day,
                      initialTime.hour,
                      initialTime.minute,
                    ),
                    onDateTimeChanged: (DateTime newDateTime) {
                      setState(() {
                        if (status == "1") {
                          _selectedTime = TimeOfDay.fromDateTime(newDateTime);
                        } else {
                          _selectedTime2 = TimeOfDay.fromDateTime(newDateTime);
                        }
                      });
                    },

                    use24hFormat: false,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  DateTime? _selectedDate, _selectedDate2; // Make _selectedDate nullable


  Future<void> _selectDate(BuildContext context) async {
    await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext builder) {
        DateTime now = DateTime.now();
        DateTime initialDate = _selectedDate ??
            DateTime(now.year, now.month, now.day);
        DateTime minimumDate = DateTime(now.year, now.month, now.day);

        return Container(
          height: MediaQuery
              .of(context)
              .size
              .height / 3,
          color: Color.fromARGB(255, 255, 255, 255),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Row to position the button at the top right corner
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CupertinoButton(
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 4,
                  child: CupertinoDatePicker(
                    initialDateTime: initialDate,
                    onDateTimeChanged: (DateTime newDate) {
                      setState(() {
                        if (status2 == "1") {
                          _selectedDate = newDate;
                        } else {
                          _selectedDate2 = newDate;
                        }
                      });
                    },
                    mode: CupertinoDatePickerMode.date,
                    minimumDate: minimumDate,
                    maximumDate: DateTime(2100),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  void validation() async {
    if (startPointCtr.text.isEmpty) {
      customSnackBar("Please select StartPoint");
    } else if (endPointCtr.text.isEmpty) {
      customSnackBar("Please select EndPoint");
    } else if (_selectedTime == null) {
      customSnackBar("Please select Start Time");
    } else if (_selectedDate == null) {
      customSnackBar("Please select Start Date");
    } else if (_selectedTime2 == null) {
      customSnackBar("Please select End Time");
    } else if (_selectedDate2 == null) {
      customSnackBar("Please select End Date");
    } else if (Get
        .find<HomeController>()
        .counter
        .value == 0) {
      customSnackBar("Please select Number of seat");
    } else {
      Get.find<HomeController>().shareRout(
          startPointCtr.text,
          endPointCtr.text,
          _selectedTime!.format(context).toString(),
          _selectedDate!.toString().substring(0, 10).toString(),
          _selectedTime2!.format(context).toString(),
          _selectedDate2!.toString().substring(0, 10).toString(),
          Get
              .find<HomeController>()
              .counter
              .value
              .toString()
      );
    }
  }

}
