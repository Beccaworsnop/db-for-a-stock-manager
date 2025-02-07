INSERT INTO members(uuid, first_name) VALUES(uuid('00000000-0000-0000-0000-000000000000'), 'companyname');

CREATE OR REPLACE FUNCTION component_manager.issouCrush(ref CITEXT)
RETURNS CITEXT
LANGUAGE plpgsql
as
$$ 
declare
    indexCount INT;
BEGIN

    SELECT position(' ' IN ref)
    INTO indexCount;
    IF indexCount = 0 THEN
        RETURN UPPER(SUBSTRING(ref, 1, 2));
    ELSE
        RETURN UPPER((SUBSTRING(ref, 1, 1) || SUBSTRING(ref, indexCount+1, 1)));
    END IF;
END;
$$;


-- Test views 
SELECT * FROM component_manager.component_category_view;

SELECT * FROM component_manager.component_sub_category_view;

SELECT * FROM component_manager.sub_component_component_view;

SELECT * FROM component_manager.sub_component_component_members_view;

