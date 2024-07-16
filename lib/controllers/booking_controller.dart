
import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:mie_ride_driver/models/accept_booking_model.dart';
import 'package:mie_ride_driver/models/ongoingModel.dart';
import 'package:mie_ride_driver/screens/loader.dart';
import 'package:mie_ride_driver/screens/ongoing_ride.dart';
import 'package:mie_ride_driver/services/api_service.dart';
import 'package:mie_ride_driver/services/urls.dart';
import 'package:mie_ride_driver/utils/static.dart';

import '../models/accepted_booking_list_model.dart';

class BookingController extends GetxController{

  ApiService service = ApiService();

  MySharedPreferences sp = MySharedPreferences();

  var bookingAvailable = false.obs;
  var timeLeft = 60.obs; // 60 seconds timer
  Timer? timer;
  var checkValue = "".obs;

  void startBooking() {
    bookingAvailable.value = true;
    timeLeft.value = 60; // Reset the timer
    _startTimer();
  }

  void _startTimer() {
    timer?.cancel(); // Cancel any existing timer
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft.value == 0) {
        bookingAvailable.value = false;
        timer.cancel();
       /* cancelBooking("");*/
      } else {
        timeLeft.value--;
      }
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    timers?.cancel();
    super.onClose();
  }



  var arriveList = <AcceptBookingModel>[].obs;
  var acceptBookingList2 = <AcceptedBookingListModel>[].obs;
  var ongoingList = <OnGoingModelModel>[].obs;

  Timer? timers;

  var BookingId = "".obs;

  @override
  void onInit() {
    super.onInit();
    ongoingRide("");
    arriveBooking();
    /*timers  = Timer.periodic(Duration(seconds: 5), (_){
      arriveBooking();
    });*/
  }

  void arriveBooking()async{
    Map<String,dynamic> map = {
      "driver_id" : await sp.getStringValue(sp.USER_ID)??""
    };

    log("id ----$map");
    
    try {
      final response = await service.postData(Urls.driver_arrived_booking, map);

      log("response -----${response.data}");

      arriveList.value = acceptBookingModelFromJson(response.data);

      if(arriveList.length != 0){
        BookingId.value = arriveList[0].allotedId;
      }else{
        BookingId.value = "";
      }



    } on Exception catch (e) {
      log("Exception ---booking",error: e.toString());
    }
  }

  void acceptBooking(String ids)async{
    LoadingDialog.show();
    Map<String,dynamic> map = {
      "driver_id" : await sp.getStringValue(sp.USER_ID)??"",
      "alloted_id" : ids
    };

    log("accept parameter ----$map");

    try {
      final response = await service.postData(Urls.driver_accept_booking_status, map);

      var jsonString = jsonDecode(response.data);

      if(jsonString['result'] == "successfully"){
       bookingAvailable.value = false;
        timer?.cancel();
        customSnackBar("booking accepted");
      }else{
        customSnackBar(jsonString['result'].toString());
      }
      LoadingDialog.hide();
    } on Exception catch (e) {
      LoadingDialog.hide();
     log("accepted Exception- -",error: e.toString());
    }

  }

  void cancelBooking(String status,id)async{
    if(status == "cancel"){
      LoadingDialog.show();
    }
    Map<String,dynamic> map = {
      "driver_id" : await sp.getStringValue(sp.USER_ID)??"",
      "alloted_id" : id,
    };

    log("accept parameter ----$map");

    try {
      final response = await service.postData(Urls.driver_decline_request, map);

      var jsonString = jsonDecode(response.data);

      if(jsonString['result'] == "Success"){
        customSnackBar("booking Canceled");
      }else{
        customSnackBar(jsonString['result'].toString());
      }
      LoadingDialog.hide();
    } on Exception catch (e) {
      LoadingDialog.hide();
      log("Canceled Exception- -",error: e.toString());
    }
  }

  void fetchAcceptedBooking()async{
    LoadingDialog.show();
    Map<String,dynamic> map = {
      "driver_id" : await sp.getStringValue(sp.USER_ID)??""
    };

    try {
      final response = await service.postData(Urls.driver_accepted_booking_list, map);

      log("response -----${response.data}");

      acceptBookingList2.value = acceptedBookingListModelFromJson(response.data);
      LoadingDialog.hide();
    } on Exception catch (e) {
      LoadingDialog.hide();
      log("Exception ---booking fetch",error: e.toString());
    }
  }
  
  void pickupStart(String allotmentId,bookingID)async{
    LoadingDialog.show();
    Map<String,dynamic> map = {
      "driver_id" : await sp.getStringValue(sp.USER_ID)??"",
      "alloted_id" : allotmentId,
      "booking_id" : bookingID
    };
    log("pickup -----$map");
    
    try {
      final response = await service.postData(Urls.driver_start_ride_status, map);

      var jsonString = jsonDecode(response.data);

      if(jsonString['result'] == "successfully"){
        customSnackBar("Booking Started");
        Get.to(OngoingRide());
      }else{
        customSnackBar(jsonString['result'].toString());
      }
      LoadingDialog.hide();
    } on Exception catch (e) {
      LoadingDialog.hide();
     log("Exception start booking --",error: e.toString());
    }
    
  }
  
  void ongoingRide(String status)async{
    if(status != ""){
      LoadingDialog.show();
    }
    Map<String,dynamic> map = {
      "driver_id" : await sp.getStringValue(sp.USER_ID)??""
    };

    try {
      final response = await service.postData(Urls.driver_ongoing_ride_list, map);

      log("response ongoing ----${response.data}");

      ongoingList.value = onGoingModelModelFromJson(response.data);

      LoadingDialog.hide();
    } on Exception catch (e) {
      LoadingDialog.hide();
      log("Exception ongoing --",error: e.toString());
    }
  }
  
  void statusChange(String bookingId,status)async{
    LoadingDialog.show();
    Map<String,dynamic> map = {
      'driver_id' : await sp.getStringValue(sp.USER_ID),
      "booking_id" : bookingId,
      "status" : status,
    };
    
    log("status api parameter --",error: map);
    
    try {
      final response = await service.postData(Urls.driver_start_remaining_ride, map);

         var jsonString = jsonDecode(response.data);

         if(jsonString['result'] == "successfully"){

         }else{
       customSnackBar(jsonString['result'].toString());
         }
      LoadingDialog.hide();
    } on Exception catch (e) {
      LoadingDialog.hide();
     log("Exception ---",error: e.toString());
    }
    
  }

}