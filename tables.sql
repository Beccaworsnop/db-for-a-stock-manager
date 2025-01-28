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

