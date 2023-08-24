--All videos with ID, Name, Category, and Copies.

SELECT VID.V_ID as ID, VID.V_NAME as Name, CAT.VCAT_NAME as CATAGORY, COP.VCOP_ID AS COPY_ID, COP.VCOP_RENT as RENT_PRICE
FROM VIDEOS VID, VIDEOS_CATAGORY CAT, VIDEO_COPIES COP
WHERE COP.V_ID = VID.V_ID AND VID.VCAT_ID = CAT.VCAT_ID;

--------------------------------------------------------------------------------------

--All customers

SELECT C_ID AS ID, C_NAME AS NAME, C_TYPE AS SEX, C_NAT_ID AS NATIONAL_ID
FROM CUSTOMERS;

--------------------------------------------------------------------------------------

--  Rental Information for customers

Select CUSTOMERS.C_ID AS CUSTOMER_ID,C_NAME AS CUSTOMER_NAME ,V_NAME AS MOVIE_NAME,
    R_START_DATE AS START_DATE,R_END_DATE AS END_DATE, R_RENT AS RENT_PRICE
From Rental, Customers, Videos
Where RENTAL.C_ID = CUSTOMERS.C_ID AND RENTAL.V_ID = VIDEOS.V_ID;

--------------------------------------------------------------------------------------

--Rental Information Date Wise

Select R_ID AS RENTAL_ID, VIDEOS.V_NAME AS MOVIE_NAME, CUSTOMERS.C_NAME AS CUSTOMER_NAME, 
    R_START_DATE AS START_DATE, R_END_DATE AS END_DATE, R_RENT AS PRICE
From RENTAL , VIDEOS , CUSTOMERS
Where RENTAL.R_ID = VIDEOS.V_ID AND RENTAL.C_ID = CUSTOMERS.C_ID Order by R_START_DATE;
