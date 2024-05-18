import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/controllers/single_controller.dart';

import '../../constant/colors.dart';
import '../../constant/font_family.dart';
import '../../constant/image_string/image_string.dart';
import '../../constant/sizes.dart';
import '../../constant/text_strings.dart';
import '../../utils/static.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({super.key});

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {

  var controller = Get.find<SingleController>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      controller.newsFeed();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Column(
          children: [
            SizedBox(height: TSizes.xl,),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: customAppbar(TTexts.NewsfeedText)),
            Expanded(child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.newsList.length,
              itemBuilder: (context, index) {
                var list = controller.newsList[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: TWidget.bShadow,
                  child: Column(
                    children: [
                      Center(
                        child: Text(list['title'],
                          style: FontsFamily.ExtraBold.copyWith(
                            fontSize: TSizes.fontSizeMd,
                          ),),
                      ),
                      Center(
                        child: Text(list['message'],
                            style: FontsFamily.ExtraBold.copyWith(
                              fontSize: TSizes.fontSizeSm,
                              color: TColors.buttonPrimary,
                            ),
                            textAlign: TextAlign.center
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                          height: 180,
                          width: Get.width / 1.4,
                          decoration: TWidget.boxDecoration,
                          child: ClipRRect(
                            borderRadius: BorderRadius
                                .circular(70),
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/userload.gif',
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                              image: list['Image'],
                              imageErrorBuilder: (c, o,
                                  s) =>
                                  Image.asset(
                                    USER_IMAGE, height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                  ),
                            ),
                          )
                      )
                    ],
                  ),
                );
              },))
          ],
        ),
      );
    });
  }
}
