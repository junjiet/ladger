drop view if exists view_member;
create view view_member as
select empl.employee_id,
    empl.prsn_id,
    empl.prsn_fullname,
    empl.prsn_gender,
    empl.prsn_birthdate,
    empl.prsn_civilstatus,
    mmbr.active_status
from view_employee empl
    join member mmbr on empl.prsn_id=mmbr.member_id;
