DECLARE
    v_dob DATE := TO_DATE('1994-07-27', 'YYYY-MM-DD');  -- Date of Birth
    v_doj DATE := TO_DATE('2023-03-15', 'YYYY-MM-DD');  -- Date of Joining
    v_retirement_age NUMBER := 65;  -- Retirement Age
    v_months_remaining NUMBER;
    v_retirement_date DATE;
    v_current_month NUMBER;
    v_current_year NUMBER;
BEGIN
    
    SELECT MONTHS_BETWEEN(v_doj, v_dob) 
    INTO   v_months_remaining 
    FROM DUAL;

    -- Extracting Month and Year
    v_current_month := TO_NUMBER(TO_CHAR(v_doj, 'MM'));
    v_current_year := TO_NUMBER(TO_CHAR(v_doj, 'YYYY'));

    -- loop till remaining Months
    WHILE v_months_remaining > 0 LOOP
        -- for Month 1 to 12
        IF v_current_month = 12 THEN
            v_current_month := 1;  -- increment the year
            v_current_year := v_current_year + 1;
        ELSE
            v_current_month := v_current_month + 1;  -- Increment the month
        END IF;

        v_months_remaining := v_months_remaining - 1;
    END LOOP;

    -- Concat all to show in date format
    v_retirement_date := TO_DATE(v_current_year || '-' || LPAD(v_current_month, 2, '0') || '-' || TO_CHAR(v_doj, 'DD'), 'YYYY-MM-DD');

    -- retirement date output
    DBMS_OUTPUT.PUT_LINE('Retirement Date: ' || TO_CHAR(v_retirement_date, 'DD-MM-YYYY'));
END;
