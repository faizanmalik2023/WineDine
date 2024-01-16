import 'package:photo_view/photo_view.dart';
import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: PhotoView(
      initialScale: 1.0,
      imageProvider: AssetImage("assets/image/map.jpg"),
    ));
  }
}
