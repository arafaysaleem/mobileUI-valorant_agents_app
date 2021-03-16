import 'dart:collection';

import 'package:flutter/material.dart';

import '../enums/ability_names_enum.dart';
import '../enums/agent_names_enum.dart';
import '../enums/classes_enum.dart';
import '../enums/countries_enum.dart';
import '../models/agent.dart';

class AgentsProvider {
  const AgentsProvider();

  final Map<Classes, List<Agent>> _agents = const {
    Classes.SENTINELS: [
      Agent(
        AgentNames.CYPHER,
        abilities: [
          AbilityName.TRAPWIRE,
          AbilityName.CYBER_CAGE,
          AbilityName.SPYCAM,
          AbilityName.NEURAL_THEFT,
        ],
        origin: Countries.RUSSIA,
        category: Classes.SENTINELS,
        color: Colors.amber,
      ),
      Agent(
        AgentNames.SAGE,
        abilities: [
          AbilityName.BARRIER_ORB,
          AbilityName.SLOW_ORB,
          AbilityName.HEALING_ORB,
          AbilityName.RESURRECTION,
        ],
        origin: Countries.CHINA,
        category: Classes.SENTINELS,
        color: Colors.amber,
      ),
      Agent(
        AgentNames.KILLJOY,
        abilities: [
          AbilityName.ALARMBOT,
          AbilityName.NANOSWARM,
          AbilityName.TURRET,
          AbilityName.LOCKDOWN,
        ],
        origin: Countries.GERMANY,
        category: Classes.SENTINELS,
        color: Colors.amber,
      ),
    ],
    Classes.CONTROLLERS: [
      Agent(
        AgentNames.ASTRA,
        abilities: [
          AbilityName.GRAVITY_WALL,
          AbilityName.NOVA_PULSE,
          AbilityName.NEBULA,
          AbilityName.ASTRALFORM,
        ],
        origin: Countries.GHANA,
        category: Classes.CONTROLLERS,
        color: Colors.red,
      ),
      Agent(
        AgentNames.BRIMSTONE,
        abilities: [
          AbilityName.STIM_BEACON,
          AbilityName.INCENDIARY,
          AbilityName.SKY_SMOKE,
          AbilityName.ORBITAL_STRIKE,
        ],
        origin: Countries.USA,
        category: Classes.CONTROLLERS,
        color: Colors.red,
      ),
      Agent(
        AgentNames.OMEN,
        abilities: [
          AbilityName.SHROUDED_STEP,
          AbilityName.PARANOIA,
          AbilityName.DARK_COVER,
          AbilityName.FROM_THE_SHADOWS,
        ],
        origin: Countries.USA,
        category: Classes.CONTROLLERS,
        color: Colors.red,
      ),
      Agent(
        AgentNames.VIPER,
        abilities: [
          AbilityName.SNAKE_BITE,
          AbilityName.POISON_CLOUD,
          AbilityName.TOXIC_SCREEN,
          AbilityName.VIPERS_PIT,
        ],
        origin: Countries.USA,
        category: Classes.CONTROLLERS,
        color: Colors.red,
      ),
    ],
    Classes.INITIATORS: [
      Agent(
        AgentNames.BREACH,
        abilities: [
          AbilityName.AFTERSHOCK,
          AbilityName.FLASHPOINT,
          AbilityName.FAULT_LINE,
          AbilityName.ROLLING_THUNDER,
        ],
        origin: Countries.SWEDEN,
        category: Classes.INITIATORS,
        color: Colors.blue,
      ),
      Agent(
        AgentNames.SOVA,
        abilities: [
          AbilityName.SHOCK_BOLT,
          AbilityName.OWL_DRONE,
          AbilityName.RECON_BOLT,
          AbilityName.HUNTERS_FURY,
        ],
        origin: Countries.RUSSIA,
        category: Classes.INITIATORS,
        color: Colors.blue,
      ),
      Agent(
        AgentNames.SKYE,
        abilities: [
          AbilityName.REGROWTH,
          AbilityName.TRAILBLAZER,
          AbilityName.GUIDING_LIGHT,
          AbilityName.SEEKERS,
        ],
        origin: Countries.AUSTRALIA,
        category: Classes.INITIATORS,
        color: Colors.blue,
      ),
    ],
    Classes.DUELISTS: [
      Agent(
        AgentNames.JETT,
        abilities: [
          AbilityName.CLOUDBURST,
          AbilityName.UPDRAFT,
          AbilityName.TAILWIND,
          AbilityName.BLADE_STORM,
        ],
        origin: Countries.SOUTH_KOREA,
        category: Classes.DUELISTS,
        color: Color(0xFF00C853),
      ),
      Agent(
        AgentNames.RAZE,
        abilities: [
          AbilityName.BOOM_BOT,
          AbilityName.BLAST_PACK,
          AbilityName.PAINT_SHELLS,
          AbilityName.SHOWSTOPPER,
        ],
        origin: Countries.BRAZIL,
        category: Classes.DUELISTS,
        color: Color(0xFF00C853),
      ),
      Agent(
        AgentNames.PHEONIX,
        abilities: [
          AbilityName.BLAZE,
          AbilityName.CURVEBALL,
          AbilityName.HOT_HANDS,
          AbilityName.RUN_IT_BACK,
        ],
        origin: Countries.UK,
        category: Classes.DUELISTS,
        color: Color(0xFF00C853),
      ),
      Agent(
        AgentNames.REYNA,
        abilities: [
          AbilityName.LEER,
          AbilityName.DEVOUR,
          AbilityName.DISMISS,
          AbilityName.EMPRESS,
        ],
        origin: Countries.MEXICO,
        category: Classes.DUELISTS,
        color: Color(0xFF00C853),
      ),
      Agent(
        AgentNames.YORU,
        abilities: [
          AbilityName.FAKEOUT,
          AbilityName.BLINDSIDE,
          AbilityName.GATECRASH,
          AbilityName.DIMENSION_DRIFT,
        ],
        origin: Countries.JAPAN,
        category: Classes.DUELISTS,
        color: Color(0xFF00C853),
      ),
    ]
  };

  UnmodifiableListView<Agent> getAgents({required Classes category}) {
    if (category == Classes.ALL) {
      List<Agent> all = _agents.values.expand((agents) => agents).toList();
      return UnmodifiableListView(all);
    }
    return UnmodifiableListView(_agents[category]!);
  }
}
