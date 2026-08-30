

CREATE TABLE IF NOT EXISTS tb_user_profile (
                                 id UUID PRIMARY KEY,
                                 user_id UUID NOT NULL UNIQUE,
                                 name VARCHAR(100) NOT NULL,
                                 birth_date DATE NOT NULL,
                                 email VARCHAR(150) NOT NULL UNIQUE,
                                 job_title VARCHAR(50),
                                 account_status VARCHAR DEFAULT 'active',
                                 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                 CONSTRAINT fk_user_profile FOREIGN KEY (user_id) REFERENCES tb_user_credential(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS tb_user_credential (
                        id UUID PRIMARY KEY,
                        username VARCHAR(150) NOT NULL UNIQUE,
                        password_hash VARCHAR(255) NOT NULL,
                        is_active BOOLEAN DEFAULT TRUE
);

