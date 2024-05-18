import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/controllers/profile_Controller.dart';
import '../../constant/colors.dart';
import '../../constant/font_family.dart';
import '../../utils/static.dart';

class FAQ extends StatefulWidget {
  const FAQ({super.key});

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {

  final controller = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      controller.fetchFaq();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: TColors.background,
          leading: InkWell(
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
          title: Text("FAQ",
            textAlign: TextAlign.center,
            style: FontsFamily.ExtraBold.copyWith(
              color: TColors.textPrimary,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(height: 12,),
            Center(child: Text("Frequently asked questions",
              style: FontsFamily.ExtraBold.copyWith(
                color: TColors.info,
                fontSize: 15,
              ),),),
            Expanded(
              child: ListView.builder(
                itemCount: controller.faqList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: TWidget.rShadow,
                    width: Get.width,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          width: Get.width,
                          decoration: TWidget.rShadow,
                          child: Text(controller.faqList[index]["ques"],
                            style: FontsFamily.ExtraBold.copyWith(
                              color: TColors.info,
                              fontSize: 15,
                            ),),),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          child: Text(controller.faqList[index]["answer"],
                            style: FontsFamily.ExtraBold.copyWith(
                              color: TColors.textPrimary,
                              fontSize: 13,
                            ),),
                        ),
                      ],
                    ),
                  );
                },),
            )
          ],
        ),
      );
    });
  }
}
