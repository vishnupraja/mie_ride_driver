import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/constant/text_strings.dart';
import 'package:mie_ride_driver/controllers/home_controller.dart';
import 'package:mie_ride_driver/controllers/profile_Controller.dart';
import 'package:mie_ride_driver/screens/home_screens/account_tab_screen.dart';
import 'package:mie_ride_driver/screens/home_screens/home_page.dart';
import 'package:mie_ride_driver/screens/wallet_screen/wallet_screen.dart';
import '../constant/colors.dart';
import '../constant/font_family.dart';
import '../constant/image_string/image_string.dart';
import '../constant/sizes.dart';
import '../myApp.dart';
import 'home_screens/booking_screen.dart';
import 'home_screens/notification_screen.dart';

class BottomNavigationBarWithCards extends StatefulWidget {
  @override
  _BottomNavigationBarWithCardsState createState() =>
      _BottomNavigationBarWithCardsState();
}

class _BottomNavigationBarWithCardsState
    extends State<BottomNavigationBarWithCards> {




  var loading = false;

  @override
  void initState() {
    super.initState();
    loading = true;
    Future.delayed(Duration.zero, () {
      Get.find<ProfileController>().fetchProfile().then((value){
        if (value == "successfully"){
          loading = false;
          setState(() {

          });
        }else{
          loading = false;
          setState(() {

          });
        }
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return loading == true?Container(color: TColors.background,):Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: TColors.background,
        body: HomePage(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          height: 80,
          width: 80,
          child: FloatingActionButton(child: Image.asset(
            LANDING_IMAGE,height: 40,width: 40,
            color: TColors.buttonPrimary,
          ), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => BookingScreen()));

          },shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: BorderSide(
                  color: TColors.buttonPrimary,
                  width: 3
              )
          ),

            backgroundColor: TColors.background,
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
                color: TColors.background,
                borderRadius: BorderRadius.circular(20),
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
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 3),
              child: Container(
                height: 75,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(

                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            /*controller.selectedIndex.value = 0;*/
                          },
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: TColors.background,
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: Colors.black.withOpacity(0.1), // Adjust border color and opacity
                                      width: 1,
                                    ),
                                    boxShadow:[ BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 5.0,
                                    ),]
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(homeImage,height: 23,width: 23,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(TTexts.Home,style: FontsFamily.ExtraBold.copyWith(
                                color: TColors.textPrimary,
                                fontSize: TSizes.fontSizeSm,
                              ) ,),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => WalletScreen()));

                            /* controller.selectedIndex.value = 1;*/
                          },
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: TColors.background,
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: Colors.black.withOpacity(0.1), // Adjust border color and opacity
                                      width: 1,
                                    ),
                                    boxShadow:[ BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 5.0,
                                    ),]
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(walletImage,height: 23,width: 23,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.0,),
                              Text(TTexts.wallet,style: FontsFamily.ExtraBold.copyWith(
                                color: TColors.textPrimary,
                                fontSize: TSizes.fontSizeSm,
                              ) ,),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(TTexts.booking,style: FontsFamily.ExtraBold.copyWith(
                              color: TColors.textPrimary,
                              fontSize: TSizes.fontSizeSm,
                            ) ,),
                          ),
                          SizedBox(),
                        ],
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){

                            Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
                            /* controller.selectedIndex.value = 3;*/
                          },
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: TColors.background,
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: Colors.black.withOpacity(0.1), // Adjust border color and opacity
                                      width: 1,
                                    ),
                                    boxShadow:[ BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 5.0,
                                    ),]
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.notifications_active ,
                                    color: /*controller.selectedIndex.value != 3?*/
                                    TColors.buttonPrimary/*:null*/,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.0,),
                              Text(TTexts.notification,style: FontsFamily.ExtraBold.copyWith(
                                color: TColors.textPrimary,
                                fontSize: TSizes.fontSizeSm,
                              ) ,),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AccountScreen()));
                            /* controller.selectedIndex.value = 4;*/
                          },
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                    color: TColors.background,
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: Colors.black.withOpacity(0.1), // Adjust border color and opacity
                                      width: 1,
                                    ),
                                    boxShadow:[ BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 5.0,
                                    ),]
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: 'assets/userload.gif',
                                    width: 35,
                                    height: 35,
                                    fit: BoxFit.cover,
                                    image: profileImage,
                                    imageErrorBuilder: (c, o, s) =>
                                        Image.asset(
                                          USER_IMAGE, height: 35,
                                          width: 35,
                                          fit: BoxFit.cover,
                                        ),
                                  )
                                ),
                              ),
                              SizedBox(height: 5.0,),
                              Text(TTexts.AccountText,style: FontsFamily.ExtraBold.copyWith(
                                color: TColors.textPrimary,
                                fontSize: TSizes.fontSizeSm,
                              ) ,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
}
