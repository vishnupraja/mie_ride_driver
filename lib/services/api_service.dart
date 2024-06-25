import 'package:dio/dio.dart' as DIO;
import 'package:get/get.dart';
import 'package:mie_ride_driver/services/urls.dart';


class ApiService extends GetxService{

 DIO.Dio dioClient = DIO.Dio();

 final int timeoutInSecond = 30;

 final DIO.LogInterceptor logInterceptor = DIO.LogInterceptor();

 Future<DIO.Response> postData(String url, Map<String,dynamic>body)async{
   DIO.FormData formData = DIO.FormData.fromMap(body);
   return await dioClient.post(Urls.baseUrl + url,data: formData).timeout(Duration(seconds: timeoutInSecond));
 }
 Future<DIO.Response> postLink(String url, Map<String,dynamic>body)async{
   DIO.FormData formData = DIO.FormData.fromMap(body);
   return await dioClient.post(url,data: formData).timeout(Duration(seconds: timeoutInSecond));
 }
 Future<DIO.Response> getData(String url,)async{
   return await dioClient.get(Urls.baseUrl +url).timeout(Duration(seconds: timeoutInSecond));
 }

 Future<DIO.Response> multiPartFile(String url,DIO.FormData formData)async{
   return await dioClient.post(Urls.baseUrl + url,data: formData);
 }


}