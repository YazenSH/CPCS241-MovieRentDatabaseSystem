CREATE OR REPLACE PROCEDURE add_Customer
(
    name IN VARCHAR2,
    type IN VARCHAR2,
    nat_ID IN VARCHAR2
)
AS
    c_id NUMBER;

--Query to see if customer is already registerd or not, depending on his National ID 
BEGIN 
    SELECT C_ID INTO c_id
    FROM CUSTOMERS
    WHERE nat_ID = C_nat_ID;

--This exception will add the user only if he isn't registerd    
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN 
            INSERT INTO Customers 
               values (C_ID_seq.NEXTVAL, name, type, nat_ID); 
		    COMMIT;
END;
