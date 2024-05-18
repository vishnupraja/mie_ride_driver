import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/constant/image_string/image_string.dart';

import '../myApp.dart';



class LoadingDialog extends StatelessWidget {
  static void show() => showDialog<void>(
    context: Get.context!,
    useRootNavigator: false,
    barrierColor: Colors.transparent,
    barrierDismissible: false,
    builder: (_) => LoadingDialog(),
  ).then((_) => FocusScope.of(Get.context!).requestFocus(FocusNode()));
  static void hide() => Navigator.pop(Get.context!);
  LoadingDialog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        height: height,
        width: width,
        color: Colors.transparent,
        child: Center(
          child:Card(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(LANDING_IMAGE,height: 30,width: 30,),
                Platform.isAndroid?
                CircularProgressIndicator(color: Colors.black,):CupertinoActivityIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
