import 'package:flutter/material.dart';

class TitleScreen extends StatelessWidget {
  static const routeName = "/title_screen";

  const TitleScreen();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/backgrounds/cover1.png"),
          fit: BoxFit.fill
        )
      ),
    );
  }
}
