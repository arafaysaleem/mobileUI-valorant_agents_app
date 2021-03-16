import '../enums/ability_names_enum.dart';

import '../extensions/string_extension.dart';

class Ability {
  final AbilityName _name;
  final String description;

  const Ability({
    required name,
    required this.description,
  }) : this._name = name;

  String get icon => _name.toString().toLowerCase().toImage();

  String get name => _name.toString().capitalize();
}
