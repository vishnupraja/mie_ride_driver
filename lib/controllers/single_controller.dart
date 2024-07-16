import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:mie_ride_driver/models/booking_id_model.dart';
import 'package:mie_ride_driver/models/rating_model.dart';
import 'package:mie_ride_driver/screens/message_screen.dart';
import 'package:mie_ride_driver/services/api_service.dart';
import 'package:mie_ride_driver/utils/static.dart';

import '../models/fetch_query_model.dart';
import '../models/fetch_single_query_model.dart';
import '../models/notification_model.dart';
import '../screens/loader.dart';
import '../services/urls.dart';

class SingleController extends GetxController {
  ApiService apiService = ApiService();
  MySharedPreferences sp = MySharedPreferences();

  var writeSupportLoader = false.obs;
  var fetchQueryLoader = false.obs;
  var fetchQueryList = <FetchQueryModel>[].obs;
  var fetchSingleQueryList = <FetchSingleQueryModel>[].obs;
  var fetchSingleQueryLoader = false.obs;
  var closeQueryLoader = false.obs;
  var replyLoader = false.obs;

  var notificationList = <NotificationModel>[].obs;
  var newsList = [].obs;
  var ratingList = Rxn<RatingModel>();
  var bookingIdList = <BookingIdModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCoupon();
    Future.delayed(Duration.zero, () {
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

  void notification() async {
    LoadingDialog.show();
    Map<String, dynamic> map = {
      'driver_id': /*await sp.getStringValue(sp.USER_ID)??*/ "94"
    };

    try {
      final response = await apiService.postData(Urls.notificationFetch, map);

      log("response -------${response.data}");

      notificationList.value = notificationModelFromJson(response.data);

      LoadingDialog.hide();
    } catch (e) {
      LoadingDialog.hide();
      log("Exception -------", error: e.toString());
    }
  }

  void newsFeed() async {
    LoadingDialog.show();
    Map<String, dynamic> map = {
      'driver_id': /*await sp.getStringValue(sp.USER_ID)??*/ "11"
    };

    try {
      final response =
          await apiService.postData(Urls.driver_fetch_admin_notification, map);

      log("response -------${response.data}");

      newsList.value = jsonDecode(response.data);

      LoadingDialog.hide();
    } catch (e) {
      LoadingDialog.hide();
      log("Exception -------", error: e.toString());
    }
  }

  void fetchRating(String status) async {
    if (status == "hello") {
      LoadingDialog.show();
    }
    Map<String, dynamic> map = {
      'driver_id': await sp.getStringValue(sp.USER_ID) ?? "53"
    };

    try {
      final response = await apiService.postData(Urls.driver_fetch_rating, map);
      log("response rating -------${response.data}");

      ratingList.value = ratingModelFromJson(response.data!);

      if (status == "hello") {
        LoadingDialog.hide();
      }
    } catch (e) {
      LoadingDialog.hide();
      log("Exception -------", error: e.toString());
    }
  }

  void rideSupportChat(String subject, message, booking_id) async {
    LoadingDialog.show();
    Map<String, dynamic> map = {
      "driver_id": await sp.getStringValue(sp.USER_ID) ?? "",
      "subject": subject,
      "booking_id": booking_id,
      "message": message,
    };

    try {
      final response =
          await apiService.postData(Urls.driver_ride_support_chat, map);

      var data = jsonDecode(response.data);

      log("response -----$data");

      if (data['result'] == "successfully") {
        LoadingDialog.hide();
        fetchQuery("hi");
        customSnackBar("Message sent successfully");
      } else {
        LoadingDialog.hide();
        customSnackBar("Something went wrong");
      }
    } catch (e) {
      LoadingDialog.hide();
      log("Exception -----", error: e.toString());
    }
  }

  var loader = false.obs;

  void fetchBookingId() async {
    loader.value = true;
    Map<String, dynamic> map = {
      'driver_id': await sp.getStringValue(sp.USER_ID)
    };

    try {
      final response =
          await apiService.postData(Urls.driver_fetch_booking_ids, map);

      log("response id ----${response.data}");

      bookingIdList.value = bookingIdModelFromJson(response.data);

      loader.value = false;
    } catch (e) {
      loader.value = false;

      log("Exception ---", error: e.toString());
    }
  }

  void fetchQuery(String status) async {
    if (status == "") {
      LoadingDialog.show();
    }
    Map<String, dynamic> map = {
      'driver_id': await sp.getStringValue(sp.USER_ID) ?? "",
    };

    try {
      final response =
          await apiService.postData(Urls.fetch_driver_write_support_list, map);

      log(" fetch query response -----${response.data}");

      fetchQueryList.value = fetchQueryModelFromJson(response.data);
      LoadingDialog.hide();
    } catch (e) {
      LoadingDialog.hide();
      log("fetch Query Exception ---", error: e.toString());
    }
  }

  void fetchSingleQuery(String complain_number, String status) async {
    if (status == "") {
      LoadingDialog.show();
    }

    Map<String, dynamic> map = {
      'driver_id': await sp.getStringValue(sp.USER_ID) ?? "",
      'complain_number': complain_number,
    };

    log("parameter -----$map");

    try {
      final response =
          await apiService.postData(Urls.driver_fetch_single_thread, map);

      log(" single query response -----${response.data}");

      fetchSingleQueryList.value = fetchSingleQueryModelFromJson(response.data);
      if (status == "") {
        LoadingDialog.hide();
      }
    } catch (e) {
      if (status == "") {
        LoadingDialog.hide();
      }
      log("single Query Exception ---", error: e.toString());
    }
  }

  void closeTicket(String complain_number) async {
    LoadingDialog.show();
    Map<String, dynamic> map = {
      'driver_id': await sp.getStringValue(sp.USER_ID) ?? "",
      'complain_number': complain_number,
    };

    try {
      final response = await apiService.postData(Urls.driver_close_ticket, map);
      var jsonString = jsonDecode(response.data);
      log(" close query response -----$jsonString");

      if (jsonString['result'] == "successfully") {
        customSnackBar("Ticket Closed");
        fetchQuery("fetch");
      } else {
        customSnackBar("something went wrong");
      }
      LoadingDialog.hide();
    } catch (e) {
      LoadingDialog.hide();
      log("close Query Exception ---", error: e.toString());
    }
  }

  void replyThread(String complain_number, message) async {
    Map<String, dynamic> map = {
      'driver_id': await sp.getStringValue(sp.USER_ID) ?? "",
      'message': message,
      'complain_number': complain_number,
    };

    final response = await apiService.postData(Urls.driver_reply_thread, map);
    var jsonString = jsonDecode(response.data);
    log(" reply query response -----$jsonString");
    if (jsonString['result'] == "successfully") {
      fetchSingleQuery(complain_number, "hii");
    } else {
        customSnackBar("something went wrong");
    }
    
  }
}
