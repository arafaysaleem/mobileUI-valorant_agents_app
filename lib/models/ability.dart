import '../enums/ability_names_enum.dart';

import '../extensions/string_extension.dart';

class Ability {
  final AbilityName _name;
  final String description;

  const Ability({
    required name,
    required this.description,
  }) : this._name = name;

  String get icon => _name.inString.toLowerCase().toPng();

  String get name => _name.inString;
}
