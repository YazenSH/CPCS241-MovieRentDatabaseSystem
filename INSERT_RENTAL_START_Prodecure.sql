CREATE OR REPLACE PROCEDURE INSERT_RENTAL_START ( 
	movie_name IN varchar, 
    customer_name IN varchar, 
    start_date IN date, 
    end_date IN date
     
) 
IS 
    rent number;
    counter NUMBER; 
    Moive_ID number; 
    Customer_ID number; 
BEGIN 
    -- Get the video ID for the given movie name 
    SELECT V_ID INTO Moive_ID 
    FROM VIDEOS 
    WHERE V_NAME = movie_name; 
     
    -- Get the customer ID for the given customer name 
    SELECT C_ID INTO Customer_ID 
    FROM CUSTOMERS 
    WHERE C_NAME = customer_name; 
	
	-- Get the rental price for the given movie  
    SELECT VCOP_RENT INTO rent 
    FROM VIDEO_COPIES 
    WHERE Moive_ID = VCOP_ID AND ROWNUM = 1; 

	-- Check if there is an existing rental transaction for the same customer, movie, and start date 
    SELECT COUNT(*) INTO counter 
    FROM RENTAL 
    WHERE  Moive_ID = rental.V_ID  
    AND  Customer_ID = rental.C_ID  
    ; 
     
    IF counter > 0 THEN 
        -- print if the rental transaction already exists
         dbms_output.put_line('Rental transaction already exists.'); 
    ELSE 
        -- Insert the rental transaction 
        INSERT INTO RENTAL VALUES (R_ID_seq.NEXTVAL, Moive_ID, Customer_ID, start_date, end_date, rent); 
 
        COMMIT; 
    END IF; 
EXCEPTION 
    WHEN OTHERS THEN 
	dbms_output.put_line('Exception happend'); 
END;

---- if we used system date it will dublicate the rental beacause I think it conseder the seconds and minutes
---- if we want to solve it we can delete the third condition in the counting query and then use sysdate fwhen inserting