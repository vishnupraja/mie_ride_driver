import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../constant/colors.dart';
import '../constant/font_family.dart';
import '../constant/image_string/image_string.dart';
import '../constant/sizes.dart';
import '../constant/text_strings.dart';
import '../controllers/booking_controller.dart';
import '../utils/static.dart';

class OngoingRide extends StatefulWidget {
  const OngoingRide({super.key});

  @override
  State<OngoingRide> createState() => _OngoingRideState();
}

class _OngoingRideState extends State<OngoingRide> {

  final controller = Get.find<BookingController>();

  @override
  void initState() {
    super.initState();
    controller.checkValue.value = "1";
    SchedulerBinding.instance.addPostFrameCallback((_) {
      hideFloatingWindow();
    });
    Future.delayed(Duration.zero, () {
      controller.ongoingRide("1");
    });
  }

  @override
  void dispose() {
    controller.checkValue.value = "";
    SchedulerBinding.instance.addPostFrameCallback((_) {
     if( controller.ongoingList.length != 0){
       showFloatingWindow();
     }

    });
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: TColors.background,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
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
        title: Text("Ongoing Booking",
          textAlign: TextAlign.center,
          style: FontsFamily.ExtraBold.copyWith(
            color: TColors.textPrimary,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if(controller.ongoingList.length == 0){
          return Center(child: Text("No data found"),);
        }else{
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: controller.ongoingList[0].tripDetail.length,
                    shrinkWrap: true,
                    itemBuilder: (context, snapshot) {
                       var list = controller.ongoingList[0].tripDetail[snapshot];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.symmetric(vertical: 15),
                          width: Get.width,
                          decoration: TWidget.rShadow,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Card(
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius
                                              .circular(30)
                                      ),
                                      child: Center(
                                        child: list.image != ""?
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            30),
                                        child: FadeInImage.assetNetwork(
                                        placeholder: 'assets/userload.gif',
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.cover,
                                            image: list.image,
                                            imageErrorBuilder: (c, o,
                                                s) =>
                                                Image.asset(
                                                  USER_IMAGE, height: 50,
                                                  width: 50,
                                                  fit: BoxFit.cover,
                                                ),),
                                      )
                                          :ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                30),
                                            child: Image.asset(
                                              USER_IMAGE, height: 50,
                                              width: 50,
                                              fit: BoxFit.cover,)),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text(list.fullname,
                                          style: FontsFamily.ExtraBold.copyWith(
                                              color: TColors.info,
                                              fontSize: TSizes.fontSizeLg
                                          ),),
                                        Text(TTexts.RideTypeText,
                                          style: FontsFamily.ExtraBold.copyWith(
                                              fontSize: TSizes.fontSizeSm
                                          ),),
                                        Text(list.bookingType,
                                          style: FontsFamily.ExtraBold.copyWith(
                                              color: TColors.info,
                                              fontSize: TSizes.fontSizeSm
                                          ),),
                                      ],
                                    ),
                                    SizedBox(width: 30,),
                                    Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10),
                                          height: 40,
                                          width: 40,
                                          decoration: TWidget.rShadow,
                                          child: Center(
                                            child: Icon(
                                              Icons.location_on_outlined,
                                              color: TColors.info, size: 20,),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: TWidget.rShadow,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Text("ID",
                                                style: FontsFamily.ExtraBold
                                                    .copyWith(
                                                    fontSize: TSizes.fontSizeSm
                                                ),),
                                              SizedBox(width: 5,),
                                              Text(list.bookingId,
                                                style: FontsFamily.ExtraBold
                                                    .copyWith(
                                                    color: TColors.info,
                                                    fontSize: TSizes.fontSizeSm
                                                ),),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10),
                                          height: 40,
                                          width: 40,
                                          decoration: TWidget.rShadow,
                                          child: Center(
                                            child: Icon(
                                              Icons.clear, color: TColors.info,
                                              size: 20,),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: TWidget.rShadow,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Text("\$",
                                                style: FontsFamily.ExtraBold
                                                    .copyWith(
                                                    fontSize: TSizes.fontSizeSm
                                                ),),
                                              SizedBox(width: 5,),
                                              Text(list.totalAmount,
                                                style: FontsFamily.ExtraBold
                                                    .copyWith(
                                                    color: TColors.info,
                                                    fontSize: TSizes.fontSizeSm
                                                ),),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  decoration: TWidget.rShadow,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30, right: 10),
                                    child: Row(
                                      children: [
                                        Text(TTexts.PickupText,
                                          style: FontsFamily.ExtraBold.copyWith(
                                              color: TColors.textSecondary,
                                              fontSize: TSizes.fontSizeSm
                                          ),),
                                        SizedBox(width: 20,),
                                        Container(
                                          width: Get.width/1.7,
                                          child: Text(list.sourceAdd,
                                            style: FontsFamily.ExtraBold.copyWith(
                                                color: TColors.textPrimary,
                                                fontSize: TSizes.fontSizeSm
                                            ),),
                                        ),
                                        Expanded(
                                          child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Image.asset(
                                                flagImage, height: 20,
                                                width: 20,
                                                color: TColors.info,)
                                          ),
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
                                    padding: const EdgeInsets.only(
                                        left: 30, right: 10),
                                    child: Row(
                                      children: [
                                        Text(TTexts.DropOffText,
                                          style: FontsFamily.ExtraBold.copyWith(
                                              color: TColors.textSecondary,
                                              fontSize: TSizes.fontSizeSm
                                          ),),
                                        SizedBox(width: 20,),
                                        Container(
                                          width: Get.width/1.8,
                                          child: Text(list.destinationAdd,
                                            style: FontsFamily.ExtraBold.copyWith(
                                                color: TColors.textPrimary,
                                                fontSize: TSizes.fontSizeSm
                                            ),),
                                        ),
                                        Expanded(
                                          child: Align(
                                              alignment: Alignment.centerRight,
                                              child: ImageIcon(AssetImage(roundLocationImage),
                                                  color: TColors.info)
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 25,),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap:(){
                                        makePhoneCall(list.contact);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        padding: EdgeInsets.all(10),
                                        decoration: TWidget.rShadow,
                                        child: Center(
                                          child: Image.asset(
                                            callImage, height: 20, width: 20,),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: TWidget.rShadow,
                                        child: Center(
                                          child: Text(list.bookingStatus,
                                            style: FontsFamily.ExtraBold.copyWith(
                                                fontSize: TSizes.fontSizeMd,
                                                color: TColors.info
                                            ),),
                                        ),
                                      ),
                                    ),

                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10),
                                      padding: EdgeInsets.all(10),
                                      decoration: TWidget.rShadow,
                                      child: Center(
                                        child: Image.asset(
                                          chatImage, height: 20, width: 20,),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                ),
              ),
            ],
          );
        }

      }),
    );
  }
  void makePhoneCall(String phoneNumber) async {
    PermissionStatus permissionStatus = await Permission.phone.request();
    if (permissionStatus.isGranted) {
      launchUrlString("tel://$phoneNumber");
    } else {
      openAppSettings();
    }
  }

}



ValueNotifier<bool> isFloatingWindowVisible = ValueNotifier(false);

void showFloatingWindow() {
  isFloatingWindowVisible.value = true;
}

void hideFloatingWindow() {
  isFloatingWindowVisible.value = false;
}

class FloatingWindow extends StatefulWidget {
  @override
  _FloatingWindowState createState() => _FloatingWindowState();
}

class _FloatingWindowState extends State<FloatingWindow> {
  Offset position = Offset(100, 100); // Initial position of the floating window

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isFloatingWindowVisible,
      builder: (context, isVisible, child) {
        if (!isVisible) {
          return SizedBox.shrink();
        }
        return Positioned(
          left: position.dx,
          top: position.dy,
          child: Draggable(
            feedback: Material(
              color: Colors.transparent,
              child: windowContent(),
            ),
            childWhenDragging: Container(),
            onDragEnd: (details) {
              setState(() {
                position = details.offset;
              });
            },
            child: windowContent(),
          ),
        );
      },
    );
  }

  Widget windowContent() {
    return GestureDetector(
      onTap: () {
        hideFloatingWindow();
        Get.to(OngoingRide());
      },
      child: Container(
        width: 150.0,
        height: 100.0,
        color: Colors.blue,
        child: Stack(
          children: [
            Center(
              child: Text(
                'Ongoing Booking',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: GestureDetector(
                onTap: () {
                  hideFloatingWindow();
                },
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



}
