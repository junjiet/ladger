create table person (
	prsn_id number(6),
	prsn_lname varchar(30) not null,
	prsn_lnamesuffix varchar(10),
	prsn_fname varchar(30) not null,
	prsn_fnamesuffix varchar(10),
	prsn_mname varchar(30),
	prsn_minitial varchar(10),
	constraint person_pk primary key (prsn_id)
);

create table user_account (
	username varchar(15),
	password varchar(40) not null,
	active number(1) not null,
	prsn_id number(6) not null,
	constraint user_account_pk primary key (username),
	constraint user_account_person_fk foreign key (prsn_id)
		references person(prsn_id)
);
