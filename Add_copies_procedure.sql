CREATE OR REPLACE PROCEDURE add_video_copies
(
    video_name IN VARCHAR2,
    currentCat IN VARCHAR2,
    num_of_copies IN NUMBER,
    rent IN NUMBER
)

AS
    newID NUMBER; --Holds movie ID
    CatID NUMBER; --Holds Catagory ID

--Query to find catagory ID throgh catagory name
BEGIN
    SELECT VCAT_ID INTO CatID 
    FROM VIDEOS_CATAGORY 
    WHERE currentCat = VCAT_NAME; 

--Query to find movie ID throgh moive name
    BEGIN 
        SELECT V_ID INTO newID 
        FROM VIDEOS 
        WHERE V_NAME = video_name  AND ROWNUM = 1;
 --Exception, If movie is not there it will insert it.
     EXCEPTION 
        WHEN NO_DATA_FOUND THEN 
            INSERT INTO VIDEOS 
                VALUES (V_ID_seq.NEXTVAL, video_name, NULL, CatID) 
                RETURNING V_ID INTO newID;
    END;
-- This loop is to add copies to table

    FOR i IN 1..num_of_copies LOOP 
        INSERT INTO VIDEO_COPIES  
            VALUES (VCOP_ID_seq.NEXTVAL, sysdate,'Available', newID, rent); 
    END LOOP; 
    COMMIT;
END;

