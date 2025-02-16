CREATE VIEW component_manager.category_sub_category_view AS
SELECT 
    c.uuid AS category_uuid,
    c.category_name,
    sc.uuid AS sub_category_uuid,
    sc.sub_category_name
FROM 
    component_manager.category c
JOIN 
    component_manager.sub_category sc
ON 
    c.uuid = sc.parent;

CREATE VIEW component_manager.component_category_view AS
SELECT 
    comp.uuid AS component_uuid,
    comp.reference,
    comp.quantity,
    comp.date_checked,
    cat.uuid AS category_uuid,
    cat.category_name
FROM 
    component_manager.component comp
JOIN 
    component_manager.category cat
ON 
    comp.category = cat.uuid;

CREATE VIEW component_manager.component_sub_category_view AS
SELECT 
    comp.uuid AS component_uuid,
    comp.reference,
    comp.quantity,
    comp.date_checked,
    sc.uuid AS sub_category_uuid,
    sc.sub_category_name
FROM 
    component_manager.component comp
JOIN 
    component_manager.sub_category sc
ON 
    comp.sub_category = sc.uuid;

CREATE VIEW component_manager.sub_component_component_view AS
SELECT 
    sc.uuid AS sub_component_uuid,
    sc.note,
    comp.uuid AS component_uuid,
    comp.reference
FROM 
    component_manager.sub_component sc
JOIN 
    component_manager.component comp
ON 
    sc.super_uuid = comp.uuid;

CREATE VIEW component_manager.sub_component_component_members_view AS
SELECT 
    sc.uuid AS sub_component_uuid,
    sc.place AS member_uuid,  
    sc.note,
    comp.uuid AS component_uuid,
    comp.reference,
    m.uuid AS member_uuid,
    m.first_name,
    m.last_name
FROM 
    component_manager.sub_component sc
JOIN 
    component_manager.component comp
ON 
    sc.super_uuid = comp.uuid
JOIN 
    component_manager.members m
ON 
    sc.place = m.uuid;

