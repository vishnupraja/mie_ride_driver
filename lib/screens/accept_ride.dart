import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/controllers/booking_controller.dart';
import '../constant/colors.dart';
import '../constant/font_family.dart';
import '../constant/image_string/image_string.dart';
import '../constant/sizes.dart';
import '../constant/text_strings.dart';
import '../utils/static.dart';

class AcceptRide extends StatefulWidget {
  const AcceptRide({super.key});

  @override
  State<AcceptRide> createState() => _AcceptRideState();
}

class _AcceptRideState extends State<AcceptRide> {


  BookingController controller = Get.find();

  @override
  void initState() {
    super.initState();
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
          child: Container(
            margin: EdgeInsets.all(10),
            height: 30,
            width: 30,
            decoration: TWidget.rShadow,
            child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 2),
                  child: Icon(Icons.arrow_back_ios, color: TColors.textPrimary,
                    size: 20,),
                )
            ),
          ),
        ),
        title: Text("Accept Booking",
          textAlign: TextAlign.center,
          style: FontsFamily.ExtraBold.copyWith(
            color: TColors.textPrimary,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if(controller.BookingId.value == ""){
          return Center(child: Text("No booking found"),);
        }else{
          return SingleChildScrollView(
            child: Column(
              children: List.generate(controller.arriveList.length, (snapshot) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: controller.arriveList[snapshot].tripDetail.length +
                      1,
                  itemBuilder: (context, index) {
                    if (index <
                        controller.arriveList[snapshot].tripDetail.length) {
                      var list = controller.arriveList[snapshot]
                          .tripDetail[index];
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.symmetric(vertical: 15),
                          width: Get.width,
                          decoration: TWidget.rShadow,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 30,
                                        decoration: TWidget.rShadow,
                                        child: Center(
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceAround,
                                            children: [
                                              Text(
                                                TTexts.IDText,
                                                style: FontsFamily.ExtraBold
                                                    .copyWith(
                                                  color: TColors.textPrimary,
                                                  fontSize: TSizes.fontSizeSm,
                                                ),
                                              ),
                                              Text(
                                                list.bookingId,
                                                style: FontsFamily.ExtraBold
                                                    .copyWith(
                                                  color: TColors.info,
                                                  fontSize: TSizes.fontSizeSm,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        height: 30,
                                        decoration: TWidget.rShadow,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .center,
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceAround,
                                          children: [
                                            Text(
                                              TTexts.RideTypeText,
                                              style: FontsFamily.ExtraBold
                                                  .copyWith(
                                                color: TColors.textPrimary,
                                                fontSize: 8.0,
                                              ),
                                            ),
                                            SizedBox(width: 1),
                                            Text(
                                              list.bookingType,
                                              style: FontsFamily.ExtraBold
                                                  .copyWith(
                                                color: TColors.info,
                                                fontSize: 8.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        height: 30,
                                        decoration: TWidget.rShadow,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Text(
                                              TTexts.FinalCostText,
                                              style: FontsFamily.ExtraBold
                                                  .copyWith(
                                                color: TColors.textPrimary,
                                                fontSize: 8.0,
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Text(
                                              "${TTexts.Currency}${list
                                                  .totalAmount}",
                                              style: FontsFamily.ExtraBold
                                                  .copyWith(
                                                color: TColors.textPrimary,
                                                fontSize: 8.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      height: 30,
                                      decoration: TWidget.rShadow,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceAround,
                                        children: [
                                          Text(
                                            TTexts.RideStartTimeText,
                                            style: FontsFamily.ExtraBold.copyWith(
                                              color: TColors.textPrimary,
                                              fontSize: TSizes.fontSizeSm,
                                            ),
                                          ),
                                          /*SizedBox(width: 10),
                                            Text(
                                              "12",
                                              style: FontsFamily.ExtraBold.copyWith(
                                                color: TColors.info,
                                                fontSize: TSizes.fontSizeSm,
                                              ),
                                            ),*/
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Flexible(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        children: [
                                          Image.asset(
                                            calenderImage,
                                            height: 20,
                                            width: 20,
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            list.bookingDate,
                                            style: FontsFamily.ExtraBold.copyWith(
                                              color: TColors.info,
                                              fontSize: TSizes.fontSizeSm,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Flexible(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        children: [
                                          Image.asset(
                                            timeImage,
                                            height: 20,
                                            width: 20,
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            list.bookingTime,
                                            style: FontsFamily.ExtraBold.copyWith(
                                              color: TColors.info,
                                              fontSize: TSizes.fontSizeSm,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  decoration: TWidget.rShadow,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            TTexts.PickupText,
                                            style: FontsFamily.ExtraBold.copyWith(
                                              color: TColors.textSecondary,
                                              fontSize: TSizes.fontSizeSm,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        Container(
                                          width: Get.width / 1.7,
                                          child: Text(
                                            list.sourceAdd,
                                            style: FontsFamily.ExtraBold.copyWith(
                                              color: TColors.textPrimary,
                                              fontSize: TSizes.fontSizeSm,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  decoration: TWidget.rShadow,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            TTexts.DropOffText,
                                            style: FontsFamily.ExtraBold.copyWith(
                                              color: TColors.textSecondary,
                                              fontSize: TSizes.fontSizeSm,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        Container(
                                          width: Get.width / 1.7,
                                          child: Text(
                                            list.destinationAdd,
                                            style: FontsFamily.ExtraBold.copyWith(
                                              color: TColors.textPrimary,
                                              fontSize: TSizes.fontSizeSm,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10,),
                        width: Get.width,
                        padding: EdgeInsets.all(TSizes.lg),
                        decoration: BoxDecoration(
                          color: TColors.background,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                          border: Border(
                            top: TWidget.borderSide,
                            left: TWidget.borderSide,
                            right: TWidget.borderSide,
                          ),
                          boxShadow: TWidget.boxShadow,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            /*Text("hii")
                         Center(
                            child: Text(
                              "00:00:",
                              style: FontsFamily.ExtraBold.copyWith(
                                fontSize: TSizes.fontSizeMd,
                                color: TColors.info,
                                letterSpacing: 2,
                              ),
                            ),
                          ),*/
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: TWidget.rShadow,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Amount",
                                        style: FontsFamily.ExtraBold.copyWith(
                                          fontSize: TSizes.fontSizeMd,
                                        ),
                                      ),
                                      Text(
                                        controller.arriveList[snapshot]
                                            .totalAmount,
                                        style: FontsFamily.ExtraBold.copyWith(
                                          fontSize: TSizes.fontSizeMd,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Bonus",
                                        style: FontsFamily.ExtraBold.copyWith(
                                          fontSize: TSizes.fontSizeMd,
                                        ),
                                      ),
                                      Text(
                                        "${TTexts.Currency}${controller
                                            .arriveList[snapshot].bonusAmount}",
                                        style: FontsFamily.ExtraBold.copyWith(
                                          fontSize: TSizes.fontSizeMd,
                                          color: TColors.info,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.acceptBooking(
                                    controller.arriveList[snapshot].allotedId);
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                decoration: TWidget.rShadow,
                                child: Center(
                                  child: Text(
                                    "Accept",
                                    style: FontsFamily.ExtraBold.copyWith(
                                      fontSize: TSizes.fontSizeMd,
                                      color: TColors.rideCompleteColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                                controller.bookingAvailable.value = false;
                                controller.timer?.cancel();
                                controller.cancelBooking("cancel",
                                    controller.arriveList[snapshot].allotedId);
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 10),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                decoration: TWidget.rShadow,
                                child: Center(
                                  child: Text(
                                    "Decline",
                                    style: FontsFamily.ExtraBold.copyWith(
                                      fontSize: TSizes.fontSizeMd,
                                      color: TColors.acceptColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                );
              },

              ),

            ),
          );
        }

      }),


      /* bottomNavigationBar: Obx(() {
        if(controller.BookingId.value == ""){
          return SizedBox();
        }else{
          return Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: Get.width,
              padding: EdgeInsets.only(left: TSizes.lg,
                  right: TSizes.lg,
                  bottom: TSizes.lg,
                  top: TSizes.lg),
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
                  boxShadow: TWidget.boxShadow
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Text("00:00:${controller.timeLeft.value.toString()}",
                      style: FontsFamily.ExtraBold.copyWith(
                          fontSize: TSizes.fontSizeMd,
                          color: TColors.info,
                          letterSpacing: 2
                      ),),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    decoration: TWidget.rShadow,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text("Amount", style: FontsFamily.ExtraBold.copyWith(
                              fontSize: TSizes.fontSizeMd,
                            ),),
                            Text(controller.acceptBookingList.value!.totalAmount, style: FontsFamily.ExtraBold.copyWith(
                              fontSize: TSizes.fontSizeMd,
                            ),),
                          ],
                        ),
       Column(
                          children: [
                            Text("Bonus", style: FontsFamily.ExtraBold.copyWith(
                              fontSize: TSizes.fontSizeMd,
                            ),),
                            Text("${TTexts.Currency}10",
                              style: FontsFamily.ExtraBold.copyWith(
                                  fontSize: TSizes.fontSizeMd,
                                  color: TColors.info
                              ),),
                          ],
                        ),
                        Column(
                          children: [
                            Text("Bonus", style: FontsFamily.ExtraBold.copyWith(
                              fontSize: TSizes.fontSizeMd,
                            ),),
                            Text("${TTexts.Currency}${controller.acceptBookingList.value!.bonusAmount}",
                              style: FontsFamily.ExtraBold.copyWith(
                                  fontSize: TSizes.fontSizeMd,
                                  color: TColors.info
                              ),),
                          ],
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {

                      controller.acceptBooking(controller.acceptBookingList.value!.bookingIds);
                    },
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        decoration: TWidget.rShadow,
                        child: Center(
                          child: Text(
                            "Accept", style: FontsFamily.ExtraBold.copyWith(
                            fontSize: TSizes.fontSizeMd,
                            color: TColors.rideCompleteColor,
                          ),),
                        )
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                      controller.bookingAvailable.value = false;
                      controller.timer?.cancel();
                      controller.cancelBooking("cancel");

                    },
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        decoration: TWidget.rShadow,
                        child: Center(
                          child: Text(
                            "Decline", style: FontsFamily.ExtraBold.copyWith(
                              fontSize: TSizes.fontSizeMd,
                              color: TColors.acceptColor
                          ),),
                        )
                    ),
                  )
                ],
              )
          );
        }

      }),*/
    );
  }
}
