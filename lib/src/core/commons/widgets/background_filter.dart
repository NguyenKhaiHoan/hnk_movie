import 'package:flutter/material.dart';

class BackgroundFilterImage extends StatelessWidget {
  const BackgroundFilterImage({
    super.key,
    required this.imagePath,
    required this.colors,
  });

  final String imagePath;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imagePath), fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: colors)),
        ));
  }
}
