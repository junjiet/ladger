drop view if exists view_employee;
create view view_employee as
select pbid.public_id employee_id,
	prsn.prsn_id,
	prsn.prsn_fullname,
	prsn.prsn_gender,
	prsn.prsn_birthdate,
	prsn.prsn_civilstatus
from view_person prsn
	join public_id pbid on prsn.prsn_id=pbid.prsn_id;
