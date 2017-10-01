drop view if exists view_person;
create view view_person as
select prsn.prsn_id,
	prsn.prsn_lname
		||case when prsn.prsn_lnamesuffix is null then ''
			else
				case when substr(prsn.prsn_lnamesuffix,1,1)=',' then '' else ' ' end
				||prsn.prsn_lnamesuffix
		end
		||', '
		||prsn.prsn_fname
		||case when prsn.prsn_fnamesuffix is null then ''
			else
				case when substr(prsn.prsn_fnamesuffix,1,1)=',' then '' else ' ' end
				||prsn.prsn_fnamesuffix
		end
		||case when prsn.prsn_mname is null then '' else ' '||prsn.prsn_minitial end
	prsn_fullname,
	prsn_lname,
	prsn_lnamesuffix,
	prsn_fname,
	prsn_fnamesuffix,
	prsn_mname,
	prsn_minitial,
	prsn.prsn_lname
	||case when prsn.prsn_lnamesuffix is null then ''
		else
			case when substr(prsn.prsn_lnamesuffix,1,1)=',' then '' else ' ' end
			||prsn.prsn_lnamesuffix
	end prsn_lname_and_suffix,
	prsn.prsn_fname
	||case when prsn.prsn_fnamesuffix is null then ''
		else
			case when substr(prsn.prsn_fnamesuffix,1,1)=',' then '' else ' ' end
			||prsn.prsn_fnamesuffix
	end prsn_fname_and_suffix,
	prsn_gender,
	prsn_birthdate,
	prsn_civilstatus
from person prsn;
