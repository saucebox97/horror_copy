
CREATE SEQUENCE seq_tbl_calendar;
DROP SEQUENCE seq_tbl_calendar;

DROP TABLE tbl_calendar;
CREATE TABLE tbl_calendar (
    calendar_no NUMBER(10)
    , month VARCHAR2(30) NOT NULL
    , day VARCHAR2(30) NOT NULL
    , time VARCHAR2(30) NOT NULL
    , channel VARCHAR2(30) NOT NULL
    , genre VARCHAR2(30) NOT NULL
    , limit VARCHAR2(30) NOT NULL
    , title VARCHAR2(50) NOT NULL
    , movie_time VARCHAR2(30) NOT NULL
    , director VARCHAR2(30) NOT NULL
    , content VARCHAR2(2000)
    , id VARCHAR2 (30)
    , CONSTRAINT pk_tbl_calendar PRIMARY KEY (calendar_no)
);



SELECT *
FROM tbl_calendar
;