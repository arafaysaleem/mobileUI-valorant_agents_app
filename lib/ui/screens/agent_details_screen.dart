import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/abilities_provider.dart';

import '../../models/ability.dart';
import '../../models/agent.dart';

import '../../helper/assets.dart';

final _listAbility = ScopedProvider<Ability>((_) => throw UnimplementedError());

class AgentDetailsScreen extends HookWidget {
  static const routeName = "/agent_details_screen";

  const AgentDetailsScreen();

  @override
  Widget build(BuildContext context) {
    final agent = ModalRoute.of(context)!.settings.arguments as Agent;
    final abilities =
        useProvider(abilitiesProvider).getAgentAbilities(agent.abilities);
    final theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: theme.primaryColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.detailsBg),
            fit: BoxFit.fill,
          ),
        ),
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowGlow();
            return false;
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Heading
                Text(
                  "BIOGRAPHY",
                  style: theme.textTheme.headline2!.copyWith(fontSize: 20),
                ),

                const SizedBox(height: 20),

                //Agent name
                _AnimatedName(
                  agentName: agent.name,
                ),

                const SizedBox(height: 25),

                //Agent avatar
                Hero(
                  tag: agent.name,
                  child: Image.asset(
                    Assets.avatarAsset(agent.avatar),
                    height: 300,
                  ),
                ),

                const SizedBox(height: 30),

                //Agent abilities grid
                GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: abilities.length,
                  padding: const EdgeInsets.all(0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.5,
                  ),
                  itemBuilder: (ctx, i) => ProviderScope(
                    overrides: [
                      _listAbility.overrideWithValue(abilities[i]),
                    ],
                    child: const _AbilityGridItem(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimatedName extends HookWidget {
  const _AnimatedName({
    Key? key,
    required this.agentName,
  }) : super(key: key);

  final String agentName;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: Duration(milliseconds: 360),
    );
    final _curvedAnimation = Tween<double>(begin: 0.0,end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeIn),
    );
    useEffect(() {
      controller.forward();
    }, const []);
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ColoredBox(
            color: theme.primaryColor,
            child: SizedBox(height: 2),
          ),
        ),
        ScaleTransition(
          scale: _curvedAnimation,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              agentName,
              style: theme.textTheme.headline1!
                  .copyWith(fontSize: 40, letterSpacing: 1),
            ),
          ),
        ),
        Expanded(
          child: ColoredBox(
            color: theme.primaryColor,
            child: SizedBox(height: 2),
          ),
        ),
      ],
    );
  }
}

class _AbilityGridItem extends HookWidget {
  const _AbilityGridItem();

  @override
  Widget build(BuildContext context) {
    final ability = useProvider(_listAbility);
    final theme = Theme.of(context);
    return Column(
      children: [
        //Icon
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: theme.primaryColor),
          ),
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(7),
          child: Image.asset(
            Assets.abilityIcon(ability.icon),
            color: theme.primaryColor,
            fit: BoxFit.contain,
          ),
        ),

        const SizedBox(height: 10),

        //Ability Name
        Text(
          ability.name.replaceAll("_", " "),
          style: theme.textTheme.bodyText2!.copyWith(fontSize: 13),
        ),

        const SizedBox(height: 12),

        //Ability Desc
        Expanded(
          child: Text(
            ability.description,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyText2!.copyWith(
              fontSize: 11.5,
              height: 1.5,
            ),
          ),
        ),

        const SizedBox(height: 5),
      ],
    );
  }
}
