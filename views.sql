CREATE VIEW safe_to_see_component AS SELECT ID, reference, quantity, date_checked, category, sub_category FROM component_manager.component;

CREATE VIEW safe_to_see_sub_component_only AS SELECT super_uuid, (SELECT first_name FROM members WHERE members.uuid = component_manager.sub_component) AS place, note FROM component_manager.sub_component; --missing from-clause entry for table "component_manager"

CREATE VIEW safe_to_see_sub_component AS SELECT * FROM safe_to_see_component JOIN safe_to_see_sub_component_only ON safe_to_see_component.uuid = safe_to_see_sub_component_only.super_uuid; --relation safe to see component add tmrw