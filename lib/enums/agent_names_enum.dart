import 'package:flutter/foundation.dart';

enum AgentNames {
  JETT, RAZE, BREACH, OMEN, BRIMSTONE, PHEONIX, SAGE, SOVA,
  VIPER, CYPHER, REYNA, KILLJOY, SKYE, YORU, ASTRA
}

extension AgentEx on AgentNames{
  String get inString => describeEnum(this);
}