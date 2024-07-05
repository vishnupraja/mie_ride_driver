import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/controllers/auth_controller.dart';

import '../constant/image_string/image_string.dart';

class BannerWidget extends StatelessWidget {
  BannerWidget({super.key});

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 1,
          autoPlay: true,
          enlargeCenterPage: true,
          disableCenter: false,
        ),
        items: controller.bannerList
            .map((item) {
              return
                CachedNetworkImage(
                  height: Get.height/2.5,
                  width: Get.width,
                  imageUrl: '${item.bannerImg}',
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url,
                      downloadProgress) =>CupertinoActivityIndicator(),
                  errorWidget: (context, url, error) =>
                      Image.asset(logo, fit: BoxFit.cover,),
                );
        }
          ,)
            .toList(),
      );
    });
  }
}
