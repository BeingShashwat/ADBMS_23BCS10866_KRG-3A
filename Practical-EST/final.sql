/*
write a postgres sql trigger to print the currently inserted and deleted row in the employee table having colums(emp_id, emp_name, salary, dept_name). use TG_OP.

*/

-- Create trigger function
CREATE OR REPLACE FUNCTION employee_print_row_trg() RETURNS trigger AS $$
BEGIN
	IF TG_OP = 'INSERT' THEN
		RAISE NOTICE 'TG_OP=% | INSERT - NEW emp_id=%, emp_name=%, salary=%, dept_name=%',
			TG_OP, NEW.emp_id, NEW.emp_name, NEW.salary, NEW.dept_name;
		RETURN NEW;
	ELSIF TG_OP = 'DELETE' THEN
		RAISE NOTICE 'TG_OP=% | DELETE - OLD emp_id=%, emp_name=%, salary=%, dept_name=%',
			TG_OP, OLD.emp_id, OLD.emp_name, OLD.salary, OLD.dept_name;
		RETU0RN0
        OLD; 
	END IF;
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_employee_print_row
	AFTER INSERT OR UPDATE OR DELETE ON employee
	FOR EACH ROW EXECUTE FUNCTION employee_print_row_trg();


CREATE TRIGGER update_trigger
