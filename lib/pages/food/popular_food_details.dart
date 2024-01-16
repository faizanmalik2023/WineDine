import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:winedine/controllers/popular_product_controller.dart';
import 'package:winedine/pages/home/main_food_page.dart';
import 'package:winedine/routes/route_helper.dart';
import 'package:winedine/widgets/app_column.dart';
import 'package:winedine/widgets/app_icon.dart';
import 'package:winedine/widgets/bigtext.dart';
import 'package:winedine/widgets/expandable_text_widget.dart';
import 'package:winedine/widgets/icon_and_text_widget.dart';
import 'package:winedine/widgets/smalltext.dart';

class PopularFoodDetail extends StatelessWidget {
  // int pageId;
  //final int? index;
  PopularFoodDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var count = 0;
    var q = 0;
    final index = Get.arguments['index'];
    return Scaffold(
      body: Stack(
        children: [
          //background image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/image/food$index.jpg"))),
              )),
          //icon widgets
          Positioned(
              top: 45,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: AppIcon(icon: Icons.arrow_back_ios),
                    onTap: () {
                      Get.toNamed(RouteHelper.getMainFoodPage());
                    },
                  ),
                  AppIcon(icon: Icons.shopping_cart_outlined),
                ],
              )),
          //intro of food
          Positioned(
            left: 0,
            right: 0,
            top: 310,
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(
                    text: _giveName(index),
                    index: 1,
                    rate: 5,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BigText(
                    text: "Introduction",
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SingleChildScrollView(
                    child: ExpandableTextWidget(
                      text:
                          "We bring you the international crush of all the foodies throughout the world. A perfectly cooked nalli biryani from your very Own Biryani King. Served with Mint Raita and Thandi Thaa Coca, Order now for only 220 Rs to fill your own belly or the bellies of your loved ones. Happy Eating!",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (popularProduct) {
          return Container(
            height: 120,
            padding: EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, right: 10, left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(false);
                        },
                        child: Icon(
                          Icons.remove,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      BigText(
                        text: "${q = popularProduct.quantity}",
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(true);
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, right: 10, left: 10),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getCartPage(),
                          arguments: {'index': index, 'quantity': q});
                    },
                    child: BigText(
                      text: "200 Rs| Add to Cart",
                      color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  String increment(int count) {
    count = count - 1;
    print(count);
    return count.toString();
  }

  String _giveName(int index) {
    String name;
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
    return name = "";
  }
}
