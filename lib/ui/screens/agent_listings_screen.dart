import 'package:flutter/material.dart';
import 'package:valorant_agents_app/ui/widgets/agents_list.dart';

class AgentListingsScreen extends StatelessWidget {
  static const routeName = "/agent_listings_screen";

  const AgentListingsScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: const Center(
        child: const Padding(
          padding: const EdgeInsets.all(10),
          child: AgentsList(),
        ),
      ),
    );
  }
}
