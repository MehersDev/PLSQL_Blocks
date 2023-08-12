-- This plsql block finds out a word between two spaces

DECLARE
   v_input_string VARCHAR2(100) := 'National Institute of Science and Technology test';
   v_target_word  VARCHAR2(100);
   v_ascii_val    NUMBER(10);
   v_spc_count    NUMBER(10);
   v_loop_fst     NUMBER(10);
   v_loop_sec     NUMBER(10);
   v_str_string   NUMBER(10);
   v_end_string   NUMBER(10);
BEGIN
   v_spc_count := 0;
   v_str_string:=&start_string;
   v_end_string:=&end_string;
   
   FOR n IN 1..LENGTH(v_input_string) 
     LOOP
       
     IF v_spc_count =  0
       THEN
          v_loop_fst:=1;
     END IF;
     
      IF ASCII(SUBSTR(v_input_string, n, 1)) = 32 
        THEN
         v_spc_count := v_spc_count + 1;
           IF v_spc_count = v_str_string
             THEN
               v_loop_fst := INSTR(v_input_string,' ',1,v_spc_count);
           ELSIF v_spc_count = v_end_string
             THEN
               v_loop_sec := INSTR(v_input_string,' ',1,v_spc_count);
           ELSIF v_end_string > v_spc_count
             THEN
               v_loop_sec := LENGTH(v_input_string);
           END IF;
       END IF;
       
      END LOOP;
  
  FOR i IN v_loop_fst..v_loop_sec 
     LOOP
      
      v_ascii_val := ASCII(SUBSTR(v_input_string, i, 1));
      
      IF v_ascii_val = 32 AND v_target_word IS NOT NULL THEN
         EXIT;
      END IF;
      
      v_target_word := v_target_word || CHR(v_ascii_val);
     END LOOP;
   
   DBMS_OUTPUT.PUT_LINE('Word To Show >> ' || TRIM(v_target_word));
END;
