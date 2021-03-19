import 'dart:ui';

import '../enums/ability_names_enum.dart';
import '../enums/agent_categories_enum.dart';
import '../enums/countries_enum.dart';
import '../enums/agent_names_enum.dart';

import '../extensions/string_extension.dart';

class Agent {
  final AgentNames _name;
  final List<AbilityName> abilities;
  final Countries _origin;
  final Color color;
  final AgentCategories _category;

  const Agent(
    this._name, {
    required this.abilities,
    required origin,
    required this.color,
    required category,
  }) : this._origin = origin, this._category = category;

  String get name => _name.inString;

  String get origin => _origin.inString;

  String get category => _category.inString;

  String get avatar => name.toLowerCase().toPng();
}
