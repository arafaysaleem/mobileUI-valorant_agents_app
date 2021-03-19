import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ui/screens/agent_details_screen.dart';
import 'ui/screens/agent_listings_screen.dart';
import 'ui/screens/title_screen.dart';

import 'helper/font_family.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setEnabledSystemUIOverlays([]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Valorant Agents',
        theme: ThemeData(
          primaryColor: const Color(0xFFFF4654),
          textTheme: Typography.whiteHelsinki.copyWith(
            headline1: TextStyle(
              fontFamily: FontFamily.valorant,
              color: Colors.white
            ),
            headline2: TextStyle(
              fontFamily: FontFamily.robotoCondensed,
              fontWeight: FontWeight.w700,
              color: Colors.white
            ),
            headline4: TextStyle(
              fontFamily: FontFamily.tungsten,
              fontWeight: FontWeight.w500,
              color: Colors.white
            ),
            bodyText1: TextStyle(
              fontFamily: FontFamily.robotoCondensed,
              fontWeight: FontWeight.w300,
              color: Colors.white
            ),
            bodyText2: TextStyle(
                fontFamily: FontFamily.robotoCondensed,
                fontWeight: FontWeight.w400,
                color: Colors.white
            ),
          )
        ),
        initialRoute: AgentListingsScreen.routeName,
        routes: {
          TitleScreen.routeName: (_) => const TitleScreen(),
          AgentListingsScreen.routeName: (_) => const AgentListingsScreen(),
          AgentDetailsScreen.routeName: (_) => const AgentDetailsScreen(),
        },
      ),
    );
  }
}
