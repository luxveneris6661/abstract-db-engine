# Layer 0 - Abstract Database Engine

Layer 0 represents the **core logical tables** of the abstract engine.
It is the foundation of all scoring, queries, and reasoning modules.

For testing and reasoning, we model **in-game entities** inspired by Dungeons and Dragons.
This makes it easier to visualize and validate the system.

## Tables

1. **Characters** - track characters in the game

- id: INT AUTO_INCREMENT PRIMARY KEY
- name: VARCHAR(100) NOT NULL
- race: VARCHAR(50) NOT NULL (e.g. "Tiefling", "Elf", "Human")
- class: VARCHAR(50) NOT NULL (e.g. "Druid", "Rogue", "Bard")
- level: INT NOT NULL DEFAULT 1 
- hp: INT NOT NULL DEFAULT 100 
- mp: INT NOT NULL DEFAULT 0 
- created_at: TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP

2. **AbilityScores** - the standard six D&D ability scores

- id: INT AUTO_INCREMENT PRIMARY KEY
- character_id: INT NOT NULL, FOREIGN KEY -> Characters(id)
- strength: INT NOT NULL DEFAULT 10
- dexterity: INT NOT NULL DEFAULT 10
- constitution: INT NOT NULL DEFAULT 10
- intelligence: INT NOT NULL DEFAULT 10
- wisdom: INT NOT NULL DEFAULT 10
- charisma: INT NOT NULL DEFAULT 10
- created_at: TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP

3. **Abilities** - spells, feats, or special actions

- id: INT AUTO_INCREMENT PRIMARY KEY
- name: VARCHAR(100) NOT NULL (e.g "Fireball")
- description: TEXT NOT NULL
- min_level: INT NOT NULL DEFAULT 1 
- class_required: VARCHAR(50) (e.g. "Wizard", "Paladin"; NULL = usable by all)
- is_active: BOOLEAN NOT NULL DEFAULT 1

4. **Equipment** - items characters can carry/use

- id: INT AUTO_INCREMENT PRIMARY KEY
- character_id: INT NOT NULL, FOREIGN KEY -> Characters(id)
- name: VARCHAR(100) NOT NULL (e.g. "Bag of Holding", "Claymore")
- type: VARCHAR(50) NOT NULL (e.g. "Weapon", "Armor", "Consumable")
- quantity: INT NOT NULL DEFAULT 1
- created_at: TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP

5. **Conditions** - status effects or conditions
- id: INT AUTO_INCREMENT PRIMARY KEY
- character_id: INT NOT NULL, FOREIGN KEY -> Characters (id)
- name: VARCHAR(50) NOT NULL (e.g. "Poisoned", "Blessed", "Frightened")
- duration_rounds: INT NOT NULL DEFAULT - is_active: BOOLEAN NOT NULL DEFAULT 1 