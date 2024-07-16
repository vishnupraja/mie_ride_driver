import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/controllers/single_controller.dart';
import '../../constant/colors.dart';
import '../../constant/font_family.dart';
import '../../constant/sizes.dart';
import '../../constant/text_strings.dart';
import '../../route_helper/Route_Helper.dart';
import '../../utils/static.dart';
import '../message_screen.dart';

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

  final controller = Get.find<SingleController>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      controller.fetchBookingId();
      controller.fetchQuery("");
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
        title: Text("Ride support chat",
          textAlign: TextAlign.center,
          style: FontsFamily.ExtraBold.copyWith(
            color: TColors.textPrimary,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                      vertical: 40, horizontal: 15),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        decoration: TWidget.rShadow,
                        child: Obx(() {
                          if (controller.loader.value) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            return DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20),
                                dropdownColor: TColors.background,
                                hint: Text(
                                  TTexts.selectRideText,
                                  style: FontsFamily.ExtraBold
                                      .copyWith(
                                    color: TColors.info,
                                    fontSize: TSizes.fontSizeMd,
                                  ),
                                ),
                                value: vehicle,
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  size: 30,
                                  color: TColors.info,
                                ),
                                isExpanded: true,
                                items: controller.bookingIdList.map(
                                      (value) {
                                    return DropdownMenuItem<String>(
                                      value: value.bookingId,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          value.bookingId,
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
                            );
                          }
                        }),
                      ),
                      SizedBox(height: 10,),
                      CustomField(
                        textInputType: TextInputType.text,
                        hintText: "Add subject",
                        textEditingController: subCtr,
                        size: TSizes.fontSizeMd,
                      ),
                      SizedBox(height: 50,),
                      Container(
                        decoration: TWidget.rShadow,
                        child: TextFormField(
                          style: FontsFamily.ExtraBold.copyWith(
                              color: TColors.textPrimary,
                              fontSize: TSizes.fontSizeMd
                          ),
                          controller: msgCtr,
                          textInputAction: TextInputAction.done,
                          maxLines: 15,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: TTexts.AddMessageText,
                              hintStyle: FontsFamily.ExtraBold.copyWith(
                                fontSize: TSizes.fontSizeMd,
                                color: TColors.textSecondary,
                              ),
                              contentPadding: EdgeInsets.only(left: 12, top: 5)
                          ),
                        ),
                      ),
                      SizedBox(height: 50,),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            validation();
                          },
                          child: Container(
                            height: 50,
                            width: 160,
                            decoration: TWidget.rShadow,
                            child: Center(
                              child: Text(TTexts.SendMessageText,
                                style: FontsFamily.ExtraBold.copyWith(
                                    fontSize: TSizes.fontSizeMd,
                                    color: TColors.info
                                ),),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      if(controller.fetchQueryList.length != 0 )
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            border: TableBorder.all(width: 1),
                            columnSpacing: 30,
                            columns: const [
                              DataColumn(
                                  label: Text('Complain No.'), numeric: false),
                              DataColumn(
                                  label: Text('Subject'), numeric: false),
                              DataColumn(label: Text('Time'), numeric: false),
                              DataColumn(label: Text('Status'), numeric: false),
                            ],
                            rows: List.generate(
                              controller.fetchQueryList.length,
                                  (index) {
                                var data = controller.fetchQueryList[index];
                                return DataRow(
                                  cells: [
                                    DataCell(
                                      Container(
                                        /* width: Get.width/2,*/
                                          child: Text(
                                            data.complainNumber.toString(),
                                            softWrap: true, maxLines: 2,)),
                                    ),
                                    DataCell(
                                      Container(
                                          width: Get.width / 2,
                                          child: Text(
                                            data.subject.toString(),
                                            softWrap: true,
                                            maxLines: 2,)),
                                    ),
                                    DataCell(
                                      Container(
                                        /* width: Get.width/2,*/
                                          child: Text(
                                            data.time.toString(),
                                            softWrap: true,
                                            maxLines: 2,)),
                                    ),
                                    DataCell(
                                      Container(
                                        /*  width: Get.width/2,*/
                                          child: InkWell(
                                              onTap: () {
                                                if (data.status == "opened") {
                                                  Get.to(
                                                      MessageScreen(),
                                                      arguments: {
                                                        'status': data.status,
                                                        "number": data.complainNumber
                                                      });
                                                } else {
                                                  Get.to(
                                                      MessageScreen(),
                                                      arguments: {
                                                        'status': data.status,
                                                        "number": data.complainNumber
                                                      });
                                                }
                                              },
                                              child: Text(
                                                data.status.toString(),
                                                softWrap: true,
                                                maxLines: 2,
                                                style: TextStyle(
                                                    color: data.status ==
                                                        "opened"
                                                        ? Colors.green
                                                        : Colors.red),))),
                                    ),
                                  ],
                                );
                              },
                            ).toList(),
                            showBottomBorder: true,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  void validation() {
    if (vehicle == null) {
      customSnackBar("Please select ride");
    } else if (subCtr.text.isEmpty) {
      customSnackBar("Please enter your subject");
    } else if (msgCtr.text.isEmpty) {
      customSnackBar("Please enter your message");
    } else {
      Get.find<SingleController>().rideSupportChat(
          subCtr.text, msgCtr.text, vehicle);
    }
  }

}
