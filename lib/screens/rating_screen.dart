import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/constant/colors.dart';
import 'package:mie_ride_driver/constant/font_family.dart';
import 'package:mie_ride_driver/constant/sizes.dart';
import 'package:mie_ride_driver/controllers/single_controller.dart';
import 'package:mie_ride_driver/utils/static.dart';

import '../constant/image_string/image_string.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {

  var controller = Get.find<SingleController>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      controller.fetchRating("hello");
    });
  }


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var list = controller.ratingList.value!;
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: TColors.background,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Icon(Icons.arrow_back_ios,
                          color: TColors.textPrimary, size: 20,),
                      )
                  ),
                ),
              ),
            ),
          ),
          title: Text("Ratings and Reviews",
            textAlign: TextAlign.center,
            style: FontsFamily.ExtraBold.copyWith(
              color: TColors.textPrimary,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: TColors.background,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(-2, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Text(list.overallRating,
                  style: FontsFamily.ExtraBold.copyWith(
                      fontSize: TSizes.fontSizeLg,
                      color: TColors.info
                  ),),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                decoration: TWidget.rShadow,
                child: RatingBarIndicator(
                    rating: double.parse(list.overallRating),
                    itemBuilder: (context, index) =>
                        Icon(
                          Icons.star,
                          color: TColors.info,
                        ),
                    itemCount: 5,
                    itemSize: 25.0,
                    unratedColor: Colors.amber.withAlpha(50),
                    direction: Axis.horizontal,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0)
                ),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(10),
                decoration: TWidget.rShadow,
                child: Column(
                  children: [
                    chartRow(context, '5 star', list.star5RatedPer ==""?0.0:double.parse(list.star5RatedPer), Colors.green),
                    chartRow(
                        context, '4 star', list.star4RatedPer == ""?0.0:double.parse(list.star4RatedPer), Colors.green),
                    chartRow(
                        context, '3 star',list.star3RatedPer == ""?0.0: double.parse(list.star3RatedPer), Colors.green),
                    chartRow(
                        context, '2 star',list.star2RatedPer == ""?0.0: double.parse(list.star2RatedPer), Colors.green),
                    chartRow(
                        context, '1 star', list.star1RatedPer == ""?0.0: double.parse(list.star1RatedPer), Colors.green),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              ListView.builder(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                itemCount: list.details.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var lists = list.details[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      width: Get.width,
                      decoration: TWidget.rShadow,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius
                                        .circular(30)
                                ),
                                child: Center(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child:  FadeInImage.assetNetwork(
                                        placeholder: 'assets/userload.gif',
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                        image: lists.image,
                                        imageErrorBuilder: (c, o,
                                            s) =>
                                            Image.asset(
                                              USER_IMAGE, height: 50,
                                              width: 50,
                                              fit: BoxFit.cover,
                                            ),
                                      )),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text("Sadhu",
                                            style: FontsFamily.ExtraBold
                                                .copyWith(
                                                color: TColors.info,
                                                fontSize: TSizes.fontSizeLg
                                            ),),
                                          RatingBarIndicator(
                                            rating: double.parse(lists.userRatedToDriver),
                                            itemBuilder: (context, index) =>
                                                Icon(
                                                  Icons.star,
                                                  color: TColors.info,
                                                ),
                                            itemCount: 5,
                                            itemSize: 15.0,
                                            unratedColor: Colors.amber
                                                .withAlpha(50),
                                            direction: Axis.horizontal,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .center,
                                            children: [
                                              Image.asset(
                                                calenderImage, height: 15,
                                                width: 15,),
                                              SizedBox(width: 10,),
                                              Text(lists.date,
                                                style: FontsFamily.ExtraBold
                                                    .copyWith(
                                                    fontSize: TSizes.fontSizeSm
                                                ),)
                                            ],
                                          ),
                                          SizedBox(width: 10,),
                                          Flexible(
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .center,
                                              children: [
                                                Image.asset(
                                                  timeImage, height: 15,
                                                  width: 15,),
                                                SizedBox(width: 10,),
                                                Text(lists.time,
                                                  style: FontsFamily.ExtraBold
                                                      .copyWith(
                                                      fontSize: TSizes
                                                          .fontSizeSm
                                                  ),)
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(3),
                                            decoration: TWidget.rShadow,
                                            child: Text(lists.userRatedToDriver,
                                              style: FontsFamily.ExtraBold
                                                  .copyWith(
                                                  fontSize: TSizes.fontSizeMd,
                                                  color: TColors.info
                                              ),),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: Get.width / 2,
                            child: Text('"${lists.userFeedbackToDriver}"',
                              style: FontsFamily.ExtraBold.copyWith(
                                  fontSize: 13
                              ),),
                          )
                        ],
                      ),
                    ),
                  );
                },)
            ],
          ),
        ),
      );
    });
  }

  Widget chartRow(BuildContext context, String label, double pct,
      Color color,) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
            style: FontsFamily.ExtraBold.copyWith(
                fontSize: TSizes.fontSizeSm,
                color: TColors.info
            ),
          ),
          SizedBox(width: 10),
          Text("0"),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
            child: Stack(
              children: [
                Container(
                  width: Get.width * 0.50,
                  height: 20,
                  decoration: BoxDecoration(
                    color: TColors.background,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: TColors.background),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white, // White shadow on left and top
                        offset: Offset(-3, -3),
                        blurRadius: 8,
                      ),
                      BoxShadow(
                        color: Colors.grey.shade300, // Black shadow on bottom and right
                        offset: Offset(3 ,3),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: LinearProgressIndicator(
                        backgroundColor: TColors.background,
                        value: pct / 100,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            TColors.background)),
                  ),
                ),
                Positioned(
                  left: controller.ratingList.value!.overallRating == "0"?0: (Get.width * 0.50) * (pct / 100) - 10,
                  // Adjusting circle position based on progress


                  child: Container(
                    width: 20, // Width of the circle
                    height: 20, // Height of the circle
                    decoration:BoxDecoration(
                      color: TColors.buttonPrimary,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: TColors.background),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white, // White shadow on left and top
                          offset: Offset(-3, -3),
                          blurRadius: 8,
                        ),
                        BoxShadow(
                          color: Colors.grey.shade300, // Black shadow on bottom and right
                          offset: Offset(3 ,3),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text('100',
            style: FontsFamily.ExtraBold.copyWith(
              fontSize: TSizes.fontSizeSm,
            ),
          ),
          SizedBox(width: 10,),
          Text('${pct.toStringAsFixed(0)}%',
            style: FontsFamily.ExtraBold.copyWith(
                fontSize: TSizes.fontSizeSm,
                color: TColors.info
            ),
          ),
        ],
      ),
    );
  }

}
