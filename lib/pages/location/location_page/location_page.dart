import 'package:flutter/material.dart';
import 'package:winedine/pages/location/location_page/map_page.dart';
import 'package:winedine/widgets/app_text_fill.dart';
import 'package:winedine/widgets/bigtext.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({Key? key}) : super(key: key);

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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MapPage()),
                );
              },
              child: Container(
                child: Center(
                  child: Image.asset("assets/image/location.jpg"),
                ),
              ),
            ),
            SizedBox(height: 10),
            AppTextField(
              textController: emailController,
              hintText: "House Number",
              icon: Icons.cabin_sharp,
            ),
            SizedBox(
              height: 20,
            ),
            AppTextField(
              textController: passwordController,
              hintText: " Street ",
              icon: Icons.streetview,
            ),
            SizedBox(
              height: 20,
            ),
            AppTextField(
              textController: nameController,
              hintText: "City",
              icon: Icons.location_city_outlined,
            ),
            SizedBox(
              height: 20,
            ),
            AppTextField(
              textController: phoneController,
              hintText: "Instructions to rider",
              icon: Icons.directions_bike_sharp,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
          height: 120,
          padding: EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Container(
            padding: EdgeInsets.only(top: 20, bottom: 20, right: 10, left: 10),
            child: GestureDetector(
              onTap: () {
                // Get.toNamed(RouteHelper.getLocationPage());
              },
              child: Center(
                child: BigText(
                  text: " Order Now ",
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue,
            ),
          )),
    );
  }
}
