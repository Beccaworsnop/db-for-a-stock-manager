CREATE DATABASE stock_manager;

CREATE SCHEMA component_manager;


-- Create 5 tables with UUID as primary key

CREATE TABLE component_manager.category (
    uuid UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    categoryName VARCHAR(50) NOT NULL UNIQUE -- ADD CITEXT INSTEAD OF VARCHAR ? 
);

CREATE TABLE component_manager.sub_category (
    uuid UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    subCategoryName VARCHAR(50) NOT NULL, 
    parent UUID NOT NULL,
    FOREIGN KEY (parent) REFERENCES component_manager.category(uuid)
);

CREATE TABLE component_manager.component (
    uuid UUID DEFAULT gen_random_uuid PRIMARY KEY,
    ID VARCHAR(50) GENERATED ALWAYS AS 
       (UPPER(SUBSTRING(category::text, 1, 2) || SUBSTRING(sub_category::text, 1, 2))) STORED,
    reference VARCHAR(50) NOT NULL UNIQUE,
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

CREATE TABLE component_manager.members (
    uuid UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name  VARCHAR(50) NOT NULL
);

CREATE TABLE component_manager.sub_component (
     uuid UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    --place UUID NOT NULL DEFAULT uuid('00000000-0000-0000-0000-000000000000'),
     super_uuid UUID NOT NULL,
     place UUID NOT NULL,
     note VARCHAR(500),
     CONSTRAINT super_uuid_const
     FOREIGN KEY (super_uuid)
     REFERENCES component_manager.component(uuid),
     CONSTRAINT place_const
     FOREIGN KEY (place)
     REFERENCES component_manager.members(uuid)
);
