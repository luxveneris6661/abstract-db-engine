-- Layer 0 Schema: Characters
-- Core character identity and base stats

CREATE TABLE Characters (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    race VARCHAR(50) NOT NULL,      -- e.g., "Elf", "Dwarf", "Human"
    class VARCHAR(50) NOT NULL,      -- e.g., "Fighter", "Wizard", "Rogue"
    level INT NOT NULL DEFAULT 1,
    hp INT NOT NULL DEFAULT 10,
    mp INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;