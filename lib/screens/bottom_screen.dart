import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/constant/text_strings.dart';
import 'package:mie_ride_driver/controllers/home_controller.dart';
import 'package:mie_ride_driver/screens/home_screens/account_tab_screen.dart';
import 'package:mie_ride_driver/screens/home_screens/home_page.dart';
import 'package:mie_ride_driver/screens/home_screens/wallet_screen.dart';
import 'package:mie_ride_driver/utils/static.dart';
import '../constant/colors.dart';
import '../constant/font_family.dart';
import '../constant/image_string/image_string.dart';
import '../constant/sizes.dart';
import 'home_screens/booking_screen.dart';
import 'home_screens/notification_screen.dart';

class BottomNavigationBarWithCards extends StatefulWidget {
  @override
  _BottomNavigationBarWithCardsState createState() =>
      _BottomNavigationBarWithCardsState();
}

class _BottomNavigationBarWithCardsState
    extends State<BottomNavigationBarWithCards> {


  final List<Widget> _pages = [
    HomePage(),
    WalletScreen(),
    BookingScreen(),
    NotificationScreen(),
    AccountScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Obx(() {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: TColors.background,
          body: _pages[controller.selectedIndex.value],
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
            height: 80,
            width: 80,
            child: FloatingActionButton(child: Image.asset(
              LANDING_IMAGE,height: 40,width: 40,
              color: controller.selectedIndex.value != 2?TColors.buttonPrimary:null,
            ), onPressed: () {
              controller.selectedIndex.value = 2;
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
                          child: InkWell(
                            onTap: (){
                              controller.selectedIndex.value = 0;
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: TWidget.bBoxDecoration,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.home_filled,
                                      color: controller.selectedIndex.value != 0?
                                      TColors.buttonPrimary:null,
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
                          child: InkWell(
                            onTap: (){
                              controller.selectedIndex.value = 1;
                            },
                            child: Column(
                              children: [
                                Container(
                                 decoration: TWidget.bBoxDecoration,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.wallet,
                                      color: controller.selectedIndex.value != 1?
                                      TColors.buttonPrimary:null,
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
                          child: InkWell(
                            onTap: (){
                              controller.selectedIndex.value = 3;
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: TWidget.bBoxDecoration,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.notifications_active ,
                                      color: controller.selectedIndex.value != 3?
                                      TColors.buttonPrimary:null,
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
                          child: InkWell(
                            onTap: (){
                              controller.selectedIndex.value = 4;
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: TWidget.bBoxDecoration,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Image.asset(USER_IMAGE,
                                        fit: BoxFit.cover,
                                        height: 25,
                                        width: 25,
                                      ),
                                    ),
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
    });
  }
}
