import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:mie_ride_driver/services/urls.dart';

import '../screens/loader.dart';
import '../services/api_service.dart';
import '../utils/static.dart';

class HomeController extends GetxController{


  MySharedPreferences sp = MySharedPreferences();
  ApiService apiService = ApiService();

  var selectedIndex = 2.obs;

  var counter = 0.obs;
  var startTime = "Start time".obs;

  void increment() {
    if(counter <6){
      counter++;
    }
  }
  void decrement() {
    if (counter > 0) {
      counter--;
    }
  }




  void shareAvailability(String date,startTime,endTime,startCity,dropCity)async{
    LoadingDialog.show();
    Map<String,dynamic> map = {
    "driver_id": await sp.getStringValue(sp.USER_ID)??"",
    "start_date": date,
    "start_time": startTime,
    "end_time": endTime,
    "start_city":startCity,
    "drop_cities":dropCity,
    };
    
    log("parameter ----$map");
    
    try {
      final response = await apiService.postData(Urls.driver_add_availability, map);

      var jsonString = jsonDecode(response.data);

      if(jsonString["result"] == "Success"){
        Get.back();
        customSnackBar("Availability added successfully");
      }else{
        customSnackBar("something went wrong");
      }
      LoadingDialog.hide();
    } on Exception catch (e) {
      LoadingDialog.hide();
    log("Exception ---",error: e.toString());
    }
    
  }

  void shareRout(String startPoint,endPoint,startsTime,startDate,endTime,endDate,seat)async{
    LoadingDialog.show();
    Map<String,dynamic> share = {
      "driver_id": await sp.getStringValue(sp.USER_ID)??"",
    "start_date":startDate,
    "start_time":startsTime,
    "reach_date":endDate,
    "reach_time":endTime,
    "start_point":startPoint,
    "end_point":endPoint,
    "seat_available":seat
    };

    log("parameter -----$share");

    try {
      final response = await apiService.postData(Urls.driver_add_share_route, share);

      var jsonString = jsonDecode(response.data);

      if(jsonString['result'] == "Success"){
        Get.back();
        startTime.value = "Start time";
        customSnackBar("Rout Shared Successfully");
      }else{
        customSnackBar(jsonString['result'].toString());
      }
      LoadingDialog.hide();
    } on Exception catch (e) {
      LoadingDialog.hide();
     log("Exception ----",error: e.toString());
    }
  }
}