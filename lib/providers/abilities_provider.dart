import 'dart:collection';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/ability.dart';

import '../enums/ability_names_enum.dart';

final abilitiesProvider = Provider<AbilitiesProvider>((ref) {
  return AbilitiesProvider();
});

class AbilitiesProvider {
  const AbilitiesProvider();

  final Map<AbilityName, Ability> _abilities = const {
    AbilityName.AFTERSHOCK: Ability(
      name: AbilityName.AFTERSHOCK,
      description: """
        Equip a charge. Fire to set the charge through a wall, 
        dealing heavy damage after a short windup. 
        Enemies within the damage range are warned.
      """,
    ),
    AbilityName.ALARMBOT: Ability(
      name: AbilityName.ALARMBOT,
      description: """
        EQUIP a covert Alarmbot. FIRE to deploy a bot that hunts down
        enemies that get in range. After reaching its target, 
        the bot explodes, applying Vulnerable. HOLD EQUIP to recall a 
        deployed bot. Deactivates if Killjoy is more than 40m away from them. 
        Re-entering the 40m range reactivates it.
      """,
    ),
    AbilityName.ASTRAL_FORM: Ability(
      name: AbilityName.ASTRAL_FORM,
      description: """
        ACTIVATE (X) to enter Astral Form and PRIMARY FIRE to place Stars. 
        Target Stars with your Nova Pulse, Nebula, or Gravity Well to use
        those abilities.
      """,
    ),
    AbilityName.BARRIER_ORB: Ability(
      name: AbilityName.BARRIER_ORB,
      description: """
        Equip a barrier orb. Fire places a solid wall. 
        Alternate fire rotates the targeter.
      """,
    ),
    AbilityName.BLADE_STORM: Ability(
      name: AbilityName.BLADE_STORM,
      description: """
        	Equip a set of highly accurate throwing knives that recharge
        	on an opponent. Fire to throw a single knife at your target.
        	Alternative Fire to throw all remaining daggers at your target.
      """,
    ),
    AbilityName.BLAST_PACK: Ability(
      name: AbilityName.BLAST_PACK,
      description: """
        Instantly throw a Blast Pack that will stick to surfaces. 
        Reuse the ability after deployment to detonate, damaging and 
        moving anything hit. Raze isn't damaged by this ability, but 
        will still take fall damage if launched up far enough.
      """,
    ),
    AbilityName.BLAZE: Ability(
      name: AbilityName.BLAZE,
      description: """
        Equip a barrier orb. Fire places a solid wall. 
        Alternate fire rotates the targeter.
      """,
    ),
    AbilityName.BLINDSIDE: Ability(
      name: AbilityName.BLINDSIDE,
      description: """
        Equip a flame wall. Fire to create a line of flames that moves 
        forward creating a wall that blocks vision and damages players
        passing through it. Hold Fire to bend the wall in the direction 
        of your crosshair.
      """,
    ),
    AbilityName.BOOM_BOT: Ability(
      name: AbilityName.BOOM_BOT,
      description: """
        Equip a Boom Bot. Fire will deploy the bot, causing it to travel 
        in a straight line on the ground, bouncing off walls. The Boom Bot 
        will lock on to any enemies in its frontal cone and chase them, 
        exploding for heavy damage if it reaches them.
      """,
    ),
    AbilityName.CLOUDBURST: Ability(
      name: AbilityName.CLOUDBURST,
      description: """
        Instantly throw a projectile that expands into a brief vision 
        cloud on impact with a surface. Hold the ability key to curve 
        the cloud in the direction of your crosshair.
      """,
    ),
    AbilityName.COSMIC_DIVIDE: Ability(
      name: AbilityName.COSMIC_DIVIDE,
      description: """
        When Cosmic Divide is charged, use SECONDARY FIRE in Astral 
        Form to select a point, then PRIMARY FIRE to select two locations.
        An infinite Cosmic Divide connects the two points you select.
        Cosmic Divide blocks bullets and heavily dampens audio.
      """,
    ),
    AbilityName.CURVEBALL: Ability(
      name: AbilityName.CURVEBALL,
      description: """
        Equip a flare orb that takes a curving path and detonates 
        shortly after throwing. Fire to curve the flare orb to the left,
        detonating the blinding any player who sees the orb. Alternate 
        fire to curve the flare orb to the right.
      """,
    ),
    AbilityName.CYBER_CAGE: Ability(
      name: AbilityName.CYBER_CAGE,
      description: """
        Equip a cyber cage. Fire to toss the cyber cage in front of
        Cypher. Activate to create a zone that blocks vision and slows
        enemies who pass through it.
      """,
    ),
    AbilityName.DARK_COVER: Ability(
      name: AbilityName.DARK_COVER,
      description: """
        Cast out a stealthed ethereal orb that bursts into an obscuring
        sphere of shadow at its final location. Can be charged to
        increase distance.
      """,
    ),
    AbilityName.DEVOUR: Ability(
      name: AbilityName.DEVOUR,
      description: """
        Instantly consume a nearby soul orb, rapidly healing for 
        a short duration. Health gained through this skill exceeding
        100 will decay over time. If Empress is active, this skill 
        will automatically cast and not consume the Soul Orb.
      """,
    ),
    AbilityName.DIMENSIONAL_DRIFT: Ability(
      name: AbilityName.DIMENSIONAL_DRIFT,
      description: """
        Press the bound ability key to open a rift to another 
        dimension containing Yoru's Mask. Pressing 'Fire' 
        activates Dimensional Drift causing Yoru to wear the mask
        and enter another dimension.
      """,
    ),
    AbilityName.DISMISS: Ability(
      name: AbilityName.DISMISS,
      description: """
        Instantly consume a nearby Soul Orb, becoming intangible
        for a short duration. If Empress is active, also become invisible.
      """,
    ),
    AbilityName.EMPRESS: Ability(
      name: AbilityName.EMPRESS,
      description: """
        Instantly enter a frenzy, increasing firing, equip and
        reload speed dramatically. Gain infinite charges of Soul
        Harvest abilities. Scoring a kill renews the duration.
      """,
    ),
    AbilityName.FAKEOUT: Ability(
      name: AbilityName.FAKEOUT,
      description: """
        Fire key: deploys the ability, causing decoy footsteps to
        travel in the direction the player is facing, the ability
        has a lifetime of 10 seconds or until it collides with
        a surface perpendicular to its direction of movement.
      """,
    ),
    AbilityName.FAULT_LINE: Ability(
      name: AbilityName.FAULT_LINE,
      description: """
        Equip a seismic blast. Hold Fire to increase the distance. 
        Release to set off the quake, dazing all players in its 
        zone and in a line up to the zone
      """,
    ),
    AbilityName.FLASHPOINT: Ability(
      name: AbilityName.FLASHPOINT,
      description: """
        Equip a blinding charge. Fire the charge to set a fast-acting 
        burst through the wall. The charge detonates to blind all 
        players looking at it.
      """,
    ),
    AbilityName.FROM_THE_SHADOWS: Ability(
      name: AbilityName.FROM_THE_SHADOWS,
      description: """
        Equip a tactical map. Fire to begin teleporting to the selected 
        location. While teleporting, Omen will appear as a Shade that 
        can be destroyed by an enemy to cancel his teleport.
      """,
    ),
    AbilityName.GATECRASH: Ability(
      name: AbilityName.GATECRASH,
      description: """
        deploys the ability, causing a rift tether to travel in the 
        direction the player is facing, the rift tether is visible 
        and audible to players and Cypher Spycams that are close 
        enough, the ability has a lifetime of 20 seconds. Pressing 
        the bound ability key again causes Yoru to teleport to the 
        tether's location
      """,
    ),
    AbilityName.GRAVITY_WALL: Ability(
      name: AbilityName.GRAVITY_WALL,
      description: """
        ACTIVATE a Star to form a Gravity Well. Players in the area 
        are pulled toward the center before it explodes, making all 
        players still trapped inside vulnerable.
      """,
    ),
    AbilityName.GUIDING_LIGHT: Ability(
      name: AbilityName.GUIDING_LIGHT,
      description: """
        EQUIP a hawk trinket. FIRE to send it forward. HOLD FIRE to guide 
        the hawk in the direction of your crosshair. RE-USE while the hawk 
        is in flight to transform it into a flash that plays a hit confirm 
        if an enemy was within range and line of sight.
      """,
    ),
    AbilityName.HEALING_ORB: Ability(
      name: AbilityName.HEALING_ORB,
      description: """
        Equip a healing orb. Fire with your crosshairs over a damaged 
        ally to activate a heal-over-time on them. Alternate fire 
        while Sage is damaged to activate a self heal-over-time.
      """,
    ),
    AbilityName.HOT_HANDS: Ability(
      name: AbilityName.HOT_HANDS,
      description: """
        Equip a fireball. Fire to throw a fireball that explodes 
        after a set amount of time or upon hitting the ground, 
        creating a lingering fire zone that damages enemies.
      """,
    ),
    AbilityName.HUNTERS_FURY: Ability(
      name: AbilityName.HUNTERS_FURY,
      description: """
        Equip a bow with three long-range, wall-piercing energy 
        blasts. Fire to release an blast in a line in front of 
        Sova dealing damage and revealing the location of enemies 
        caught in the line. This ability can be RE-USED up to two 
        more times while the ability timer is active.
      """,
    ),
    AbilityName.INCENDIARY: Ability(
      name: AbilityName.INCENDIARY,
      description: """
        Equip an Incendiary grenade launcher. Fire to launch a 
        grenade that detonates as it comes to a rest on the floor, 
        creating a lingering fire zone that damages players within the zone.
      """,
    ),
    AbilityName.LEER: Ability(
      name: AbilityName.LEER,
      description: """
        Equip an ethereal, destructible eye. Activate to cast the 
        eye a short distance forward. The eye will Nearsight all 
        enemies who look at it.
      """,
    ),
    AbilityName.LOCKDOWN: Ability(
      name: AbilityName.LOCKDOWN,
      description: """
        EQUIP the Lockdown device. FIRE to deploy the device. 
        After a long windup, the device Detains all enemies caught 
        in the radius. This device can be destroyed by enemies.
      """,
    ),
    AbilityName.NANOSWARM: Ability(
      name: AbilityName.NANOSWARM,
      description: """
        EQUIP a Nanoswarm grenade. FIRE to throw the grenade. 
        Upon landing, the Nanoswarm goes covert. ACTIVATE the 
        Nanoswarm to deploy a damaging swarm of nanobots.
      """,
    ),
    AbilityName.NEBULA: Ability(
      name: AbilityName.NEBULA,
      description: """
        ACTIVATE a Star to transform it into a Nebula (smoke).
        USE (F) a Star to be placed in a new location after a delay.
        Dissipate briefly forms a fake Nebula at the Star's location
        before returning.
      """,
    ),
    AbilityName.NEURAL_THEFT: Ability(
      name: AbilityName.NEURAL_THEFT,
      description: """
        Instantly use on a dead enemy player in your crosshairs to 
        reveal the location of all living enemy players.
      """,
    ),
    AbilityName.NOVA_PULSE: Ability(
      name: AbilityName.NOVA_PULSE,
      description: """
        ACTIVATE a Star to detonate a Nova Pulse charges briefly then
        strikes, concussing all players in its area.
      """,
    ),
    AbilityName.ORBITAL_STRIKE: Ability(
      name: AbilityName.ORBITAL_STRIKE,
      description: """
        Equip a tactical map. Fire to launch a lingering orbital 
        strike laser at the selected location dealing high damage 
        over-time to players caught in the selected area.
      """,
    ),
    AbilityName.OWL_DRONE: Ability(
      name: AbilityName.OWL_DRONE,
      description: """
        Equip a owl drone. Fire to deploy and take control of 
        movement of the drone. While in control of the drone, 
        Fire to shoot a marking dart. This dart will reveal the 
        location of any player struck by the dart.
      """,
    ),
    AbilityName.PAINT_SHELLS: Ability(
      name: AbilityName.PAINT_SHELLS,
      description: """
        Equip a cluster grenade. Fire to throw the grenade, 
        which does damage and creates sub-munitions, each doing 
        damage to anyone in their range.
      """,
    ),
    AbilityName.PARANOIA: Ability(
      name: AbilityName.PARANOIA,
      description: """
        Instantly fire a shadow projectile forward, briefly 
        reducing the vision range of all players it touches. 
        This projectile can pass straight through walls.
      """,
    ),
    AbilityName.POISON_CLOUD: Ability(
      name: AbilityName.POISON_CLOUD,
      description: """
        Equip a gas emitter. Fire to throw the emitter that 
        perpetually remains throughout the round. Re-use the 
        ability to create a toxic gas cloud at the cost of fuel. 
        This ability can be re-used more than once and can be 
        picked up to be redeployed.
      """,
    ),
    AbilityName.RECON_BOLT: Ability(
      name: AbilityName.RECON_BOLT,
      description: """
        Fire a bolt that deploys a sonar emitter. The sonar 
        pings tag nearby enemies, causing them to be revealed. 
        Can be destroyed.
      """,
    ),
    AbilityName.REGROWTH: Ability(
      name: AbilityName.REGROWTH,
      description: """
        EQUIP a healing trinket. HOLD FIRE to channel, healing 
        allies in range and line of sight. Can be reused until 
        her healing pool is depleted. Skye cannot heal herself.
      """,
    ),
    AbilityName.RESURRECTION: Ability(
      name: AbilityName.RESURRECTION,
      description: """
        Equip a resurrection ability. Fire with your crosshairs 
        placed over a dead ally to begin resurrecting them. After 
        a brief channel, the ally will be brought back to life 
        with full health.
      """,
    ),
    AbilityName.ROLLING_THUNDER: Ability(
      name: AbilityName.ROLLING_THUNDER,
      description: """
        Equip a seismic charge. Fire to send a cascading quake 
        through all terrain in a large cone. The quake dazes and 
        knocks up anyone caught in it.
      """,
    ),
    AbilityName.RUN_IT_BACK: Ability(
      name: AbilityName.RUN_IT_BACK,
      description: """
        Instantly place a marker at Phoenix's location. While this 
        ability is active, dying or allowing the timer to expire 
        will end this ability and bring Phoenix back to this 
        location with full health.
      """,
    ),
    AbilityName.SEEKERS: Ability(
      name: AbilityName.SEEKERS,
      description: """
        EQUIP a Seeker trinket. FIRE to send out three Seekers to 
        track down the three closest enemies. If a Seeker reaches 
        its target, it nearsights them.
      """,
    ),
    AbilityName.SHOCK_BOLT: Ability(
      name: AbilityName.SHOCK_BOLT,
      description: """
        Equip a bow with shock bolt. Fire to send the explosive 
        bolt forward detonating upon collision and damaging players 
        nearby. Hold Fire to extend the range of the projectile. 
        Alternate Fire to add up to two bounces to this arrow.
      """,
    ),
    AbilityName.SHOWSTOPPER: Ability(
      name: AbilityName.SHOWSTOPPER,
      description: """
        Equip a rocket launcher. Fire shoots a rocket that does 
        massive area damage on contact with anything.
      """,
    ),
    AbilityName.SHROUDED_STEP: Ability(
      name: AbilityName.SHROUDED_STEP,
      description: """
        Equip a shadow walk ability and see its range indicator. Fire 
        to begin a brief channel, then teleport to the marked location.
      """,
    ),
    AbilityName.SKY_SMOKE: Ability(
      name: AbilityName.SKY_SMOKE,
      description: """
        Equip a tactical map. Fire to set locations where Brimstone's 
        smoke clouds will land. Alternate Fire to confirm, launching 
        long-lasting smoke clouds that block vision in the selected area.
      """,
    ),
    AbilityName.SLOW_ORB: Ability(
      name: AbilityName.SLOW_ORB,
      description: """
        Equip a slowing orb. Fire to throw a slowing orb forward 
        that detonates upon landing, creating a lingering field 
        that slows and grounds players caught inside of it.
      """,
    ),
    AbilityName.SNAKE_BITE: Ability(
      name: AbilityName.SNAKE_BITE,
      description: """
        Equip a chemical launcher. Fire to launch a canister that 
        shatters upon hitting the floor, creating a lingering 
        chemical zone that damages and slows enemies.
      """,
    ),
    AbilityName.SPYCAM: Ability(
      name: AbilityName.SPYCAM,
      description: """
        Equip a spycam. Fire to place the spycam at the targeted 
        location. REUSE this ability to take control of the 
        camera's view. While in control of the camera. Fire to shoot 
        a marking dart. This dart will reveal the location of any 
        player struck by the dart.
      """,
    ),
    AbilityName.STIM_BEACON: Ability(
      name: AbilityName.STIM_BEACON,
      description: """
        Instantly toss a stim beacon in front of Brimstone. Upon 
        landing, the stim beacon will create a field that grants 
        players RapidFire.
      """,
    ),
    AbilityName.TAILWIND: Ability(
      name: AbilityName.TAILWIND,
      description: """
        Instantly propel in the direction she is moving. If Jett
        is standing still, she will propel forward.
      """,
    ),
    AbilityName.TOXIC_SCREEN: Ability(
      name: AbilityName.TOXIC_SCREEN,
      description: """
        Equip a gas emitter launcher. Fire to deploy a long line 
        of gas emitters. Re-use the ability to create a tall wall 
        of toxic gas at the cost of fuel. This ability can be 
        re-used more than once.
      """,
    ),
    AbilityName.TRAILBLAZER: Ability(
      name: AbilityName.TRAILBLAZER,
      description: """
        EQUIP a Tasmanian tiger trinket. FIRE to send out and 
        take control of the predator. While in control, FIRE 
        to leap forward, exploding in a concussive blast and 
        damaging directly hit enemies.
      """,
    ),
    AbilityName.TRAPWIRE: Ability(
      name: AbilityName.TRAPWIRE,
      description: """
        Place a stealthed tripwire between two walls. Triggering 
        enemies are restrained and revealed for a short time. 
        If the trap is not destroyed, it activates to daze the 
        trapped victim. Can be picked up.
      """,
    ),
    AbilityName.TURRET: Ability(
      name: AbilityName.TURRET,
      description: """
        EQUIP a Turret. FIRE to deploy a turret that fires at enemies 
        in a 180 degree cone. HOLD EQUIP to recall the deployed turret.
      """,
    ),
    AbilityName.UPDRAFT: Ability(
      name: AbilityName.UPDRAFT,
      description: """
        Instantly propel Jett high into the air
      """,
    ),
    AbilityName.VIPERS_PIT: Ability(
      name: AbilityName.VIPERS_PIT,
      description: """
        Equip a chemical sprayer. Fire to spray a chemical cloud 
        in all directions around Viper, creating a large cloud 
        that reduces the vision range and maximum health of 
        players inside of it.
      """,
    ),
  };

  UnmodifiableListView<Ability> get abilities =>
      UnmodifiableListView(_abilities.values);

  List<Ability> getAgentAbilities(List<AbilityName> abilities){
    List<Ability> abs = [];
    abilities.forEach((abilityName) => abs.add(_abilities[abilityName]!));
    return abs;
  }
}
