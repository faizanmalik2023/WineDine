import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:winedine/controllers/popular_product_controller.dart';
import 'package:winedine/routes/route_helper.dart';
import 'package:winedine/widgets/app_icon.dart';
import 'package:winedine/widgets/bigtext.dart';
import 'package:winedine/widgets/smalltext.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var q = 0;
    final index = Get.arguments['index'];
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: AppIcon(
                    icon: Icons.clear,
                    iconColor: Colors.black,
                  ),
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                ),
                GestureDetector(
                  onTap: () {
                    // Get.toNamed(RouteHelper.getCartPage(),
                    //     arguments: {'index': index, 'quantity': q});
                  },
                  child: AppIcon(
                    icon: Icons.shopping_cart_checkout_outlined,
                    iconColor: Colors.black,
                  ),
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(
                  child: BigText(
                    text: giveName2(index),
                    size: 30,
                  ),
                ),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
              ),
            ),
            pinned: true,
            backgroundColor: Colors.yellow,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/food$index.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SmallText(
              text:
                  "We bring you the international crush of all the foodies throughout the world. A perfectly cooked nalli biryani from your very Own Biryani King. Served with Mint Raita and Thandi Thaa Coca, Order now for only 220 Rs to fill your own belly or the bellies of your loved ones. Happy Eating!",
              size: 20,
              color: Colors.black87,
            ),
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (popularProduct) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding:
                    EdgeInsets.only(left: 45, right: 45, top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        popularProduct.setQuantity(false);
                      },
                      child: AppIcon(
                        icon: Icons.remove,
                        iconColor: Colors.white,
                        size: 40,
                        backgroundColor: Colors.blue,
                      ),
                    ),
                    BigText(
                      text: " 220 RS " +
                          " X " +
                          " ${q = popularProduct.quantity}",
                      size: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        popularProduct.setQuantity(true);
                      },
                      child: AppIcon(
                        icon: Icons.add,
                        backgroundColor: Colors.blue,
                        iconColor: Colors.white,
                        size: 40,
                      ),
                    )
                  ],
                ),
              ),
              Container(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 20, right: 10, left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.blue,
                        size: 30,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 20, right: 10, left: 10),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.getCartPage(),
                              arguments: {'index': index, 'quantity': q});
                        },
                        child: BigText(
                          text: "220 Rs| Add to Cart",
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
              ),
            ],
          );
        },
      ),
    );
  }

  String giveName2(index) {
    String name;

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
    return name = "just get a life";
  }
}
