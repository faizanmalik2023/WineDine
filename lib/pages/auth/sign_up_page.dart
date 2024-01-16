import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:winedine/routes/route_helper.dart';
import 'package:winedine/widgets/bigtext.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../widgets/app_text_fill.dart';

// class SignUpPage extends StatefulWidget{
//   @override
//   _SignUpPageState createState()=> _Registrat
// }

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _auth = FirebaseAuth.instance;

  String email = '';

  String password = '';

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
            SizedBox(height: 10),
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
              height: 20,
            ),
            AppTextField(
              textController: nameController,
              hintText: "Namee",
              icon: Icons.person,
            ),
            SizedBox(
              height: 20,
            ),
            AppTextField(
              textController: phoneController,
              hintText: "Phoone",
              icon: Icons.phone,
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                email = emailController.text.trim();
                password = passwordController.text.trim();
                try {
                  final user = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  if (user != null) Get.toNamed(RouteHelper.getSignInPage());
                  // Navigator.pushNamed(context, RouteHelper.getInitial());
                } catch (e) {
                  print(e);
                }
              },
              child: Container(
                width: 150,
                height: 50,
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
              height: 20,
            ),
            RichText(
              text: TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.toNamed(RouteHelper.getSignInPage());
                  },
                text: "Have an account already?",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
    email = emailController.text.trim();
    password = passwordController.text.trim();
  }
}
