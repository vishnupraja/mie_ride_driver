

import 'package:get/get.dart';
import 'package:mie_ride_driver/screens/accept_ride.dart';
import 'package:mie_ride_driver/screens/account_screen/deal_zone_screen.dart';
import 'package:mie_ride_driver/screens/account_screen/my_ride_screen.dart';
import 'package:mie_ride_driver/screens/auth_screens/landing_screen.dart';
import 'package:mie_ride_driver/screens/auth_screens/login_page.dart';
import 'package:mie_ride_driver/screens/auth_screens/signup_screen.dart';
import 'package:mie_ride_driver/screens/auth_screens/signup_screen2.dart';
import 'package:mie_ride_driver/screens/auth_screens/splash_screen.dart';
import 'package:mie_ride_driver/screens/bottom_screen.dart';
import 'package:mie_ride_driver/screens/account_screen/profile_screen.dart';
import 'package:mie_ride_driver/screens/rating_screen.dart';
import 'package:mie_ride_driver/screens/share_route_screen.dart';
import 'package:mie_ride_driver/screens/support_Screens/faq_screen.dart';
import 'package:mie_ride_driver/screens/support_Screens/privacy_policy.dart';
import 'package:mie_ride_driver/screens/support_Screens/term_condition.dart';
import 'package:mie_ride_driver/screens/wallet_screen/account_detail_screen.dart';
import 'package:mie_ride_driver/screens/wallet_screen/history_screen.dart';

import '../screens/account_screen/news_feed.dart';
import '../screens/account_screen/spread_the_word.dart';
import '../screens/account_screen/support_chat.dart';
import '../screens/account_screen/support_service_screen.dart';
import '../screens/message_screen.dart';
import '../screens/ongoing_ride.dart';
import '../screens/share_availability_screen.dart';
import '../screens/support_Screens/contact_form.dart';

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
  static String shareAvailability = "/shareAvailability";
  static String accountDetail = "/accountDetail";
  static String history = "/history";
  static String profile = "/profile";
  static String spreadWordScreen = "/SpreadWordScreen";
  static String dealZone = "/dealZone";
  static String newsFeed = "/newsFeed";
  static String supportService = "/supportService";
  static String contactForm = "/contactForm";
  static String term = "/term";
  static String privacy = "/privacy";
  static String faq = "/faq";
  static String supportChat = "/supportChat";
  static String messageScreen = "/messageScreen";
  static String ongoingRide = "/ongoingRide";
  static String acceptRide = "/acceptRide";
  static String rating = "/rating";



  static String getInitialRoute() => initial;
  static String getSplashRoute() => splash;
  static String getLandingPage() => landing;
  static String getSignupPage() => signup;
  static String getSignupPage2() => signup2;
  static String getLoginPage() => login;
  static String getBottomPage() => bottomNavigation;
  static String getMyRidePage() => myRide;
  static String getShareRoutePage() => shareRoute;
  static String getShareAvailabilityPage() => shareAvailability;
  static String getAccountDetailPage() => accountDetail;
  static String getHistoryPage() => history;
  static String getProfilePage() => profile;
  static String getSpreadWordScreenPage() => spreadWordScreen;
  static String getDealZonePage() => dealZone;
  static String getNewsFeedPage() => newsFeed;
  static String getSupportServicePage() => supportService;
  static String getContactFormPage() => contactForm;
  static String getTermConditionPage() => term;
  static String getPrivacyPolicyPage() => privacy;
  static String getFAQPage() => faq;
  static String getSupportChatPage() => supportChat;
  static String getMessageScreenPage() => messageScreen;
  static String getOngoingRidePage() => ongoingRide;
  static String getAcceptRidePage() =>  acceptRide;
  static String getRatingPage() =>  rating;

  static List<GetPage> route = [
    
    GetPage(name: splash, page: ()  => SplashScreen()),
    GetPage(name: landing, page: () => LandingPage()),
    GetPage(name: signup, page: ()  => SignupScreen() ),
    GetPage(name: signup2, page: () => SignupScreen2()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: bottomNavigation, page: () => BottomNavigationBarWithCards()),
    GetPage(name: myRide, page: () => MyRideScreen()),
    GetPage(name: shareRoute, page: () => ShareRouteScreen()),
    GetPage(name: shareAvailability, page: () => ShareAvailability()),
    GetPage(name: accountDetail, page: () => AccountDetail()),
    GetPage(name: history, page: () => History()),
    GetPage(name: profile, page: () => ProfileScreen()),
    GetPage(name: spreadWordScreen, page: () => SpreadWordScreen()),
    GetPage(name: dealZone, page: () => DealZone()),
    GetPage(name: newsFeed, page: () => NewsFeed()),
    GetPage(name: supportService, page: () => SupportService()),
    GetPage(name: contactForm, page: () => ContactForm()),
    GetPage(name: term, page: () => TermCondition()),
    GetPage(name: privacy, page: () => PrivacyPolicy()),
    GetPage(name: faq, page: () => FAQ()),
    GetPage(name: supportChat, page: () => SupportChat()),
    GetPage(name: messageScreen, page: () => MessageScreen()),
    GetPage(name: ongoingRide, page: () => OngoingRide()),
    GetPage(name: acceptRide, page: () => AcceptRide()),
    GetPage(name: rating, page: () => RatingScreen()),
  ];






}