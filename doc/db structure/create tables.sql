create table person (
	prsn_id number(6),
	prsn_lname varchar(30) not null,
	prsn_lnamesuffix varchar(10),
	prsn_fname varchar(30) not null,
	prsn_fnamesuffix varchar(10),
	prsn_mname varchar(30),
	prsn_minitial varchar(10),
	prsn_gender char(1) not null,
	prsn_birthdate datetime,
	prsn_civilstatus char(1),
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

create table privilege (
	group_id number(3),
	feature_id varchar(20),
	bit_access_level number(6) not null,
	constraint privilege_pk primary key (group_id,feature_id),
	constraint privilege_group_fk foreign key (group_id)
		references group_account(group_id),
	constraint privilege_feature_fk foreign key (feature_id)
		references feature(feature_id)
);

create table trail_type (
	trail_type number(3),
	trail_description varchar(50) not null,
	constraint trail_type_pk primary key (trail_type)
);

create table trail_login (
	username varchar(15),
	log_record number(6) not null,
	log_type number(3) not null,
	log_time datetime not null,
	constraint trail_login_pk primary key (username,log_record),
	constraint trail_login_username_fk foreign key (username)
	references user_account(username)
);

create table public_id (
	public_id varchar(15),
	prsn_id number(6) not null,
	constraint public_id_pk primary key (public_id),
	constraint public_id_fk foreign key (prsn_id)
		references person(prsn_id)
);

create table member (
	member_id number(6),
	constraint member_pk primary key (member_id)
);

create table voucher (
	voucher_id number(9),
	voucher_number varchar(15) not null,
	constraint voucher_pk primary key (voucher_id)
);

create table loan_type (
	loan_code varchar(15),
	loan_name varchar(30) not null,
	constraint loan_type_pk primary key (loan_code)
);

create table member_loan (
	loan_id number(9),
	member_id number(6) not null,
	loan_code varchar(15) not null,
	loan_amount number(9,2) not null,
	loan_term number(2) not null,
	loan_date datetime,
	voucher_id number(9),
	check_number varchar(15),
	constraint member_loan_pk primary key (loan_id),
	constraint member_loan_member_fk foreign key (member_id)
		references member(member_id),
	constraint member_loan_loan_fk foreign key (loan_code)
		references loan_type(loan_code),
	constraint member_loan_voucher_fk foreign key (voucher_id)
		references voucher(voucher_id)
);

create table official_receipt (
	or_number varchar(15),
	or_date datetime,
	total_amount number(9,2) not null,
	constraint official_receipt_pk primary key (or_number)
);
