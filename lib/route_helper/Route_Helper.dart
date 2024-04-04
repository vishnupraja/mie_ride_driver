

import 'package:get/get.dart';
import 'package:mie_ride_driver/screens/account_screen/my_ride_screen.dart';
import 'package:mie_ride_driver/screens/auth_screens/landing_screen.dart';
import 'package:mie_ride_driver/screens/auth_screens/login_page.dart';
import 'package:mie_ride_driver/screens/auth_screens/signup_screen.dart';
import 'package:mie_ride_driver/screens/auth_screens/signup_screen2.dart';
import 'package:mie_ride_driver/screens/auth_screens/splash_screen.dart';
import 'package:mie_ride_driver/screens/bottom_screen.dart';
import 'package:mie_ride_driver/screens/share_route_screen.dart';

class RouteHelper {

  static String initial = "/";
  static String splash = "/splash";
  static String landing = "/landing";
  static String signup  = "/signup";
  static String signup2 = "/signup2";
  static String login = "/login";
  static String bottomNavigation = "/bottomNavigation";
  static String myRide = "/myRide";
  static String shareRoute = "/shareRoute";



  static String getInitialRoute() => initial;
  static String getSplashRoute() => splash;
  static String getLandingPage() => landing;
  static String getSignupPage() => signup;
  static String getSignupPage2() => signup2;
  static String getLoginPage() => login;
  static String getBottomPage() => bottomNavigation;
  static String getMyRidePage() => myRide;
  static String getShareRoutePage() => shareRoute;

  static List<GetPage> route = [
    
    GetPage(name: splash, page: ()  => SplashScreen()),
    GetPage(name: landing, page: () => LandingPage()),
    GetPage(name: signup, page: ()  => SignupScreen() ),
    GetPage(name: signup2, page: () => SignupScreen2()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: bottomNavigation, page: () => BottomNavigationBarWithCards()),
    GetPage(name: myRide, page: () => MyRideScreen()),
    GetPage(name: shareRoute, page: () => ShareRouteScreen()),
  ];






}