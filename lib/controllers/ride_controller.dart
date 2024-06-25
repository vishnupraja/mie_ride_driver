

import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:mie_ride_driver/models/driver_booking_history_model.dart';
import 'package:mie_ride_driver/screens/loader.dart';
import 'package:mie_ride_driver/services/api_service.dart';
import 'package:mie_ride_driver/services/urls.dart';
import 'package:mie_ride_driver/utils/static.dart';

class RideController extends GetxController{

  ApiService apiService = ApiService();
  MySharedPreferences sp = MySharedPreferences();

  var totalEarning = "".obs;
  var totalRide = "".obs;
  var rideHistoryList = <DriverBookingHistoryModel>[].obs;

  void fetchMieRideEarning()async{

    Map<String,dynamic> map = {
      'driver_id' : await sp.getStringValue(sp.USER_ID)??""/*"44"*/
    };
    try{

      final response = await apiService.postData(Urls.driver_total_ride_and_earning, map);

      var data = jsonDecode(response.data);

      if(data['Total_Earnings'] != "" || data["Total_Rides"] != ""){
        totalEarning.value = data['Total_Earnings'].toString();
        totalRide.value = data['Total_Rides'].toString();

      }else{

        customSnackBar("Something went wrong");
      }

    }catch(e){
      log("Exception------",error: e.toString());
    }

  }

  void driverHistory()async{
    LoadingDialog.show();
    Map<String,dynamic> map = {
      'driver_id' : await sp.getStringValue(sp.USER_ID)??""
    };
    
    try{
      
      final response = await apiService.postData(Urls.driver_fetch_booking_history_list, map);

      log("response ------${response.data}");

      rideHistoryList.value = driverBookingHistoryModelFromJson(response.data);
      LoadingDialog.hide();
    }catch(e){
      LoadingDialog.hide();
      log("Exception -------",error: e.toString());
    }
    
  }

}