
insert into VIDEOS_CATAGORY values(VCAT_ID_seq.NEXTVAL,'Action',null);
insert into VIDEOS_CATAGORY values(VCAT_ID_seq.NEXTVAL,'Adventure',null);

--Here we add the date this way,because SYSDATE would count seconds and my function depends on NAME, Movie ID and start Date.

BEGIN
    add_video_copies('James Bond', 'Action', 2, 10);
    add_video_copies('Indiana Jones', 'Adventure', 2, 10);
    add_Customer('Abdullah', 'Male', '123456789');
    INSERT_RENTAL_START('Indiana Jones','Abdullah',(TO_DATE('2023-06-02', 'YYYY-MM-DD')),null);
    INSERT_RENTAL_CLOSE(0,(TO_DATE('2023-06-09', 'YYYY-MM-DD')));
END;