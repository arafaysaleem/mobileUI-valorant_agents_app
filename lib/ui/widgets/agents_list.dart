import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/all_providers.dart';

import '../../enums/agent_categories_enum.dart';

class AgentsList extends HookWidget {
  final AgentCategories category;

  const AgentsList({this.category = AgentCategories.ALL});

  @override
  Widget build(BuildContext context) {
    final agents = useProvider(agentsProvider).getAgents(category: category);
    return ListView.builder(
      itemCount: agents.length,
      itemBuilder: (ctx,i) => Container(
        height: 120,
        width: 100,
        decoration: BoxDecoration(
          color: agents[i].color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(agents[i].name),
      ),
    );
  }
}


