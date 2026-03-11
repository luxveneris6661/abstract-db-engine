-- Layer 0 Schema: AbilityScores (Normalized Design)
-- Each row = one character's score for one ability type
-- Depends on: Characters table (00_characters.sql)

CREATE TABLE AbilityScores (
    -- Surrogate key (kept for consistency)
    id INT AUTO_INCREMENT PRIMARY KEY,

    -- Natural key components (real-world identity)
    character_id INT NOT NULL,
    ability_type VARCHAR(20) NOT NULL,  -- 'strength', 'dexterity', etc.

    -- The actual score value
    score INT NOT NULL DEFAULT 10,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Enforce the natural key uniqueness
    CONSTRAINT uc_character_ability UNIQUE (character_id, ability_type),

    -- Foreign key to Characters table
    CONSTRAINT fk_ability_scores_character 
        FOREIGN KEY (character_id) 
        REFERENCES Characters(id)
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- Optional: Create index for faster lookups by character
CREATE INDEX idx_ability_scores_character ON AbilityScores(character_id);