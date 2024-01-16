import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:winedine/controllers/popular_product_controller.dart';
import 'package:winedine/routes/route_helper.dart';
import 'package:winedine/widgets/app_icon.dart';
import 'package:winedine/widgets/bigtext.dart';
import 'package:winedine/widgets/icon_and_text_widget.dart';
import 'package:winedine/widgets/smalltext.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final index = Get.arguments['index'];
    final q = Get.arguments['quantity'];

    return Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 60,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getPopularFood(),
                          arguments: {'index': index});
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios,
                      iconColor: Colors.white,
                      backgroundColor: Colors.blue,
                      size: 35,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(
                        RouteHelper.getMainFoodPage(),
                      );
                    },
                    child: AppIcon(
                      icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: Colors.blue,
                      size: 35,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart,
                    iconColor: Colors.white,
                    backgroundColor: Colors.blue,
                    size: 35,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 130),
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Row(
                  children: [
                    //image section
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white30,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/image/food$index.jpg"),
                        ),
                      ),
                    ),
                    //text container
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(
                                text: _giveName(index),
                                color: Colors.black,
                              ),
                              SmallText(
                                text: " Close To You ",
                                color: Colors.black45,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  IconAndTextWidget(
                                      icon: Icons.circle,
                                      text: "Spice Rate",
                                      color: Colors.black87,
                                      iconColor: Colors.yellow,
                                      index: 1),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  IconAndTextWidget(
                                    icon: Icons.location_on,
                                    text: "1.7 km",
                                    color: Colors.black87,
                                    iconColor: Colors.green,
                                    index: 69,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  IconAndTextWidget(
                                      index: 69,
                                      icon: Icons.access_time_rounded,
                                      text: "32 min",
                                      color: Colors.black87,
                                      iconColor: Colors.blue),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 300),
              child: Column(
                children: [
                  BigText(
                    text:
                        "You have Ordered $q Portions of ${_giveName(index)} ",
                    color: Colors.black87,
                    size: 18,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(children: [
                    IconAndTextWidget(
                        icon: Icons.attach_money,
                        text: "Total Amount",
                        color: Colors.black87,
                        iconColor: Colors.blueAccent,
                        index: 3),
                    SizedBox(
                      width: 10,
                    ),
                    SmallText(
                      text: "${(200 * q).toString()}",
                      color: Colors.black54,
                      size: 20,
                    ),
                  ]),
                  SizedBox(
                    height: 30,
                  ),
                  Row(children: [
                    IconAndTextWidget(
                        icon: Icons.shopping_bag_sharp,
                        text: "Portions Added",
                        color: Colors.black87,
                        iconColor: Colors.blueAccent,
                        index: 3),
                    SizedBox(
                      width: 5,
                    ),
                    SmallText(
                      text: "${q.toString()}",
                      color: Colors.black54,
                      size: 20,
                    ),
                  ]),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (popularProduct) {
            return Container(
                height: 120,
                padding:
                    EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Container(
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, right: 10, left: 10),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getLocationPage());
                    },
                    child: Center(
                      child: BigText(
                        text: "Proceed to Checkout",
                        color: Colors.white,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                ));
          },
        ));
  }

  String _giveName(int index) {
    String name;
    {
      if (index == 0) {
        return name = " Bakhshish Fries";
      } else if (index == 1) {
        return name = "Dozakhi Biryani ";
      } else if (index == 2) {
        return name = "Chinioti Burger";
      } else if (index == 3) {
        return name = "Naram Tacos";
      } else if (index == 4) {
        return name = "Heera Chargha";
      }
    }
    {
      if (index == 6) {
        return name = " Nalli Nehari";
      } else if (index == 7) {
        return name = "Daal Makhni ";
      } else if (index == 8) {
        return name = "Honolulu Wings";
      } else if (index == 9) {
        return name = "Nasli Butt Karahi";
      } else if (index == 10) {
        return name = "Sadiq Poori Halwa";
      } else if (index == 11) {
        return name = "Pakore";
      }
    }
    return name = "just get a life";
  }
}
