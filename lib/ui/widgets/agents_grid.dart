import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/all_providers.dart';

import '../../models/agent.dart';

import '../../enums/agent_categories_enum.dart';

import '../../helper/assets.dart';

import '../screens/agent_details_screen.dart';

final _listAgent = ScopedProvider<Agent>((_) => throw UnimplementedError());
final _listIsLeftSide = ScopedProvider<bool>((_) => throw UnimplementedError());

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
        return ProviderScope(
          overrides: [
            _listAgent.overrideWithValue(agent),
            _listIsLeftSide.overrideWithValue(i.isEven),
          ],
          child: const AgentGridItem(),
        );
      },
    );
  }
}

class AgentGridItem extends HookWidget {
  const AgentGridItem();

  @override
  Widget build(BuildContext context) {
    final agent = useProvider(_listAgent);
    final isLeftSide = useProvider(_listIsLeftSide);
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AgentDetailsScreen.routeName,
          arguments: agent,
        );
      },
      child: Stack(
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
                  : const EdgeInsets.only(left: 5, right: 10),
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
                    style: theme.textTheme.headline4!
                        .copyWith(fontSize: 12, letterSpacing: 0.7),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "${agent.name}",
                    style: theme.textTheme.headline1!.copyWith(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),

          //Avatar
          Positioned(
            right: 3,
            bottom: 5,
            child: Hero(
              tag: agent.name,
              child: Image.asset(
                Assets.avatarAsset(agent.avatar),
                height: 207,
              ),
            ),
          )
        ],
      ),
    );
  }
}
