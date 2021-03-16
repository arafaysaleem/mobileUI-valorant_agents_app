import 'package:flutter/foundation.dart';

enum AgentCategories {
  DUELISTS,
  SENTINELS,
  INITIATORS,
  CONTROLLERS,
  ALL,
}

extension AgentCategoryEx on AgentCategories{
  String get inString => describeEnum(this);
}