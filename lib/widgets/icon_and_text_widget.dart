import 'package:flutter/cupertino.dart';
import 'package:winedine/widgets/smalltext.dart';
import 'dart:math';

Random _random = Random();

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Color iconColor;
  final int index;
  const IconAndTextWidget(
      {Key? key,
      required this.icon,
      required this.text,
      required this.color,
      required this.iconColor,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: decideColor(index),
        ),
        SizedBox(
          width: 5,
        ),
        SmallText(text: text, color: color),
      ],
    );
  }
}

Color decideColor(int index) {
  //int colorIndex = _random.nextInt(3);
  if (index == 69) {
    return Color(0xFF00c0FF);
  } else if (index == 1 || index == 4 || index == 6) {
    return Color(0xFFFF0000);
  } else if (index == 2 || index == 3 || index == 0) {
    return Color(0xFF00c0FF);
  } else if (index == 5 || index > 7 && index < 12)
    return Color(0xFFFFFF00);
  else {
    return Color(0xFFFF0000); // this line should never be reached
  }
}
