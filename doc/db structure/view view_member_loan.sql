drop view if exists view_member_loan;
create view view_member_loan as
	select loan.loan_id, mmbr.prsn_id, mmbr.prsn_fullname, mmbr.employee_id,
	loan.loan_code, loan.loan_amount, loan.loan_term, loan.loan_date,
	vchr.voucher_id, vchr.voucher_number, loan.check_number
	from member_loan loan
	join view_member mmbr on loan.member_id=mmbr.prsn_id
	join voucher vchr on loan.voucher_id=vchr.voucher_id
