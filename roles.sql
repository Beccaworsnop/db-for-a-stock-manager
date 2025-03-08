CREATE ROLE user WITH LOGIN PASSWORD 'password!';
CREATE ROLE student WITH LOGIN PASSWORD 'password';
CREATE ROLE stock_manager;

REVOKE ALL ON DATABASE stock_manager FROM student;
GRANT CONNECT ON DATABASE stock_manager TO student;

GRANT USAGE ON SCHEMA component_manager TO user;
GRANT USAGE ON SCHEMA component_manager TO student;
GRANT USAGE ON SCHEMA component_manager TO stock_manager;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA component_manager TO student;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA component_manager TO stock_manager;

GRANT SELECT ON ALL TABLES IN SCHEMA component_manager TO user;

ALTER TABLE component_manager.component ENABLE ROW LEVEL SECURITY;


CREATE POLICY student_policy ON component_manager.component
FOR SELECT TO student
USING (true);
