import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:winedine/widgets/smalltext.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textHeight = 200;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(text: firstHalf)
          : Column(
              children: [
                SmallText(
                  text: hiddenText
                      ? (firstHalf + "....")
                      : (firstHalf + secondHalf),
                  color: Colors.black87,
                  size: 13,
                  height: 1.8,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        text: hiddenText ? "Show More" : "Show Less",
                        color: Colors.blue,
                        size: 14,
                      ),
                      Icon(
                        (hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up),
                        color: Colors.blue,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
