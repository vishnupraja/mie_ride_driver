import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/constant/colors.dart';
import 'package:mie_ride_driver/constant/font_family.dart';
import 'package:mie_ride_driver/constant/sizes.dart';
import 'package:mie_ride_driver/utils/static.dart';

import '../constant/image_string/image_string.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: Get.height/16,),
            customAppbar("Ratings and Reviews"),
            SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.all(20),
              decoration: TWidget.bBoxDecoration,
              child: Text("3.8",
              style: FontsFamily.ExtraBold.copyWith(
                fontSize: TSizes.fontSizeLg,
                color: TColors.info
              ),),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              padding: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
              decoration: TWidget.bShadow,
              child: RatingBarIndicator(
                rating: 5,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: TColors.info,
                ),
                itemCount: 5,
                itemSize: 25.0,
                unratedColor: Colors.amber.withAlpha(50),
                direction:  Axis.horizontal,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0)
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(10),
              decoration: TWidget.bShadow,
              child: Column(
                children: [
                  chartRow(context, '5 star', double.parse("36"),Colors.green),
                  chartRow(context, '4 star', double.parse("16"),Colors.green),
                  chartRow(context, '3 star', double.parse("76"),Colors.green),
                  chartRow(context, '2 star', double.parse("36"),Colors.green),
                  chartRow(context, '1 star', double.parse("36"),Colors.green),
                ],
              ),
            ),
            SizedBox(height: 20,),
            ListView.builder(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      width: Get.width,
                      decoration: TWidget.bShadow,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: TWidget.bShadow,
                                child: Center(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child: Image.asset(USER_IMAGE,height: 50,width: 50,fit: BoxFit.cover,)),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Sadhu",
                                            style: FontsFamily.ExtraBold.copyWith(
                                                color: TColors.info,
                                                fontSize: TSizes.fontSizeLg
                                            ),),
                                          RatingBarIndicator(
                                              rating: 5,
                                              itemBuilder: (context, index) => Icon(
                                                Icons.star,
                                                color: TColors.info,
                                              ),
                                              itemCount: 5,
                                              itemSize: 15.0,
                                              unratedColor: Colors.amber.withAlpha(50),
                                              direction:  Axis.horizontal,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(calenderImage,height: 15,width: 15,),
                                              SizedBox(width: 10,),
                                              Text("2023/12/13",
                                                style: FontsFamily.ExtraBold.copyWith(
                                                    fontSize: TSizes.fontSizeSm
                                                ),)
                                            ],
                                          ),
                                          SizedBox(width: 10,),
                                          Flexible(
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(timeImage,height: 15,width: 15,),
                                                SizedBox(width: 10,),
                                                Text("4:30 PM",
                                                  style: FontsFamily.ExtraBold.copyWith(
                                                      fontSize: TSizes.fontSizeSm
                                                  ),)
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(2),
                                            decoration: TWidget.bShadow,
                                            child: Text("4.2",
                                              style: FontsFamily.ExtraBold.copyWith(
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
                            width: Get.width/2,
                            child: Text('"great driver"',
                              style: FontsFamily.ExtraBold.copyWith(
                                  fontSize: TSizes.fontSizeMd
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
  }

  Widget chartRow(BuildContext context, String label, double pct, Color color,) {
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
            child:Stack(
              children: [
                Container(
                  width: Get.width * 0.50,
                  height: 10,
                  decoration: TWidget.bShadow,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: LinearProgressIndicator(
                        backgroundColor: TColors.background,
                        value: pct/100,
                        valueColor: AlwaysStoppedAnimation<Color>(TColors.background)),
                  ),
                ),
                Positioned(
                  left: (Get.width * 0.50) * (pct / 100) - 10, // Adjusting circle position based on progress
                  top: 0,
                  child: Container(
                    width: 20, // Width of the circle
                    height: 10, // Height of the circle
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
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
