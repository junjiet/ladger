create table person (
    prsn_id number(2),
    prsn_lname varchar(30),
    prsn_lnamesuffix varchar(10),
    prsn_fname varchar(30),
    prsn_fnamesuffix varchar(10),
    prsn_mname varchar(30),
    prsn_minitial varchar(10)
    constraint person_pk primary key (prsn_id)
);