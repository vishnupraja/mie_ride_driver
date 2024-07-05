import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/constant/sizes.dart';
import 'package:mie_ride_driver/controllers/booking_controller.dart';
import 'package:mie_ride_driver/utils/static.dart';

import '../../constant/colors.dart';
import '../../constant/font_family.dart';
import '../../constant/image_string/image_string.dart';
import '../../constant/text_strings.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {

  final controller = Get.find<BookingController>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,(){
      controller.fetchAcceptedBooking();
    });
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
        title: Text(TTexts.BookingsText,
          textAlign: TextAlign.center,
          style: FontsFamily.ExtraBold.copyWith(
            color: TColors.textPrimary,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if(controller.acceptBookingList2.length == 0){
          return Center(child: Text("No data found"),);
        }else{
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 50),
                    scrollDirection: Axis.vertical,
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.acceptBookingList2.length,
                    itemBuilder: (context, index) {
                      var list = controller.acceptBookingList2[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
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
                                              Text(TTexts.IDText,
                                                style: FontsFamily.ExtraBold
                                                    .copyWith(
                                                    color: TColors.textPrimary,
                                                    fontSize: TSizes.fontSizeSm
                                                ),),
                                              Text(list.allotedId,
                                                style: FontsFamily.ExtraBold
                                                    .copyWith(
                                                    color: TColors.info,
                                                    fontSize: TSizes.fontSizeSm
                                                ),)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5,),
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
                                            Text(TTexts.RideTypeText,
                                              style: FontsFamily.ExtraBold
                                                  .copyWith(
                                                  color: TColors.textPrimary,
                                                  fontSize: 8.0
                                              ),),
                                            SizedBox(width: 1,),
                                            Text(list.tripDetail[0].bookingType,
                                              style: FontsFamily.ExtraBold
                                                  .copyWith(
                                                  color: TColors.info,
                                                  fontSize: 8.0
                                              ),)
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5,),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5),
                                        height: 30,
                                        decoration: TWidget.rShadow,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .center,
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceAround,
                                          children: [
                                            Text(TTexts.FinalCostText,
                                              style: FontsFamily.ExtraBold
                                                  .copyWith(
                                                  color: TColors.textPrimary,
                                                  fontSize: 8.0
                                              ),),
                                            SizedBox(width: 10,),
                                            Text("${TTexts.Currency}${list.total_amount}",
                                              style: FontsFamily.ExtraBold
                                                  .copyWith(
                                                  color: TColors.info,
                                                  fontSize: 8.0
                                              ),)
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 20,),
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
                                          Text(TTexts.RideStartTimeText,
                                            style: FontsFamily.ExtraBold.copyWith(
                                                color: TColors.textPrimary,
                                                fontSize: TSizes.fontSizeSm
                                            ),),
                                         /* SizedBox(width: 5,),
                                          Text(list.driverRideStartTime,
                                            style: FontsFamily.ExtraBold.copyWith(
                                                color: TColors.info,
                                                fontSize: 8
                                            ),)*/
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 20,),
                                    Flexible(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        children: [
                                          Image.asset(calenderImage, height: 15,
                                            width: 15,),
                                          SizedBox(width: 5,),
                                          Text(list.ride_start_date,
                                            style: FontsFamily.ExtraBold.copyWith(
                                                color: TColors.textPrimary,
                                                fontSize: 8
                                            ),)
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        children: [
                                          Image.asset(timeImage, height: 15,
                                              width: 15,
                                              color: TColors.info),
                                          SizedBox(width: 5,),
                                          Text(list.ride_start_time,
                                            style: FontsFamily.ExtraBold.copyWith(
                                                color: TColors.textPrimary,
                                                fontSize: 8
                                            ),)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  decoration: TWidget.rShadow,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text(TTexts.PickupText,
                                            style: FontsFamily.ExtraBold
                                                .copyWith(
                                                color: TColors.textSecondary,
                                                fontSize: TSizes.fontSizeSm
                                            ),),
                                        ),
                                        SizedBox(width: 15,),
                                        Container(
                                          width: Get.width/1.7,
                                          child: Text(list.tripDetail[0].sourceAdd,
                                            style: FontsFamily.ExtraBold
                                                .copyWith(
                                                color: TColors.textPrimary,
                                                fontSize: TSizes.fontSizeSm
                                            ),),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  decoration: TWidget.rShadow,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text(TTexts.DropOffText,
                                            style: FontsFamily.ExtraBold
                                                .copyWith(
                                                color: TColors.textSecondary,
                                                fontSize: TSizes.fontSizeSm
                                            ),),
                                        ),
                                        SizedBox(width: 15,),
                                        Container(
                                          width: Get.width/1.7,
                                          child: Text(list.tripDetail[0].destinationAdd,
                                            style: FontsFamily.ExtraBold
                                                .copyWith(
                                                color: TColors.textPrimary,
                                                fontSize: TSizes.fontSizeSm
                                            ),),
                                        )
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(height: 20,),
                                InkWell(
                                  onTap: (){
                                    print("id ------ ${list.tripDetail[0].bookingId}");
                                    controller.pickupStart(list.allotedId, list.tripDetail[0].bookingId);
                                    /*Navigator.of(context).push(MaterialPageRoute(builder: (context) => OngoingBookingScreen()));*/
                                  },
                                  child: Center(
                                    child: Container(
                                        height: 40,
                                        width: 150,
                                        decoration: TWidget.rShadow,
                                        child: Center(
                                          child: Text(TTexts.BPickupText,
                                            style: FontsFamily.ExtraBold.copyWith(
                                                color: TColors.info,
                                                fontSize: TSizes.fontSizeMd
                                            ),),
                                        )
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },),
                ),
              ],
            ),
          );
        }

      }),
    );
  }
}
