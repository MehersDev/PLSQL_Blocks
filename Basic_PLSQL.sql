-- creating table
CREATE TABLE plotbooking(plotid        NUMBER(10)
                        ,plotno        VARCHAR2(20)
                        ,propertyname  VARCHAR2(20)
                        ,customername  VARCHAR2(20)
                        ,bcost         NUMBER(10)
                        ,ocost         NUMBER(10)
                        ,acost         NUMBER(10)
                        ,fcost         NUMBER(10)
                        );
                        
-- writing a first pl/sql block                    
DECLARE 
  v_plotid        plotbooking.plotid%TYPE;
  v_plotno        plotbooking.plotno%TYPE;
  v_propertyname  plotbooking.propertyname%TYPE;
  v_customername  plotbooking.customername%TYPE;
  v_bcost         plotbooking.bcost%TYPE;
BEGIN
  SELECT MAX(plotid)+1
  INTO   v_plotid
  FROM   plotbooking
  ;
  
  IF v_plotid IS NULL
    THEN
      v_plotid := 1;
  END IF;
  
  v_plotno := 'P'||v_plotid;
  
  v_propertyname := 'Mahalaxmi Real';
  v_customername := 'devayani';
  v_bcost        :=  10000000;
                     
  INSERT INTO  plotbooking(plotid                           
                          ,plotno      
                          ,propertyname
                          ,customername
                          ,bcost       
                          )
  VALUES                  (v_plotid       
                          ,v_plotno       
                          ,v_propertyname 
                          ,v_customername 
                          ,v_bcost
                          );
  COMMIT;
  dbms_output.put_line('updates sucessfully');
EXCEPTION
  WHEN OTHERS
    THEN
      dbms_output.put_line('error in plsql block'||SQLERRM);
END;
      
-- end of block

SELECT * FROM tabs;
