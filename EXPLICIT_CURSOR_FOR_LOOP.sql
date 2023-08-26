-- please login into hr user
/* Simple Explicit cursors using for loop gives all the employee id and FirstName */

DECLARE
  CURSOR c1 IS SELECT e.employee_id,e.first_name  FROM employees e
               ORDER BY e.employee_id;
  v_emp_id NUMBER(10);
  v_f_name VARCHAR2(20);
BEGIN
  FOR i IN c1
  LOOP
    dbms_output.put_line('Employee ID is >> '||i.employee_id);
    dbms_output.put_line('Employee Name is >> '||i.first_name);
    dbms_output.put_line('***********************************');
  END LOOP;
  
END;
      
-- Cursor using simple loop

DECLARE
  CURSOR c1 IS SELECT e.employee_id,e.first_name  FROM employees e
               ORDER BY e.employee_id;
  v_emp_id NUMBER(10);
  v_enp_name VARCHAR2(20);
  
BEGIN
  OPEN c1;
  LOOP
    FETCH c1 INTO v_emp_id,v_enp_name;
    dbms_output.put_line('Employee ID is >> '||v_emp_id);
    dbms_output.put_line('Employee Name is >> '||v_enp_name);
    dbms_output.put_line('***********************************');
    EXIT WHEN c1%NOTFOUND;
  END LOOP;
  CLOSE c1;
END;
