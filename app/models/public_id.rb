class Public_id < ActiveRecord::Base
	self.table_name = "public_id";

	validates :public_id, length: { maximum: 15 };
end
