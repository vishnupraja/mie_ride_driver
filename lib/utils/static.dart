import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/constant/font_family.dart';
import 'package:mie_ride_driver/constant/sizes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant/colors.dart';

Widget customAppbar(String text){
   return Row(
      children: [
        InkWell(
          onTap: (){
            Get.back();
          },
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 2),
                  child: Icon(Icons.arrow_back_ios,color: TColors.textPrimary,size: 20,),
                )
              ),
            ),
          ),
        ),
        SizedBox(width: Get.width/4.4,),
        Text(text,
          style: FontsFamily.ExtraBold.copyWith(
              color: TColors.textPrimary,
              fontSize: 20
          ),
        ),
      ],
    );
    }


class CustomField extends StatelessWidget {
  String hintText;
  Widget? icon;
  final bool ishide;
  TextInputType? textInputType;
  TextEditingController? textEditingController;

   CustomField({super.key,
     this.hintText = "",
     this.icon,
     this.textInputType,
     this.textEditingController,
     this.ishide = false,
   });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        height: 50,
        width: context.width,
        padding: const EdgeInsets.only(left: 10),
        margin: const EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10,
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 10,
                spreadRadius: 8,
                color: Color.fromRGBO(0, 0, 0, 0.16),
              )],
          color: TColors.background
        ),
        child: TextFormField(
          controller: textEditingController,
          obscureText: ishide,
          keyboardType: textInputType,
          decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: hintText,
              suffixIcon: icon,
              hintStyle: FontsFamily.ExtraBold.copyWith(
                  color: TColors.textSecondary, fontSize: TSizes.fontSizeSm
              ),)
        ),
      ),
    );
  }
}

Widget CustomButton(String text,String image ,VoidCallback callback){
  return InkWell(
    onTap: (){
      callback();
    },
    child: Card(
      elevation: 3,
      child: Container(
        width: Get.width/2,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text,
                style: FontsFamily.ExtraBold.copyWith(
                  fontSize: 15,
                  color: TColors.textPrimary
                ),
                ),
               Image.asset(image,height: 20,width: 20,)
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class MySharedPreferences{


  void setStringValue(String key,String value)async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key, value);
  }

  Future<String?> getStringValue(String value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(value);
  }

  void setBoolValue(String key, bool value)async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool(key, value);
  }

  Future<bool?> getBoolValue(String key) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getBool(key);
  }

void clearData()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
  await sp.clear();
}

}
