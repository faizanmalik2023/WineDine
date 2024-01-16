import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:winedine/pages/auth/sign_up_page.dart';
import 'package:winedine/routes/route_helper.dart';
import 'package:winedine/widgets/bigtext.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../widgets/app_text_fill.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _auth = FirebaseAuth.instance;
  String email = "";
  String password = "";
  Color c = Colors.white;
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              child: Center(
                child: Image.asset("assets/image/icon.jpg"),
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 0),
              width: double.maxFinite,
              child: Column(
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Sign into your account",
                    style: TextStyle(
                        fontSize: 20,
                        //fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            AppTextField(
              textController: emailController,
              hintText: "Email",
              icon: Icons.email,
            ),
            SizedBox(
              height: 20,
            ),
            AppTextField(
              textController: passwordController,
              hintText: "Password",
              icon: Icons.password_sharp,
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () async {
                setState(() async {
                  email = emailController.text.trim();
                  password = passwordController.text.trim();
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null)
                      Get.toNamed(RouteHelper.getMainFoodPage());
                  } catch (e) {
                    setState(() {
                      c = Colors.redAccent;
                    });
                    print(e);
                  }
                });
              },
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular((50)),
                    color: Colors.blue.shade200),
                child: Center(
                  child: BigText(
                    text: "Sign In",
                    size: 30,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                child: BigText(
                  text: "Invalid username or password ",
                  color: c,
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                  text: "Don't have an account?",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                  children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(() => SignUpPage(),
                              transition: Transition.fade),
                        text: "Create",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20,
                        ))
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
