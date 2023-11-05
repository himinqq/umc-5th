-- Active: 1699194567597@@127.0.0.1@3306@umc
CREATE TABLE member(
    id BIGINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(20),
    gender VARCHAR(10),
    age INT,
    address VARCHAR(40),
    status VARCHAR(15),
    inactivate_date DATETIME,
    created_at DATETIME(6),
    updated_at DATETIME(6),
    point INT,
    PRIMARY KEY (id)
);

CREATE TABLE mission(
    id BIGINT NOT NULL,
    store_id BIGINT,
    reward INT,
    deadline DATETIME,
    mission_spec TEXT,
    created_at DATETIME(6),
    updated_at DATETIME(6),
    PRIMARY KEY (id)
);

CREATE TABLE review(
    id BIGINT NOT NULL ,
    member_id BIGINT,
    store_id BIGINT,
    score FLOAT,
    body TEXT,
    PRIMARY KEY (id),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (store_id) REFERENCES store(id)
);

CREATE TABLE store(
    id BIGINT,
    region_id BIGINT,
    name VARCHAR(50),
    address VARCHAR(50),
    score FLOAT,
    created_at DATETIME(6),
    updated_at DATETIME(6),
    PRIMARY KEY (id),
    FOREIGN KEY (region_id) REFERENCES region(id)
);

CREATE TABLE member_mission(
    id BIGINT,
    member_id BIGINT,
    mission_id BIGINT,
    status VARCHAR(50),
    created_at DATETIME(6),
    updated_at DATETIME(6),
    PRIMARY KEY (id),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (mission_id) REFERENCES mission(id)
);

CREATE TABLE region(
    id BIGINT,
    name VARCHAR(50),
    created_at DATETIME(6),
    updated_at DATETIME(6),
    PRIMARY KEY (id)
);

CREATE TABLE member_prefer(
    id BIGINT,
    member_id BIGINT,
    category_id BIGINT,
    created_at DATETIME(6),
    updated_at DATETIME(6),
    PRIMARY KEY (id),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (category_id) REFERENCES food_category(id)
);

CREATE TABLE food_category(
    id BIGINT,
    name VARCHAR(50),
    PRIMARY KEY (id)
);