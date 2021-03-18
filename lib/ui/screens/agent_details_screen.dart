import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/all_providers.dart';

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
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.detailsBg),
            fit: BoxFit.fill,
          ),
        ),
        padding: const EdgeInsets.fromLTRB(10, 60, 10, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Heading
              Text(
                "BIOGRAPHY",
                style: TextStyle(fontSize: 20),
              ),

              //Agent name
              Text(
                "${agent.name}",
                style: theme.textTheme.bodyText1!
                    .copyWith(fontSize: 40, letterSpacing: 1),
              ),

              const SizedBox(height: 30),

              Image.asset(
                Assets.avatarAsset(agent.avatar),
                height: 300,
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
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (ctx, i) => ProviderScope(
                  overrides: [
                    _listAbility.overrideWithValue(abilities[i]),
                  ],
                  child: const _AbilityListItem(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _AbilityListItem extends HookWidget {
  const _AbilityListItem();

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
          // child: Image.asset(
          //   Assets.avatarAsset(ability.icon),
          //   height: 50,
          // ),
        ),

        const SizedBox(height: 10),

        //Ability Name
        Text(
          ability.name,
          style: TextStyle(fontSize: 13),
        ),

        const SizedBox(height: 12),

        //Ability Desc
        Text(
          ability.description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11),
        ),

        const SizedBox(height: 5),
      ],
    );
  }
}
