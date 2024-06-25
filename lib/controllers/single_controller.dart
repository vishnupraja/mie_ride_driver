

import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:mie_ride_driver/models/rating_model.dart';
import 'package:mie_ride_driver/services/api_service.dart';
import 'package:mie_ride_driver/utils/static.dart';

import '../models/notification_model.dart';
import '../screens/loader.dart';
import '../services/urls.dart';

class SingleController extends GetxController{

  ApiService apiService = ApiService();
  MySharedPreferences sp = MySharedPreferences();

  var notificationList = <NotificationModel>[].obs;
  var newsList = [].obs;
  var ratingList = Rxn<RatingModel>();

  @override
  void onInit() {
    super.onInit();
    fetchCoupon();
    Future.delayed(Duration.zero, (){
      fetchRating("");
    });
  }

  RxList<dynamic> couponList = RxList<dynamic>();

  void fetchCoupon() async {
    try {
      final response = await apiService.getData(Urls.fetch_coupon);
      log("response -----${response.data}");

      // Convert the JSON data to a List and assign it to couponList
      couponList.assignAll(jsonDecode(response.data));
    } catch (e) {
      log("Exception ----", error: e.toString());
    }
  }

  void notification()async{
    LoadingDialog.show();
    Map<String,dynamic> map = {
      'driver_id' : /*await sp.getStringValue(sp.USER_ID)??*/"94"
    };

    try{
      final response = await apiService.postData(Urls.notificationFetch, map);

      log("response -------${response.data}");

      notificationList.value = notificationModelFromJson(response.data);

      LoadingDialog.hide();

    }catch(e){
      LoadingDialog.hide();
      log("Exception -------",error: e.toString());
    }
  }

  void newsFeed()async{
    LoadingDialog.show();
    Map<String,dynamic> map = {
      'driver_id' : /*await sp.getStringValue(sp.USER_ID)??*/"11"
    };

    try{
      final response = await apiService.postData(Urls.driver_fetch_admin_notification, map);

      log("response -------${response.data}");

      newsList.value = jsonDecode(response.data);

      LoadingDialog.hide();

    }catch(e){
      LoadingDialog.hide();
      log("Exception -------",error: e.toString());
    }
  }

  void fetchRating(String status)async{
    if(status == "hello"){
      LoadingDialog.show();
    }
    Map<String,dynamic> map = {
      'driver_id' : /*await sp.getStringValue(sp.USER_ID)??*/"53"
    };

    try{
      final response = await apiService.postData(Urls.driver_fetch_rating, map);
      log("response rating -------${response.data}");

      ratingList.value = ratingModelFromJson(response.data!);

if(status == "hello"){
  LoadingDialog.hide();
}

    }catch(e){
      LoadingDialog.hide();
      log("Exception -------",error: e.toString());
    }
  }

  void rideSupportChat(String subject,message,booking_id)async{
    LoadingDialog.show();
    Map<String,dynamic> map = {
      "driver_id" : await sp.getStringValue(sp.USER_ID)??"",
      "subject" : subject,
      "booking_id":  "1",
      "message": message,
      
    };
    
    try{
      
      final response =  await apiService.postData(Urls.driver_ride_support_chat, map);

      var data  = jsonDecode(response.data);

      log("response -----$data");

      if(data['result'] == "successfully"){
        LoadingDialog.hide();
        Get.back();
        customSnackBar("Message sent successfully");
      }else{
        LoadingDialog.hide();
        customSnackBar("Something went wrong");
      }
      
    }catch(e){
      LoadingDialog.hide();
      log("Exception -----",error: e.toString());
    }
    
  }


}