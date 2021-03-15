import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ui/screens/agent_details_screen.dart';
import 'ui/screens/agent_listings_screen.dart';
import 'ui/screens/title_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
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
