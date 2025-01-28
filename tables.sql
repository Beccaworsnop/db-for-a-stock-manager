CREATE DATABASE stock_manager

CREATE SCHEMA component_manager;

--creat 5 tables with uuid as primary key

CREATE TABLE component_manager.category (
    uuid UUID PRIMARY KEY,
    categoryName VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE component_manager.sub_category (
    uuid UUID PRIMARY KEY,
    categoryName VARCHAR(50) NOT NULL, 
     parent UUID NOT NULL,
    FOREIGN KEY (parent) REFERENCES component_manager.category(uuid)
);

CREATE TABLE component_manager.component(
    uuid UUID PRIMARY KEY,
    id VARCHAR(50) GENERATED ALWAYS AS (UPPER(SUBSTRING(category, 1, 2) || SUBSTRING(sub_category, 1, 2))) STORED,
    reference VARCHAR(50) NOT NULL UNIQUE,
    quantity INT CHECK (quantity >= 0) NOT NULL
    date_checked DATE,
    category VARCHAR(50) NOT NULL,
    sub_category VARCHAR(50) NOT NULL,
    --contraint 
    FOREIGN KEY (category)
    REFERENCES component_manager.category(categoryName),
    --constraint AGAIN 
     FOREIGN KEY(sub_category)
     REFERENCES component_manager.sub_category(categoryName)
);

CREATE TABLE members(
    uuid UUID PRIMARY KEY,             
    first_name VARCHAR(50) NOT NULL,
    last_name  VARCHAR(50) NOT NULL,
);

CREATE TABLE component_manager.sub_component(
     uuid UUID PRIMARY KEY,
     super_uuid UUID NOT NULL,
     place UUID NOT NULL,
     note VARCHAR(500) ,
     --constraint
     FOREIGN KEY(super_uuid)
     REFERENCES component_manager.component(uuid),
     --CONSTRAINT place_const
     FOREIGN KEY (place)
     REFERENCES members(uuid)
);
