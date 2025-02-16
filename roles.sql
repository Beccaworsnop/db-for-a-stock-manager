CREATE ROLE user WITH LOGIN PASSWORD 'password!';
CREATE ROLE student WITH LOGIN PASSWORD 'password';

REVOKE ALL ON DATABASE stock_manager FROM student;
GRANT CONNECT ON DATABASE stock_manager TO student;

GRANT USAGE ON SCHEMA component_manager TO user;
GRANT USAGE ON SCHEMA component_manager TO student;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA component_manager TO student;

GRANT SELECT ON safe_to_see_component TO user;

CREATE ROLE stock_manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA component_manager TO stock_manager;
GRANT USAGE ON SCHEMA component_manager TO stock_manager;

ALTER TABLE safe_to_see_component ENABLE ROW LEVEL SECURITY;
CREATE POLICY student_policy ON safe_to_see_component
FOR SELECT TO student
USING (true); 
