import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart'as DIO;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/constant/text_strings.dart';
import 'package:mie_ride_driver/main.dart';
import 'package:mie_ride_driver/services/api_service.dart';
import 'package:mie_ride_driver/utils/static.dart';

import '../constant/image_string/image_string.dart';
import '../screens/loader.dart';
import '../services/urls.dart';

class ProfileController extends GetxController{

  var changeScreen = "Personal".obs;
  ApiService apiService = ApiService();
  MySharedPreferences sp = MySharedPreferences();

  var licenceImageString   = Rxn<File>();
  var insuranceImageString = Rxn<File>();
  var ownerImageString    = Rxn<File>();
  var profileImageString   = Rxn<File>();

  var status = "".obs;

var profileLoad = false.obs;

  var fNameCtr   = "".obs;
  var lNameCtr   = "".obs;
  var emailCtr   = "".obs;
  var passwordCtr= "".obs;
  var phoneCtr   = "".obs;


var term = "".obs;
var privacy = "".obs;

  Future<String> fetchProfile()async{
    profileLoad.value = true;
    LoadingDialog.show();
    Map<String,dynamic>map = {
      'driver_id' : await sp.getStringValue(sp.USER_ID)??""
    };
    try{

      final response = await apiService.postData(Urls.profile, map);

      var jsonString = jsonDecode(response.data);

      if(jsonString['result'] == "successfully"){
        TTexts.name = jsonString['first_name'];
        TTexts.lastN = jsonString['last_name'];
        TTexts.Email = jsonString['email'];
        TTexts.Phone = jsonString['contact'];
        TTexts.vehicleN = jsonString['vehicle_no'];
        TTexts.vehicle = jsonString['vehicle_id'];
        LImage = jsonString['licence_image'];
        IImage = jsonString['insurance_image'];
        OImage = jsonString['ownership_image'];
        profileImage = jsonString['Image'];
        term.value = jsonString['terms'];
        TTexts.countryFlag = jsonString['flag'];
        TTexts.countryCode = jsonString['country_code'];
        privacy.value = jsonString['privacy_policy'];
      }
      else{
        customSnackBar("Something went wrong");
      }
      LoadingDialog.hide();
      profileLoad.value = false;
      return jsonString['result'];
    }catch(e){
      profileLoad.value = false;
      LoadingDialog.hide();
      log("Exception ----",error: e.toString());
      return e.toString();
    }

  }

  Future<void> updateProfile(String vehicleNumber,vehicle,code,flag,old_password,BuildContext context) async {
    LoadingDialog.show();
    Map<String,dynamic> map = {
      "driver_id" : await sp.getStringValue(sp.USER_ID)??"",
      "first_name": fNameCtr.value,
      "last_name":lNameCtr.value ,
      "country_code":code,
      "contact":phoneCtr.value,
      "email":emailCtr.value,
      "password":passwordCtr.value,
      "old_password" : old_password,
      "flag": flag,
      "vehicle_id": vehicle,
      "vehicle_no": vehicleNumber,
      "image": profileImageString.value == null?"":await DIO.MultipartFile.fromFile(profileImageString.value!.path,filename: profileImageString.value!.path.split("/").last),
      "licence_image": licenceImageString.value == null?"":await DIO.MultipartFile.fromFile(licenceImageString.value!.path,filename: licenceImageString.value!.path.split("/").last),
      "insurance_image":insuranceImageString.value == null?"":await DIO.MultipartFile.fromFile(insuranceImageString.value!.path,filename: insuranceImageString.value!.path.split("/").last),
      "ownership_image":ownerImageString.value == null?"":await DIO.MultipartFile.fromFile(ownerImageString.value!.path,filename: ownerImageString.value!.path.split("/").last),
    };

    log("message=---${old_password}");
    try{

      final response =  await apiService.postData(Urls.updateProfile, map);

      var jsonString = jsonDecode(response.data);
      print("result ------${jsonString['result']}");
      if(jsonString['result'] == "Success"){
        LoadingDialog.hide();
        Future.delayed(Duration.zero, () {
          fetchProfile();
        });

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

  var faqList = [].obs;

  void fetchFaq()async{
    LoadingDialog.show();
    try{
      
      final response = await apiService.getData(Urls.driver_faq,);


      faqList.value = jsonDecode(response.data);
      LoadingDialog.hide();
    }catch(e){
      LoadingDialog.hide();
      log("Exception ----",error: e.toString());
    }
  }

  void writeSupport(String name,email,subject,message)async{
    LoadingDialog.show();
    Map<String,dynamic> map = {
    "driver_id": await sp.getStringValue(sp.USER_ID)??"",
    "name":name,
    "email":email,
    "subject":subject,
    "message":message,
    };

    try{

      final response = await apiService.postData(Urls.writeSupport, map);

      var jsonString = jsonDecode(response.data);

      if(jsonString['result'] == "successfully"){
        LoadingDialog.hide();
        Get.back();
        customSnackBar("Submitted");
      }else{
        LoadingDialog.hide();
        customSnackBar(jsonString['result'].toString());
      }

    }catch(e){
      LoadingDialog.hide();
      log("Exception ---",error: e.toString());
    }

  }

}