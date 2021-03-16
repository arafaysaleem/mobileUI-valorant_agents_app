import 'dart:ui';

import '../enums/ability_names_enum.dart';
import '../enums/classes_enum.dart';
import '../enums/countries_enum.dart';
import '../enums/agent_names_enum.dart';

import '../extensions/string_extension.dart';

class Agent {
  final AgentNames _name;
  final List<AbilityName> abilities;
  final Countries _origin;
  final Color color;
  final Classes category;

  const Agent(
    this._name, {
    required this.abilities,
    required origin,
    required this.color,
    required this.category,
  }) : this._origin = origin;

  String get name => _name.toString();

  String get origin => _origin.toString();

  String get avatar => _name.toString().toLowerCase().toImage();
}
