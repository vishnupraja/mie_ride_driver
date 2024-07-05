import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart'as DIO;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/controllers/single_controller.dart';
import 'package:mie_ride_driver/models/banner_model.dart';
import 'package:mie_ride_driver/models/city_fetch_model.dart';
import 'package:mie_ride_driver/route_helper/Route_Helper.dart';
import 'package:mie_ride_driver/screens/loader.dart';
import 'package:mie_ride_driver/services/api_service.dart';
import 'package:mie_ride_driver/utils/static.dart';

import '../main.dart';
import '../services/demo.dart';
import '../services/urls.dart';

class AuthController extends GetxController{



  MySharedPreferences sp = MySharedPreferences();
  ApiService apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    banner();
  }

  var licenceImageString   = Rxn<File>();
  var ownerImageString1    = Rxn<File>();
  var insuranceImageString = Rxn<File>();
  var profileImageString   = Rxn<File>();

  var status = "".obs;

  var fNameCtr    = "".obs;
  var lNameCtr    = "".obs;
  var emailCtr    = "".obs;
  var passwordCtr = "".obs;
  var phoneCtr    = "".obs;
  var code        = "".obs;
  var flag        = "".obs;



  var signupLoading = false.obs;
  var loginLoading = false.obs;
  var vehicleLoading = false.obs;
  var cityLoading = false.obs;

  var vehicleList = [].obs;
 var  isSelected = false.obs;
  var selectedCarIds = [].obs;
  var cityList = <FetchCityModel>[].obs;
  var bannerList = <BannerModel>[].obs;

  void signup(String vehicleNumber,vehicle,)async{

    LoadingDialog.show();

    Map<String,dynamic> map = {
    "first_name": fNameCtr.value,
    "last_name":lNameCtr.value ,
    "country_code":code.value,
    "contact":phoneCtr.value,
    "email":emailCtr.value,
    "password":passwordCtr.value,
    "flag": flag.value,
    "vehicle_id": vehicle,
    "vehicle_no": vehicleNumber,
    "image": await DIO.MultipartFile.fromFile(profileImageString.value!.path,filename: profileImageString.value!.path.split("/").last),
    "licence_image": await DIO.MultipartFile.fromFile(licenceImageString.value!.path,filename: licenceImageString.value!.path.split("/").last),
    "insurance_image":await DIO.MultipartFile.fromFile(insuranceImageString.value!.path,filename: insuranceImageString.value!.path.split("/").last),
    "ownership_image":await DIO.MultipartFile.fromFile(ownerImageString1.value!.path,filename: ownerImageString1.value!.path.split("/").last),
    };
    try{

      final response =  await apiService.postData(Urls.signup, map);

      var jsonString = jsonDecode(response.data);

      if(jsonString['result'] == "Success"){
        LoadingDialog.hide();
        sp.setStringValue(sp.USER_ID, jsonString["id"].toString());
        licenceImageString.value = null;
        ownerImageString1.value = null;
        insuranceImageString.value = null;
        profileImageString.value = null;
        customSnackBar("Signup successfully");
        Get.offNamed(RouteHelper.getLoginPage());
      }
      else {
        LoadingDialog.hide();
        customSnackBar(jsonString["result"].toString());
      }

    }catch(e){
      LoadingDialog.hide();
      log("Exception ----",error: e.toString());
    }

  }

  void login(String contact, password , code,)async{
      LoadingDialog.show();
    Map<String,dynamic> map = {
      "country_code"    :code,
      "contact"         :contact,
      "password"        :password,
    };



    try{

      final response =  await apiService.postData(Urls.login, map);

      var jsonString = jsonDecode(response.data);



      if(jsonString['result'] == "success"){
        LoadingDialog.hide();
        Get.find<SingleController>().fetchRating("");
        customSnackBar("Login successfully");
        sp.setStringValue(sp.USER_ID, jsonString["driver_id"].toString());
        sp.setBoolValue(sp.Login_key, true);
        Get.offAllNamed(RouteHelper.getBottomPage());
      }else if(jsonString['result'] == "unsuccess"){
        LoadingDialog.hide();
        customSnackBar("Something went wrong");
      }else{
        LoadingDialog.hide();
        customSnackBar(jsonString['result'].toString());
      }

    }catch(e){
      LoadingDialog.hide();
      log("Exception ----",error: e.toString());

    }

  }

  void deleteAccount()async{
    LoadingDialog.show();
    Map<String,dynamic> map = {
      "driver_id" : await sp.getStringValue(sp.USER_ID) ?? ""
    };

    try{

      final response =  await apiService.postData(Urls.driver_delete_account, map);

      var jsonString = jsonDecode(response.data);

      log("response ----->$jsonString");

      if(jsonString['result'] == "success"){
        sp.clearData();
        Get.offAllNamed(RouteHelper.getLoginPage());
      }else{
        LoadingDialog.hide();
        customSnackBar(jsonString['result'].toString());
      }

    }catch(e){
      LoadingDialog.hide();
      log("Exception ----",error: e.toString());

    }

  }

  void fetchCars() async {
    vehicleLoading.value = true;
    try{
      final response = await apiService.getData(Urls.fetch_vehicle);
      if (response.statusCode == 200) {
        vehicleList.value = jsonDecode(response.data);
      } else {
        throw Exception('Failed to load cars');
      }
      vehicleLoading.value = false;
    }catch(e){
      vehicleLoading.value = false;
      log("vehicle Exception ----",error: e.toString());
    }

  }

  void fetchCities()async{
    cityLoading.value = true;
    try {
      final response =  await apiService.getData(Urls.fetch_cities,);

      log("city response ----$response");

      cityList.value = fetchCityModelFromJson(response.data);
      cityLoading.value = false;

    } on Exception catch (e) {
      cityLoading.value = false;
    log("exception -----",error: e.toString());
    }
  }

  void banner() async {
    try{
      final response = await apiService.getData(Urls.driver_ads_banner);
      print("response banner ----${response.data}");
      bannerList.value = bannerModelFromJson(response.data);
    }catch(e){
      log("banner Exception ----",error: e.toString());
    }

  }



}