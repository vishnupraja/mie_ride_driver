

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionController extends GetxController{



  Future<void> permissionHandle()async{
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.storage,
      Permission.notification,
      Permission.camera,
      Permission.photos,
      //add more permission to request here.
    ].request();

    if(statuses[Permission.location]!.isDenied){ //check each permission status after.
      print("Location permission is denied.");
    }
    if(statuses[Permission.storage]!.isDenied){
      await Permission.storage.request();//check each permission status after.
      print("storage permission is denied.");
    }
    if(statuses[Permission.notification]!.isDenied){ //check each permission status after.
      print("Notification permission is denied.");
    }
  }


  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar('', "Location services are disabled. Please enable the services",);
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied){
        Get.snackbar('', "Location permissions are denied");
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar('', "Location permissions are permanently denied, we cannot request permissions.");
      return false;
    }
    return true;
  }


}