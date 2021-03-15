import 'dart:ui';

import '../enums/classes_enum.dart';
import '../enums/countries_enum.dart';
import '../enums/agents_enum.dart';

import '../extensions/string_extension.dart';

class AgentModel {
  final Agents _agent;
  final Map<String, String> abilities;
  final Countries _origin;
  final Color color;
  final Classes category;

  const AgentModel(
    this._agent, {
    required this.abilities,
    required origin,
    required this.color,
    required this.category,
  }) : this._origin = origin;

  String get name => _agent.toString();

  String get origin => _origin.toString();

  String get avatar => _agent.toString().toLowerCase().toImage();
}
