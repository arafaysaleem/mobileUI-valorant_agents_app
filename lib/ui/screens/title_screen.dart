import 'package:flutter/material.dart';

import '../../helper/assets.dart';

class TitleScreen extends StatelessWidget {
  static const routeName = "/title_screen";

  const TitleScreen();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.titleBg),
          fit: BoxFit.fill
        )
      ),
    );
  }
}
