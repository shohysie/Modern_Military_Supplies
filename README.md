/////////////////////////////////////////////////////
/////Shohy's Modern Military Store v0.993 ////////
/////////////////////////////////////////////////////


---------- Installation & Notes ----------  

This mod is **only compatible with the Enhanced Edition (EE)** series of Baldur's Gate games and cannot be used with the original SOA, TOB, or other non-EE versions.  

A merchant selling modern military equipment has been added to the following locations:  
- **BG1 & Dragonspear**: Second floor of Sorcerous Sundries in Baldur's Gate.  
- **SOA**: Trademeet.  
- **TOB**: The Oasis.  

The merchant sells modern firearms (e.g., assault rifles, sniper rifles), military supplies (e.g., bulletproof vests, tactical grenades), and advanced gear.

Firearms use a ‌unique firing system‌ and independent proficiency system‌ distinct from vanilla weapons. Detailed mechanics are explained in the following instructions.

Powerful items‌ (e.g., drones, robotic dogs) ‌will not appear in early gameplay.

Drone Usage Note‌: When operated outdoors, drones enter a high-altitude state, ‌immune to all AoE damage and ‌not prioritized by enemies‌. In indoor environments, these protections are disabled, rendering drones ‌vulnerable to destruction‌.

Players with sufficient combat strength can challenge the merchant for rare rewards.

**Install this mod after other equipment mods**, as it modifies all armor in the game.  


---------- Firearm System ----------  

1. **Weapon Effects**  
- Firearms have a chance to trigger additional effects: **extra damage, bleeding, slowing, stunning, knockback, or knockdown**. Larger calibers and higher kinetic energy generally enhance these effects.  
- **Immunities**: Non-living targets and large creatures are immune to most effects (especially from small-caliber firearms).  
- **Armor Interaction**:  
  - Pistols (high stopping power) excel against unarmored/lightly armored targets (robes, leather, etc.).  
  - Rifles (high penetration) perform better against heavily armored targets (plate armor, etc.).  
  - Creatures with natural armor (e.g., Ankhegs, Umber Hulks) are treated as heavily armored.  
- **Damage Balance**: Average damage aligns with D&D 3.5e/5e modern weapon rules.  
- **Spell Interactions**: Blocked by *Protection from Missiles*, *Protection from Magic Weapons*, etc. *Stoneskin* and *Iron Skin* can block damage and effects but may fail against high-kinetic firearms.  
*(Firearms are with the animation of crossbow as custom animations are beyond the modder's capability.)*  

2. **Ammunition & Firing Modes**  
- **Ammo Types**: Bullets, magazines, drums, belts (universal for simplicity).  
- **Firing Modes**:  
  - **Single-shot** (bullets).  
  - **Short burst** (magazine: 3–5 bullets per target).  
  - **Long burst** (drum: 1–3 bullets per target in a 45° cone).  
  - **Full-auto sweep** (belt: 90° cone).  
- **Compatibility**: Firearms have specific ammo requirements (e.g., rifles may only use single-shot). Check item descriptions for details.  

3. **Weapon Proficiency**  
- Firearms use crossbow proficiency, but existing crossbow proficiency is temporarily disabled when using firearms (may require a round to switch).  
- **Training**:  
  - Gain proficiency through combat (experience scales with firing mode: single-shot < short burst < long burst/sweep).  
  - Train with the merchant up to Master (3 slots). High Master (4 slots) and Grand Master (5 slots) require combat experience.  
  - At Master (3 slots): Gain "Automatic Weapon Proficiency I."  
  - At Grand Master (5 slots): Gain "Automatic Weapon Proficiency II" 
  - "Automatic Weapon Proficiency" increases the number of bullets that hit targets during bursts and sweeps. The specific effectiveness depends on the firearm, offering a substantial boost to high-rate-of-fire weapons that are difficult to control in full-auto mode.
- Switching back to other weapons resets crossbow proficiency (may take a round).  

4. **Attacks Per Round (APR)**  
- Base APR varies by firearm (factors include recoil, auto-fire capability, handling, etc.).  
- APR bonuses (proficiency, class perks, *Haste*, gear) apply normally.  
- **Firing Mode and APR**:  
  - Single-shot: Normal APR.  
  - Bursts/sweeps: Reduced APR due to time spent firing (player action paused).  
  - Example: A 600 RPM firearm fires a short burst (3–5 bullets) in 0.5 seconds; a long burst (5-8 bullets) in 1 second. a sweep (about 15 bullets) in 1.67 seconds.  
  -Firearms with a rate of fire below 600 RPM require more time for burst fire and sustained fire, while weapons exceeding 600 RPM maintain their firing duration but deliver more bullets per target (certain exceptions apply for specific firearms, as noted in their item descriptions).

5. **Malfunctions**  
- Firearms may jam (indicated by an overhead alert).  
  - Minor jams: Fix manually (1 round).  
  - Severe jams: Repair at the merchant.  
- Characters automatically switch to backup weapons if a firearm breaks.  

6. **Close Combat Compensation**  
- Pistols, SMGs, shotguns, and PDWs negate the usual ranged penalty (-8 attack, -4 AC) when enemies are within 4 feet.  
- The specific compensation mechanism works as follows: When enemies enter within 4 feet of a firearm-wielding player, sidearm users receive combat compensation of +10 hit advantage and +4 defense bonus. However, distance checks occur once per second and may not update in real-time.


---------- Version History ----------  

**v0.993**

- French version Available.
- Removed the setting where firearms might uncontrollably hit other targets (e.g., teammates) during burst or full-auto fire.
- For repairs, the character being spoken to must now carry the item needing repair, with a dialogue reminder added.
- Fixed the issue where firearms could not correctly trigger different effect probabilities based on armor types.
- Firearm effects are now strictly configured according to the described values.
- Increased the effective range of machine gun sustained bursts and full-auto fire (approximately 1.5 times the visual range)—beware of stray bullets hitting distant creatures; SMG range remains at visual range.
- Fixed the issue where the Ultimax 100 could not be used one-handed.
- Fixed the issue where merchants did not sell gloves.
- Reduced some useless item files.
- While driving a tank, immunity to toxins, diseases, and attribute drain is granted, with a +5 bonus to saving throws.
- Fixed the issue where characters continued to have a crushing effect on nearby creatures for a short time after exiting the tank.
- Fixed enchantment errors for Dum-dum Cartridges and Silver Bullets.
- Pepper Spray can now cause enemies to fall down and thrash on the ground.
- Fixed issues where Flying Grenades and Hover Turrets were vulnerable to area-of-effect spell damage and unable to fly over obstacles.
- Fixed the action of Hover Turrets.
- Bulletproof Vests and Ballistic Shields now have a chance to block shrapnel from Sniper Grenades.
- Fixed an issue where certain Helmets failed to protect against Critical Hits.
- Fixed minor descriptions in the English version where "round" and "turn" were sometimes confused.

**v0.992**

- Targets knocked down by firearms will not immediately stand up if hit again.
- Grenades now display their attack range (requires enabling spell range display in game settings).
- Flamethrower effective angle increased to 30°.
- Fixed the issue where stun grenades could not cause unconsciousness.
- Fixed the issue where tear gas causing spell failure was a permanent effect.
- Increased the attack frequency of the Hover Turret, which now prioritize attacking over moving closer to their owner.
- Significantly reduced the experience required for firearm proficiency upgrades.
- Fixed the issue where some potions had no effect.
- Fixed the issue where the tank could be used unlimited times.
- Fixed the issue where damaged Flying Grenades, if they did not self-destruct, would remain a field of view.

**v0.991**

- Fixed the issue of fireball animation appearing under the character's feet during firing.
- Fixed the issue where merchants in the Nashkel Mines do not send gifts when installing on EET.

**v0.99** 

- Fixed a problem where drones and some guns can not be repaired correctly.
- Fixed a problem where some guns work well with stone bullets.
- Fixed a problem where some guns disappear on breaking down.
- Stone Skin protects against all damage and effects from low kinetic energy ammunition, as well as damage and the majority of effects from high kinetic energy ammunition (though remains vulnerable to effects such as knockback).

**v0.98** 

- Fixed a problem where the extra shot during bursts and sweeps that grows with improvement of "Automatic Weapon Proficiency" sometimes does not take effect.

**v0.97** 

- Fixed an issue where attaching a bayonet to firearms caused them to disappear.
- Fixed an issue with firearm special effects (e.g., knockdown) triggering incorrectly.
- Fixed an issue where firearms had no special effect against certain types of armor.
- Adjusted Firearm Critical Hits: Critical hits now always deal extra damage and knock down the enemy. The specific effect also varies based on the bullet's kinetic energy (some creatures are immune to these effects).
- Fixed an issue preventing firearm proficiency from increasing through combat experience.
- Fixed an issue where the QLU-11 did not display its compatible ammunition type.
- Fixed an issue related to firearm durability/jamming. Characters will now automatically switch to a backup weapon and continue attacking if their firearm becomes unusable (prioritizing ranged weapons).
- Fixed an issue where the firearm training cost displayed as 100 gold but actually charged 1000 gold.
- Fixed an issue where tanks could be killed by base stats drain effects.

**v0.96**  
- Fixed an issue where tank AI installation reports errors.
- Fixed an issue where drone animations might not appear.
- Fixed an issue where drones could still be affected by ground-based area attacks while in high-altitude states.
- Added obstacle-leaping functionality to drones (outdoor only).

**v0.95**  
- English Version Available.
- Minor bug fixes.  

**v0.94**  
- Fixed "ammo mismatch" message for sniper grenades.  
- Fixed minor firearm repair issues.  
- Fixed an issue where tanks failed to execute close-quarters ramming attacks.
- While mounted in a tank, operators gain immunity to Backstab, Level Drain, Dragon Wings, Web, and similar status effects.
- Certain overpowered equipments have been removed from initial shop and will be added into shop at SOD, SOA and TOB gradually.

**v0.93**  
- Fixed EET installation errors.  
- Merchant now appears in Nashkel Mines (BGEE/EET) with starter benefits.  
- Fixed landmine visibility and flashlight/shield bugs.  

**v0.92**  
- Added merchant challenge (reward: tank). Recommended for mid/late-game.  

**v0.91**  
- Minor bug fixes.  

**v0.9**  
- Reworking of item graphics again and again and again (EE supports larger assets).  
- Removed non-firearm items (e.g., melee weapons).  
- Added drones and robotic dogs.  
- Rebalanced firing mechanics for realism.  

**v0.5**  
- Reworking of item graphics again and again
- Adjusted burst/sweep mechanics (APR capped at 1 during sweeps).  
- Added caliber-based damage scaling.  

**v0.4**  
- Reworking of item graphics again
- Reduced firearm damage and APR (capped at 5 APR).  
- Added scoped rifle accuracy bonuses.  
- Removed chainsaw (unrealistic).  

**v0.3**  
- Reworking of item graphics
- Introduced armor-specific effect triggers.  
- Shotguns can "lockpick" doors (via item ability).  

**v0.2**  
- EE compatibility patch (thanks to c4_angel!).  

**v0.1**  
- Initial release for BG2/BGT.  