class Person < ActiveRecord::Base
	self.table_name = "person";

	validates :prsn_lname, presence: true;
	validates :prsn_lname, length: { maximum: 30 };
	validates :prsn_lnamesuffix, length: { maximum: 10 };

	validates :prsn_fname, presence: true;
	validates :prsn_fname, length: { maximum: 30 };
	validates :prsn_fnamesuffix, length: { maximum: 10 };

	validates :prsn_mname, length: { maximum: 30 };
	validates :prsn_minitial, length: { maximum: 10 };

	validates :prsn_gender, presence: true;
	validates :prsn_gender, length: { maximum: 1 };
	validates :prsn_civilstatus, length: { maximum: 1 };
end
