import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:winedine/widgets/bigtext.dart';
import 'package:winedine/widgets/icon_and_text_widget.dart';
import 'package:winedine/widgets/smalltext.dart';

class AppColumn extends StatelessWidget {
  final String text;
  final int index;
  final int rate;
  const AppColumn(
      {Key? key, required this.text, required this.index, required this.rate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var rate = getRandomRating();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: 30,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                giveRating(index),
                (index) => Icon(
                  Icons.star,
                  color: Colors.blue,
                  size: 15,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            SmallText(
              text: "5",
              color: Colors.black,
            ),
            SizedBox(
              width: 10,
            ),
            SmallText(text: "1287", color: Colors.black),
            SizedBox(
              width: 10,
            ),
            SmallText(text: "comments", color: Colors.black),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            IconAndTextWidget(
                index: index,
                icon: Icons.circle,
                text: "Spice Rate",
                color: Colors.black87,
                iconColor: Colors.yellow),
            SizedBox(
              width: 10,
            ),
            IconAndTextWidget(
                index: 69,
                icon: Icons.location_on,
                text: "1.7 km",
                color: Colors.black87,
                iconColor: Colors.green),
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
    );
  }

  int giveRating(int index) {
    if (index % 2 == 0) {
      return 5;
    } else {
      return 2;
    }
  }
}
