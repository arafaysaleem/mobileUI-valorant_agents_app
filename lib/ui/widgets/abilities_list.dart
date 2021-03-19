import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/abilities_provider.dart';

import '../../models/ability.dart';

import '../../helper/assets.dart';

final _listAbility = ScopedProvider<Ability>((_) => throw UnimplementedError());

class AbilitiesList extends HookWidget {
  const AbilitiesList();

  @override
  Widget build(BuildContext context) {
    final abilities = useProvider(abilitiesProvider).abilities;
    return ListView.separated(
      separatorBuilder: (_, __) => Divider(
        color: Theme.of(context).primaryColor,
        thickness: 1.2,
        height: 24,
      ),
      physics: const BouncingScrollPhysics(),
      itemCount: abilities.length,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      itemBuilder: (ctx, i) {
        final ability = abilities[i];
        return ProviderScope(
          overrides: [
            _listAbility.overrideWithValue(ability),
          ],
          child: const AbilityListItem(),
        );
      },
    );
  }
}

class AbilityListItem extends HookWidget {
  const AbilityListItem();

  @override
  Widget build(BuildContext context) {
    final ability = useProvider(_listAbility);
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: theme.primaryColor),
        ),
        height: 80,
        width: 70,
        padding: const EdgeInsets.all(7),
        child: Image.asset(
          Assets.abilityIcon(ability.icon),
          color: theme.primaryColor,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(
        ability.name.replaceAll("_", " "),
        style: theme.textTheme.headline2!.copyWith(fontSize: 15),
      ),
      subtitle: Text(
        ability.description,
        style: theme.textTheme.bodyText2!.copyWith(fontSize: 12),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
