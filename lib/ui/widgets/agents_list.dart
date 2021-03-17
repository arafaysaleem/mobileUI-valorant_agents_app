import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/all_providers.dart';

import '../../models/agent.dart';

import '../../enums/agent_categories_enum.dart';

import '../../helper/assets.dart';

class AgentsList extends HookWidget {
  final AgentCategories category;

  const AgentsList({this.category = AgentCategories.ALL});

  @override
  Widget build(BuildContext context) {
    final agents = useProvider(agentsProvider).getAgents(category: category);
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: agents.length,
      padding: const EdgeInsets.all(0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        childAspectRatio: 0.80,
      ),
      itemBuilder: (ctx, i) {
        final agent = agents[i];
        return AgentListItem(agent: agent, isLeftSide: i.isEven);
      },
    );
  }
}

class AgentListItem extends StatelessWidget {
  const AgentListItem({
    Key? key,
    required this.agent, 
    required this.isLeftSide,
  }) : super(key: key);

  final Agent agent;
  final bool isLeftSide;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Name and category
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: agent.color,
              borderRadius: BorderRadius.circular(8),
            ),
            margin: isLeftSide
                ? const EdgeInsets.only(left: 10, right: 15)
                : const EdgeInsets.only(left: 5,right: 10),
            padding: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 6,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "${agent.category}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    letterSpacing: 0.1,
                  ),
                ),
                Text(
                  "${agent.name}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),

        //Avatar
        Positioned(
          right: 1,
          bottom: 5,
          child: Image.asset(
            Assets.avatarAsset(agent.avatar),
            height: 207,
          ),
        )
      ],
    );
  }
}
