import 'package:flutter/material.dart';
import 'package:winedine/widgets/bigtext.dart';

import '../../widgets/account_widget.dart';
import '../../widgets/app_icon.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //icon
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: BigText(
          text: "Profile",
          size: 24,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Icon(
            Icons.person,
            size: 100,
            color: Colors.blue,
          ),
          SizedBox(
            height: 30,
          ),
          //name
          AccountWidget(
            appIcon: AppIcon(
              icon: Icons.person,
              backgroundColor: Colors.blue.shade300,
              iconColor: Colors.white,
              size: 50,
            ),
            bigText: BigText(
              text: " Faizi ",
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          //phone
          AccountWidget(
            appIcon: AppIcon(
              icon: Icons.phone,
              backgroundColor: Colors.yellow.shade400,
              iconColor: Colors.white,
              size: 50,
            ),
            bigText: BigText(
              text: " 031417147714 ",
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          AccountWidget(
            appIcon: AppIcon(
              icon: Icons.email,
              backgroundColor: Colors.limeAccent.shade400,
              iconColor: Colors.white,
              size: 50,
            ),
            bigText: BigText(
              text: " transformer@gmail.com ",
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 10,
          ),

          AccountWidget(
            appIcon: AppIcon(
              icon: Icons.location_city,
              backgroundColor: Colors.orange.shade300,
              iconColor: Colors.white,
              size: 50,
            ),
            bigText: BigText(
              text: " Cantonment  ",
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
