CREATE OR REPLACE PROCEDURE INSERT_RENTAL_CLOSE (
    rental_id IN NUMBER,
    return_date IN DATE
)
IS
    rental_amount NUMBER;
BEGIN
    -- To insert the date of returning in the transction
    UPDATE RENTAL
    SET R_END_DATE = return_date
    WHERE R_ID = rental_id;
    
    -- find the amount of payment depending on the days the movie were taken
    SELECT R_RENT * (return_date - R_START_DATE)
    INTO rental_amount
    FROM RENTAL
    WHERE R_ID = rental_id;


    UPDATE RENTAL
    SET R_RENT = rental_amount
    WHERE R_ID = rental_id;

    COMMIT;
    
    -- Show the amount for the transaction
    DBMS_OUTPUT.PUT_LINE('Rental amount: ' || rental_amount);

--Exception if the rental id is not found
EXCEPTION
    WHEN OTHERS THEN
    	DBMS_OUTPUT.PUT_LINE('No Rental found with the ID given');
END;

