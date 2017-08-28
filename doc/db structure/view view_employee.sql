drop view if exists view_employee;
create view view_employee as
select pbid.public_id, prsn.*
from view_person prsn
	join public_id pbid on prsn.prsn_id=pbid.prsn_id;
