import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/constant/font_family.dart';
import 'package:mie_ride_driver/constant/sizes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant/colors.dart';

Widget customAppbar(String text){
   return Row(
     mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: (){
            Get.back();
          },
          child: Card(
            color: TColors.background,
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
        SizedBox(width: Get.width/6,),
        Align(
          alignment: Alignment.center,
          child: Text(text,
            textAlign: TextAlign.center,
            style: FontsFamily.ExtraBold.copyWith(
                color: TColors.textPrimary,
                fontSize: 25,
            ),
          ),
        ),
      ],
    );
    }

Widget customContainer(String text,String image,VoidCallback callback){
  return InkWell(
    onTap: (){
     callback();
    },
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 12),
      padding: EdgeInsets.symmetric(horizontal: 12),
      height: 50,
      decoration: TWidget.bShadow,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text,
              style: FontsFamily.ExtraBold.copyWith(
                  color: TColors.textPrimary,
                  fontSize: TSizes.fontSizeMd,
                  letterSpacing: 1
              ),
            ),
            Image.asset(image,height: TSizes.iconMd,width: TSizes.iconMd,)
          ],
        ),
      ),
    ),
  );
}


class CustomField extends StatelessWidget {
  String hintText;
  Widget? icon;
  double size;
  final bool ishide;
  TextInputType? textInputType;
  TextEditingController? textEditingController;

   CustomField({super.key,
     this.hintText = "",
     this.icon,
     this.textInputType,
     this.textEditingController,
     this.ishide = false,
     this.size = 15.0
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
        decoration: TWidget.bBoxDecoration,
        child: Center(
          child: TextFormField(
            style: FontsFamily.ExtraBold.copyWith(
                color: TColors.textPrimary,
                fontSize: TSizes.fontSizeMd
            ),
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
                    color: TColors.textSecondary, fontSize: size
                ),)
          ),
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
    child: Container(
      decoration: TWidget.bBoxDecoration,
      child: Container(
        width: Get.width/1.8,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text,
                style: FontsFamily.ExtraBold.copyWith(
                  fontSize: 15,
                  color: TColors.textPrimary
                ),
                ),
              image == ""?SizedBox(): Image.asset(image,height: 25,width: 25,)
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

class TWidget{

  static final   boxShadow=[ BoxShadow(
    color: Colors.black.withOpacity(0.3),
    blurRadius: 10.0,
  ),];
// border side

  static final borderSide=BorderSide(
    color: Colors.white.withOpacity(0.1), // Adjust border color and opacity
    width: 10, // Adjust border width
  );

  static final borderRadiusOnly=BorderRadius.only(
      bottomLeft: Radius.circular(TSizes.borderRadiusLg),
      bottomRight: Radius.circular(TSizes.borderRadiusLg),
      topRight: Radius.circular(TSizes.borderRadiusLg),
      topLeft: Radius.circular(TSizes.borderRadiusLg),

  );

  static final borderRadius=Radius.circular(TSizes.borderRadiusLg);


  static final boxDecoration=BoxDecoration(
      color: TColors.background,
      borderRadius: TWidget.borderRadiusOnly,
      border: Border(
          bottom: TWidget.borderSide,
          left: TWidget.borderSide,
          right: TWidget.borderSide,
          top: TWidget.borderSide
      ),
      boxShadow: [ BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 10), // Upper shadow
      ),
    BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: -5,
      blurRadius: 7,
      offset: Offset(0, -10), // Lower shadow
    ),
    ],
  );


  static final bBoxDecoration=BoxDecoration(
      color: TColors.background,
      borderRadius: BorderRadius.circular(12),
      border: Border(
          top: BorderSide(
            color: Colors.black.withOpacity(0.1), // Adjust border color and opacity
            width: 1, // Adjust border width
          ),
          bottom: BorderSide(
            color: Colors.black.withOpacity(0.1), // Adjust border color and opacity
            width: 1, // Adjust border width
          ),
          left: BorderSide(
            color: Colors.black.withOpacity(0.1), // Adjust border color and opacity
            width: 1, // Adjust border width
          ),
          right: BorderSide(
            color: Colors.black.withOpacity(0.1), // Adjust border color and opacity
            width: 1, // Adjust border width
          )
      ),
      boxShadow:[ BoxShadow(
        color: Colors.black.withOpacity(0.3),
        blurRadius: 5.0,
      ),]
  );

  static final bShadow = BoxDecoration(
      color: TColors.background,
      borderRadius: BorderRadius.circular(15),
      border: Border(
          top: BorderSide(
            color: Colors.black.withOpacity(0.1), // Adjust border color and opacity
            width: 1, // Adjust border width
          ),
          bottom: BorderSide(
            color: Colors.black.withOpacity(0.1), // Adjust border color and opacity
            width: 1, // Adjust border width
          ),
          left: BorderSide(
            color: Colors.black.withOpacity(0.1), // Adjust border color and opacity
            width: 1, // Adjust border width
          ),
          right: BorderSide(
            color: Colors.black.withOpacity(0.1), // Adjust border color and opacity
            width: 1, // Adjust border width
          )
      ),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // Upper shadow
      ),
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: -5,
        blurRadius: 7,
        offset: Offset(0, -3), // Lower shadow
      ),
    ],
  );




}

class CountryEntity {
  final String name;
  final String code;

  CountryEntity(this.name, this.code);
}