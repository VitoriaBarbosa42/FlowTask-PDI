CREATE TABLE IF NOT EXISTS tb_user_profile (
                                 id UUID PRIMARY KEY,
                                 name VARCHAR(100) NOT NULL,
                                 birth_date DATE NOT NULL,
                                 email VARCHAR(150) NOT NULL UNIQUE,
                                 job_title VARCHAR(50),
                                 account_status VARCHAR(20) DEFAULT 'ACTIVE',
                                 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);