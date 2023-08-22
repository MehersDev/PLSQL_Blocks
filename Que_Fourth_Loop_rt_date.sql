DECLARE
    dob DATE := TO_DATE('1989-11-16', 'YYYY-MM-DD');  -- Date of Birth
    doj DATE := TO_DATE('2023-03-15', 'YYYY-MM-DD');  -- Date of Joining
    retirement_age NUMBER := 65;  -- Retirement Age
    months_remaining NUMBER;
    retirement_date DATE;
    current_month NUMBER;
    current_year NUMBER;
BEGIN
    -- Calculate the total number of months between the birthdate and joining date
    SELECT MONTHS_BETWEEN(doj, dob) INTO months_remaining FROM DUAL;

    -- Calculate the current month and year
    current_month := TO_NUMBER(TO_CHAR(doj, 'MM'));
    current_year := TO_NUMBER(TO_CHAR(doj, 'YYYY'));

    -- Iterate through the months until retirement age is reached
    WHILE months_remaining > 0 LOOP
        -- Calculate the retirement month and year for each iteration
        IF current_month = 12 THEN
            current_month := 1;  -- Cycle to January and increment the year
            current_year := current_year + 1;
        ELSE
            current_month := current_month + 1;  -- Increment the month
        END IF;

        months_remaining := months_remaining - 1;
    END LOOP;

    -- Calculate the retirement date
    retirement_date := TO_DATE(current_year || '-' || LPAD(current_month, 2, '0') || '-' || TO_CHAR(doj, 'DD'), 'YYYY-MM-DD');

    -- Print the retirement date
    DBMS_OUTPUT.PUT_LINE('Retirement Date: ' || TO_CHAR(retirement_date, 'DD-MM-YYYY'));
END;
/
