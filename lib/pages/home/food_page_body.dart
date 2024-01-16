import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:winedine/pages/food/popular_food_details.dart';
import 'package:winedine/routes/route_helper.dart';
import 'package:winedine/widgets/app_column.dart';
import 'package:winedine/widgets/bigtext.dart';
import 'package:winedine/widgets/icon_and_text_widget.dart';
import 'package:winedine/widgets/smalltext.dart';
import 'dart:math';

Random _random = Random();

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPagevalue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 220;

  int get index2 => index2;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPagevalue = pageController.page!;
      });
    });
  }

  // @override
  // void dispose() {
  //   pageController.dispose();
  // }

  Widget build(BuildContext context) {
    var index;
    var index3;
    return Column(
      children: [
        //slider section
        Container(
          height: 320,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                index = position;
                print(position);
                index3 = index + 5;
                return _buildPageItem(position, index);
              }),
        ),
        //dots
        new DotsIndicator(
          dotsCount: 5,
          position: _currPagevalue.toInt(),
          decorator: DotsDecorator(
              activeColor: Colors.blue,
              size: const Size.square(9.0),
              activeSize: const Size(10.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
        ),
        //popular text
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: BigText(
                  text: "Recommended Foods in Lahore ",
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        //list of food and images
        Container(
          height: 700,
          child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 8,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getRecommendedFood(),
                        arguments: {'index': index});
                  },
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
                              image: AssetImage(
                                  "assets/image/food${index + 6 < 11 ? index += 6 : index = 0}.jpg"),
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
                                    text: _giveName2(index),
                                    color: Colors.black,
                                  ),
                                  SmallText(
                                    text: "With Economical Pricing ",
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
                                          index: index),
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
                );
              }),
        )
      ],
    );
  }

  int getRandomRating() {
    return _random.nextInt(5);
  }

  Widget _buildPageItem(int index, int index2) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPagevalue.floor()) {
      var currScale = 1 - (_currPagevalue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPagevalue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPagevalue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPagevalue.floor() - 1) {
      var currScale = 1 - (_currPagevalue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          //upper container
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getPopularFood(),
                  arguments: {'index': index2});
              // Navigator.pushNamed(context, 'popular-food', arguments: index2);
            },
            child: Container(
              height: 220,
              margin: EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/food$index2.jpg"),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            //lower container
            child: Container(
              height: 140,
              margin: EdgeInsets.only(left: 40, right: 40, bottom: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    ),
                  ]),
              child: Container(
                padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                child: AppColumn(
                  text: _giveName(index2),
                  index: index2,
                  rate: getRandomRating(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
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

var c = 0;
String _giveName2(index) {
  String name;
  c = c + 1;
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

// int checkIndex(int index) {
//   if (index > 11) {
//     index = 6;
//     return index;
//   }
// }
