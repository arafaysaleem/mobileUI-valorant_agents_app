import 'dart:collection';

import 'package:flutter/material.dart';

import '../enums/ability_names_enum.dart';
import '../enums/agent_names_enum.dart';
import '../enums/agent_categories_enum.dart';
import '../enums/countries_enum.dart';
import '../models/agent.dart';

class AgentsProvider {
  const AgentsProvider();

  final Map<AgentCategories, List<Agent>> _agents = const {
    AgentCategories.SENTINELS: [
      Agent(
        AgentNames.CYPHER,
        abilities: [
          AbilityName.TRAPWIRE,
          AbilityName.CYBER_CAGE,
          AbilityName.SPYCAM,
          AbilityName.NEURAL_THEFT,
        ],
        origin: Countries.RUSSIA,
        category: AgentCategories.SENTINELS,
        color: Color(0xFFb1b1b1),
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
        category: AgentCategories.SENTINELS,
        color: Color(0xFF3e1e4c),
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
        category: AgentCategories.SENTINELS,
        color: Colors.amber,
      ),
    ],
    AgentCategories.CONTROLLERS: [
      Agent(
        AgentNames.BRIMSTONE,
        abilities: [
          AbilityName.STIM_BEACON,
          AbilityName.INCENDIARY,
          AbilityName.SKY_SMOKE,
          AbilityName.ORBITAL_STRIKE,
        ],
        origin: Countries.USA,
        category: AgentCategories.CONTROLLERS,
        color: Color(0xFF424a58),
      ),
      Agent(
        AgentNames.ASTRA,
        abilities: [
          AbilityName.GRAVITY_WALL,
          AbilityName.NOVA_PULSE,
          AbilityName.NEBULA,
          AbilityName.ASTRALFORM,
        ],
        origin: Countries.GHANA,
        category: AgentCategories.CONTROLLERS,
        color: Color(0xFF2f0977),
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
        category: AgentCategories.CONTROLLERS,
        color: Color(0xFF4b99c1),
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
        category: AgentCategories.CONTROLLERS,
        color: Color(0xFF1d7b3d),
      ),
    ],
    AgentCategories.INITIATORS: [
      Agent(
        AgentNames.SOVA,
        abilities: [
          AbilityName.SHOCK_BOLT,
          AbilityName.OWL_DRONE,
          AbilityName.RECON_BOLT,
          AbilityName.HUNTERS_FURY,
        ],
        origin: Countries.RUSSIA,
        category: AgentCategories.INITIATORS,
        color: Color(0xFF1565c0),
      ),
      Agent(
        AgentNames.BREACH,
        abilities: [
          AbilityName.AFTERSHOCK,
          AbilityName.FLASHPOINT,
          AbilityName.FAULT_LINE,
          AbilityName.ROLLING_THUNDER,
        ],
        origin: Countries.SWEDEN,
        category: AgentCategories.INITIATORS,
        color: Color(0xFF305d47),
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
        category: AgentCategories.INITIATORS,
        color: Color(0xFF3d9e86),
      ),
    ],
    AgentCategories.DUELISTS: [
      Agent(
        AgentNames.JETT,
        abilities: [
          AbilityName.CLOUDBURST,
          AbilityName.UPDRAFT,
          AbilityName.TAILWIND,
          AbilityName.BLADE_STORM,
        ],
        origin: Countries.SOUTH_KOREA,
        category: AgentCategories.DUELISTS,
        color: Color(0xFF77d4e4),
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
        category: AgentCategories.DUELISTS,
        color: Color(0xFF16363a),
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
        category: AgentCategories.DUELISTS,
        color: Color(0xFFc2c0c6),
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
        category: AgentCategories.DUELISTS,
        color: Color(0xFF833df1),
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
        category: AgentCategories.DUELISTS,
        color: Color(0xFF424b99),
      ),
    ]
  };

  UnmodifiableListView<Agent> getAgents({required AgentCategories category}) {
    if (category == AgentCategories.ALL) {
      List<Agent> all = _agents.values.expand((agents) => agents).toList();
      return UnmodifiableListView(all);
    }
    return UnmodifiableListView(_agents[category]!);
  }
}
