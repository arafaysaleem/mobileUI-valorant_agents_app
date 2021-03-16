import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/all_providers.dart';

import '../../enums/agent_categories_enum.dart';

import '../../helper/assets.dart';

class AgentsList extends HookWidget {
  final AgentCategories category;

  const AgentsList({this.category = AgentCategories.ALL});

  @override
  Widget build(BuildContext context) {
    final agents = useProvider(agentsProvider).getAgents(category: category);
    return GridView.builder(
      itemCount: agents.length,
      padding: const EdgeInsets.all(0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 35,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (ctx, i) => SizedBox(
        height: 210,
        child: Stack(
          children: [
            //Name and category
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: agents[i].color,
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: i.isEven
                    ? const EdgeInsets.only(left: 20)
                    : const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 6,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "${agents[i].category}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          letterSpacing: 0.8),
                    ),
                    Text(
                      "${agents[i].name}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Avatar
            Positioned(
              right: -25,
              bottom: 0,
              child: Image.asset(
                Assets.avatarAsset(agents[i].avatar),
                height: 210,
              ),
            )
          ],
        ),
      ),
    );
  }
}
