CREATE ROLE student PASSWORD 'password';

GRANT SELECT, UPDATE, INSERT, DELETE, USAGE ON ALL TABLE IN SCHEMA component_manager TO student;

REVOKE CONNECT ON DATABASE companyname FROM PUBLIC;

GRANT CONNECT ON DATABASE company TO client;

REVOKE ALL ON SCHEMA component_manager FROM PUBLIC;

GRANT USAGE ON SCHEMA component_manager TO student;

REVOKE ALL ON safe_to_see_component FROM PUBLIC;

GRANT SELECT ON safe_to_see_component TO student;

REVOKE ALL ON ALL TABLES IN SCHEMA component_manager FROM PUBLIC;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA component_manager TO client;

ALTER ROLE client WITH LOGIN;