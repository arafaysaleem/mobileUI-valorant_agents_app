import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ui/screens/agent_details_screen.dart';
import 'ui/screens/agent_listings_screen.dart';
import 'ui/screens/title_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: TitleScreen.routeName,
        routes: {
          TitleScreen.routeName: (_) => TitleScreen(),
          AgentListingsScreen.routeName: (_) => AgentListingsScreen(),
          AgentDetailsScreen.routeName: (_) => AgentDetailsScreen(),
        },
      ),
    );
  }
}
