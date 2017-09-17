class Person < ActiveRecord::Base
	self.table_name = "person";

	validates :prsn_lname, presence: true;
	validates :prsn_fname, presence: true;
	validates :prsn_gender, presence: true;
end
