import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:winedine/routes/route_helper.dart';
import 'package:winedine/widgets/app_text_fill.dart';
import 'package:winedine/widgets/bigtext.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = "";
    var controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.limeAccent.shade700,
        title: BigText(
          text: " Search For Your Favorite Foods",
          color: Colors.white,
          size: 25,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          AppTextField(
            textController: controller,
            hintText: "Food Name",
            icon: Icons.fastfood_outlined,
            color: Colors.red,
          ),
          SizedBox(
            height: 100,
          ),
          GestureDetector(
            onTap: () {
              name = controller.text.trim();
              int index = SearchFood(name);
              Get.toNamed(RouteHelper.getPopularFood(),
                  arguments: {'index': index});
            },
            child: Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular((50)),
                  color: Colors.lightBlue.shade300),
              child: Center(
                child: BigText(
                  text: "Search",
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  int SearchFood(String name) {
    int index = 0;
    if (name == "Bakhshish Fries") {
      return 0;
    } else if (name == "Dozakhi Biryani") {
      return 1;
    } else if (name == "Chinioti Burger") {
      return 2;
    } else if (name == "Naram Tacos") {
      return 3;
    } else if (name == "Heera Chargha") {
      return 4;
    }
    return 5;
  }
}
