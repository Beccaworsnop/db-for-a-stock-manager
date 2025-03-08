CREATE DATABASE stock_manager;

CREATE SCHEMA component_manager;

CREATE EXTENSION IF NOT EXISTS CITEXT;

CREATE TABLE component_manager.category (
    uuid UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    category_name CITEXT NOT NULL UNIQUE
);

CREATE TABLE component_manager.sub_category (
    uuid UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    sub_category_name CITEXT NOT NULL,
    parent UUID NOT NULL,
    FOREIGN KEY (parent) REFERENCES component_manager.category(uuid)
);

CREATE TABLE component_manager.component (
    uuid UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    ID TEXT GENERATED ALWAYS AS 
       (UPPER(SUBSTRING(category::text, 1, 2) || SUBSTRING(sub_category::text, 1, 2))) STORED,
    reference CITEXT NOT NULL UNIQUE,
    quantity INT CHECK (quantity >= 0) NOT NULL,
    date_checked DATE,
    category UUID NOT NULL,
    sub_category UUID NOT NULL,
    CONSTRAINT category_const
        FOREIGN KEY (category)
        REFERENCES component_manager.category(uuid),
    CONSTRAINT sub_category_const
        FOREIGN KEY (sub_category)
        REFERENCES component_manager.sub_category(uuid)
);

CREATE TABLE component_manager.sub_component (
    uuid UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    super_uuid UUID NOT NULL,
    place CITEXT NOT NULL, 
    note CITEXT,
    CONSTRAINT super_uuid_const
        FOREIGN KEY (super_uuid)
        REFERENCES component_manager.component(uuid)
);


