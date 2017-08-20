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

create table group_account (
	group_id number(3),
	group_name varchar(30) not null,
	constraint group_account_pk primary key (group_id)
);

create table user_group (
	username varchar(15),
	group_id number(3),
	constraint user_group_pk primary key (username,group_id),
	constraint user_group_username_fk foreign key (username)
		references user_account(username),
	constraint user_group_group_fk foreign key (group_id)
		references group_account(group_id)
);

create table feature (
	feature_id varchar(20),
	feature_name varchar(30) not null,
	feature_details varchar(200),
	constraint feature_pk primary key (feature_id)
);

create table app_constant (
	feature_id varchar(20),
	constant_value varchar(500),
	constraint app_constant_pk primary key (feature_id)
);
