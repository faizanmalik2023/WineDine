import 'package:get/get.dart';
import 'package:winedine/pages/auth/sign_in_page.dart';
import 'package:winedine/pages/auth/sign_up_page.dart';
import 'package:winedine/pages/cart/cart_page.dart';
import 'package:winedine/pages/food/popular_food_details.dart';
import 'package:winedine/pages/food/recommended_food_details.dart';
import 'package:winedine/pages/home/home_page.dart';
import 'package:winedine/pages/search/search_page.dart';

import 'package:winedine/pages/home/main_food_page.dart';
import 'package:winedine/pages/location/location_page/location_page.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String mainPage = "/main-food-page";
  static const String cartPage = "/cart-page";
  static const String signinPage = "/signin-page";
  static const String signupPage = "/signup-page";
  static const String locationPage = "/location-page";
  static const String searchPage = "/search-page";

  static String getInitial() => '$initial';
  static String getPopularFood() => '$popularFood';
  static String getRecommendedFood() => '$recommendedFood';
  static String getMainFoodPage() => '$mainPage';
  static String getCartPage() => '$cartPage';
  static String getSignInPage() => '$signinPage';
  static String getSignUpPage() => '$signupPage';
  static String getLocationPage() => '$locationPage';
  static String getSearchPage() => '$searchPage';

  static List<GetPage> routes = [
    GetPage(name: "/", page: () => HomePage()),
    GetPage(
        name: popularFood,
        page: () {
          //int pageId = Get.parameters['pageId'];

          return PopularFoodDetail();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          return RecommendedFoodDetail();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: mainPage,
        page: () {
          return HomePage();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartPage,
        page: () {
          return CartPage();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: signinPage,
        page: () {
          return SignInPage();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: signupPage,
        page: () {
          return SignUpPage();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: locationPage,
        page: () {
          return LocationPage();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: searchPage,
        page: () {
          return SearchPage();
        },
        transition: Transition.fadeIn),
  ];
}
