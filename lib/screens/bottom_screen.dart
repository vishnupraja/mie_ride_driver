import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride_driver/controllers/home_controller.dart';
import '../constant/colors.dart';
import '../constant/font_family.dart';
import '../constant/sizes.dart';

class BottomNavigationBarWithCards extends StatefulWidget {
  @override
  _BottomNavigationBarWithCardsState createState() =>
      _BottomNavigationBarWithCardsState();
}

class _BottomNavigationBarWithCardsState
    extends State<BottomNavigationBarWithCards> {


  final List<Widget> _pages = [
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];


  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Obx(() {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: _pages[controller.selectedIndex.value],
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(child: Icon(Icons.home), onPressed: () {
            controller.selectedIndex.value = 2;
          },shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
            backgroundColor: TColors.loginButton,
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              elevation: 15,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                      color: Colors.black.withOpacity(0.1)
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                child: Container(
                  height: 75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          controller.selectedIndex.value = 0;
                        },
                        child: Column(
                          children: [
                            Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.home_filled,
                                  color: controller.selectedIndex.value != 0?
                                  TColors.buttonPrimary:null,
                                ),
                              ),
                            ),
                            Text("Home",style: FontsFamily.ExtraBold.copyWith(
                              color: TColors.textPrimary,
                              fontSize: TSizes.fontSizeSm,
                            ) ,),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          controller.selectedIndex.value = 1;
                        },
                        child: Column(
                          children: [
                            Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.wallet,
                                  color: controller.selectedIndex.value != 1?
                                  TColors.buttonPrimary:null,
                                ),
                              ),
                            ),
                            Text("Wallet",style: FontsFamily.ExtraBold.copyWith(
                              color: TColors.textPrimary,
                              fontSize: TSizes.fontSizeSm,
                            ) ,),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10,left: 2),
                            child: Text("My Booking"),
                          ),
                          SizedBox(),
                        ],
                      ),
                      InkWell(
                        onTap: (){
                          controller.selectedIndex.value = 3;
                        },
                        child: Column(
                          children: [
                            Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.notifications_active ,
                                  color: controller.selectedIndex.value != 3?
                                  TColors.buttonPrimary:null,
                                ),
                              ),
                            ),
                            Text("Notification",style: FontsFamily.ExtraBold.copyWith(
                              color: TColors.textPrimary,
                              fontSize: TSizes.fontSizeSm,
                            ) ,),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          controller.selectedIndex.value = 4;
                        },
                        child: Column(
                          children: [
                            Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.light_mode_sharp,
                                  color: controller.selectedIndex.value != 4?
                                  TColors.buttonPrimary:null,
                                ),
                              ),
                            ),
                            Text("Account",style: FontsFamily.ExtraBold.copyWith(
                              color: TColors.textPrimary,
                              fontSize: TSizes.fontSizeSm,
                            ) ,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
      );
    });
  }
}
