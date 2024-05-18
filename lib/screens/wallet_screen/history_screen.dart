import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/constant/font_family.dart';

import '../../constant/colors.dart';
import '../../constant/image_string/image_string.dart';
import '../../constant/sizes.dart';
import '../../constant/text_strings.dart';
import '../../controllers/wallete_controller.dart';
import '../../utils/static.dart';
class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {

  var controller = Get.find<WalletController>();

  @override
  void initState() {
    super.initState();
    controller.historyFetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            SizedBox(height: 30,),
            customAppbar(TTexts.HistoryText),
            SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                 return Container(
                   margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                   padding: EdgeInsets.symmetric(vertical: 15,horizontal: 8),
                   decoration: TWidget.bShadow,
                   child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: TColors.background,
                            borderRadius: TWidget.borderRadiusOnly,
                            boxShadow: TWidget.boxShadow,
                          ),
                          child: Center(
                            child: Image.asset(historyDollerImage,height: 30,),
                          ),
                        ),
                        Expanded(child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("Trip commission token",
                                  style: FontsFamily.ExtraBold.copyWith(
                                    fontSize: 12,
                                    color: TColors.textPrimary
                                  ),),
                                  Text("-${TTexts.CurrencyCanada} 20",
                                    style: FontsFamily.ExtraBold.copyWith(
                                        fontSize: 10,
                                        color: TColors.acceptColor
                                    ),)
                                ],
                              ),
                              SizedBox(height: 8.0,),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 28),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Total base fare",
                                      style: FontsFamily.ExtraBold.copyWith(
                                          fontSize: 10,
                                          color: TColors.textPrimary
                                      ),),
                                    Text("Bal:${TTexts.CurrencyCanada} 600",
                                      style: FontsFamily.ExtraBold.copyWith(
                                          fontSize: 10,
                                          color: TColors.textPrimary
                                      ),)
                                  ],
                                ),
                              ),
                              SizedBox(height: 8.0,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("22 feb 2024, 04:30 pm",
                                    style: FontsFamily.ExtraBold.copyWith(
                                        fontSize: 10,
                                        color: TColors.textPrimary
                                    ),),
                                  Text("Bal:${TTexts.CurrencyCanada} 600",
                                    style: FontsFamily.ExtraBold.copyWith(
                                        fontSize: 10,
                                        color: TColors.rideCompleteColor
                                    ),)
                                ],
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                 );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
