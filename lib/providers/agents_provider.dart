import 'dart:collection';

import 'package:flutter/material.dart';

import '../enums/agents_enum.dart';
import '../enums/countries_enum.dart';
import '../enums/classes_enum.dart';

import '../models/agent.dart';

class AgentsProvider {
  final Map<Classes,List<AgentModel>> _agents = const {
    Classes.SENTINELS: const [
      AgentModel(
        Agents.CYPHER,
        abilities: {},
        origin: Countries.RUSSIA,
        category: Classes.SENTINELS,
        color: Colors.amber,
      ),
      AgentModel(
        Agents.SAGE,
        abilities: {},
        origin: Countries.CHINA,
        category: Classes.SENTINELS,
        color: Colors.amber,
      ),
      AgentModel(
        Agents.KILLJOY,
        abilities: {},
        origin: Countries.GERMANY,
        category: Classes.SENTINELS,
        color: Colors.amber,
      ),
    ],
    Classes.CONTROLLERS: const [
      AgentModel(
        Agents.ASTRA,
        abilities: {},
        origin: Countries.GHANA,
        category: Classes.CONTROLLERS,
        color: Colors.red,
      ),
      AgentModel(
        Agents.BRIMSTONE,
        abilities: {},
        origin: Countries.USA,
        category: Classes.CONTROLLERS,
        color: Colors.red,
      ),
      AgentModel(
        Agents.OMEN,
        abilities: {},
        origin: Countries.USA,
        category: Classes.CONTROLLERS,
        color: Colors.red,
      ),
      AgentModel(
        Agents.VIPER,
        abilities: {},
        origin: Countries.USA,
        category: Classes.CONTROLLERS,
        color: Colors.red,
      ),
    ],
    Classes.INITIATORS: const [
      AgentModel(
        Agents.BREACH,
        abilities: {},
        origin: Countries.SWEDEN,
        category: Classes.INITIATORS,
        color: Colors.blue,
      ),
      AgentModel(
        Agents.BREACH,
        abilities: {},
        origin: Countries.SWEDEN,
        category: Classes.INITIATORS,
        color: Colors.blue,
      ),
      AgentModel(
        Agents.SOVA,
        abilities: {},
        origin: Countries.RUSSIA,
        category: Classes.INITIATORS,
        color: Colors.blue,
      ),
      AgentModel(
        Agents.SKYE,
        abilities: {},
        origin: Countries.AUSTRALIA,
        category: Classes.INITIATORS,
        color: Colors.blue,
      ),
    ],
    Classes.DUELISTS: const [
      AgentModel(
        Agents.JETT,
        abilities: {},
        origin: Countries.SOUTH_KOREA,
        category: Classes.DUELISTS,
        color: Color(0xFF00C853),
      ),
      AgentModel(
        Agents.RAZE,
        abilities: {},
        origin: Countries.BRAZIL,
        category: Classes.DUELISTS,
        color: Color(0xFF00C853),
      ),
      AgentModel(
        Agents.PHEONIX,
        abilities: {},
        origin: Countries.UK,
        category: Classes.DUELISTS,
        color: Color(0xFF00C853),
      ),
      AgentModel(
        Agents.REYNA,
        abilities: {},
        origin: Countries.MEXICO,
        category: Classes.DUELISTS,
        color: Color(0xFF00C853),
      ),
      AgentModel(
        Agents.YORU,
        abilities: {},
        origin: Countries.JAPAN,
        category: Classes.DUELISTS,
        color: Color(0xFF00C853),
      ),
    ]
  };

  UnmodifiableListView<AgentModel> getAgents({ required Classes category}){
    if(category == Classes.ALL) {
      List<AgentModel> all = _agents.values.expand((agents) => agents).toList();
      return UnmodifiableListView(all);
    }
    return UnmodifiableListView(_agents[category]!);
  }


}
