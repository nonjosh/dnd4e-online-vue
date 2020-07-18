CREATE TABLE actions (
	id SERIAL PRIMARY KEY,
	created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    source TEXT,
    target TEXT,
    hp_change INT
);

CREATE TABLE pc (
	id SERIAL PRIMARY KEY,
	created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    pc_name VARCHAR,
    pc_save_path VARCHAR,
    pc_lv INT,
    pc_exp INT,
    pc_hp INT,
    pc_init INT,
    pc_ac INT,
    pc_fort INT,
    pc_ref INT,
    pc_will INT,
    status INT DEFAULT 1
);

CREATE TABLE campaigns (
	id SERIAL PRIMARY KEY,
	created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    name VARCHAR,
    url VARCHAR,
    status INT DEFAULT 1
);

CREATE TABLE campaigns_pc (
	id SERIAL PRIMARY KEY,
	created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    pc_id INT
);