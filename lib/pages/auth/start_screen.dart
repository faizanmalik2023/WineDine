import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:winedine/routes/route_helper.dart';
import 'package:winedine/widgets/app_text_fill.dart';
import 'package:winedine/widgets/bigtext.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Center(
              child: Image.asset("assets/image/icon.jpg"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(height: 120),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getSignUpPage());
            },
            child: Container(
              width: 200,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular((50)),
                  color: Colors.blue.shade200),
              child: Center(
                child: BigText(
                  text: "Sign Up",
                  size: 30,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getSignInPage());
            },
            child: Container(
              width: 200,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular((50)),
                  color: Colors.blue.shade200),
              child: Center(
                child: BigText(
                  text: "Log In",
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
