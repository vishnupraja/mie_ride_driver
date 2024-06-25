import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart'as DIO;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/services/api_service.dart';
import 'package:mie_ride_driver/services/urls.dart';
import 'package:mie_ride_driver/utils/static.dart';

import '../screens/loader.dart';

class WalletController extends GetxController{

  var historyList = [].obs;
  var balance = "".obs;

  var formImageString   = Rxn<File>();

  var emailCtr  = "".obs;
  var bName  = "".obs;
  var tNumber  = "".obs;
  var iNumber  = "".obs;
  var account  = "".obs;
  var type  = "".obs;
  var depositForm = "".obs;


  MySharedPreferences sp = MySharedPreferences();
  ApiService apiService = ApiService();

  void walletFetch()async{
    LoadingDialog.show();
    Map<String, dynamic> fetch = {
      "driver_id" : await sp.getStringValue(sp.USER_ID)??""
    };

    log("message -------${fetch}");

    try{

      final response = await apiService.postData(Urls.walletFetch, fetch);

      var jsonString = jsonDecode(response.data);

      print(response.data);

      if(jsonString['result'] == "success"){
        LoadingDialog.hide();
        balance.value = jsonString['driver_wallet'];
      }else{
        LoadingDialog.hide();
        customSnackBar("Something went wrong");
      }

    }catch(e){
      LoadingDialog.hide();
      log("Exception ---",error: e.toString());
    }
  }

  void addAccountDetails(String type,bank_name,transit_number,institution_number,account,email_address,VoidCallback callback)async{
    LoadingDialog.show();
    Map<String,dynamic> map = {
      "driver_id" : await sp.getStringValue(sp.USER_ID)??"",
      "type"  : type,
      "bank_name": bank_name,
      "transit_number" : transit_number,
      "institution_number" :  institution_number,
      "account"  : account,
      "diposite_image" :formImageString.value!.path == null?"": await DIO.MultipartFile.fromFile(formImageString.value!.path,filename: formImageString.value!.path.split("/").last),
      "email_address" : email_address,
    };

    log("parameter ----$map");

    try{

      final response = await apiService.postData(Urls.driver_add_account_details, map);

      var data = jsonDecode(response.data);

      if(data['result'] == "Success"){
        LoadingDialog.hide();
        callback();
        customSnackBar("Bank details added successfully");
      }else{
        LoadingDialog.hide();
        customSnackBar('something went wrong');
      }

    }catch(e){
      LoadingDialog.hide();
      log("Exception ----",error: e.toString());
    }
  }

  void fetchBankDetails(VoidCallback callback)async{
    LoadingDialog.show();
    Map<String, dynamic> fetch = {
      "driver_id" : await sp.getStringValue(sp.USER_ID)??""
    };

    log("message -------${fetch}");

    try{

      final response = await apiService.postData(Urls.driver_fetch_account_details, fetch);

      var jsonString = jsonDecode(response.data);

      print(response.data);

      if(jsonString['id'] != ""){
        LoadingDialog.hide();
        emailCtr.value = jsonString['email_address'];
        bName.value = jsonString['bank_name'];
        tNumber.value = jsonString['transit_number'];
        iNumber.value = jsonString['institution_number'];
        account.value = jsonString['account'];
        type.value = jsonString['type'];
        depositForm.value = jsonString['diposite_image'];
        callback();
      }else{
        LoadingDialog.hide();
        customSnackBar(jsonString['message'].toString());
      }

    }catch(e){

    }
  }

  void historyFetch()async{
    LoadingDialog.show();
    Map<String,dynamic> map = {
      "driver_id" : await sp.getStringValue(sp.USER_ID),
    };
    try{

      final response = await apiService.postData(Urls.driver_fetch_transaction_history, map);

      log("response ----"+response.data);

      historyList.value = jsonDecode(response.data);

      LoadingDialog.hide();

    }catch(e){
      LoadingDialog.hide();
      log("Exception ---",error: e.toString());
    }
  }

}