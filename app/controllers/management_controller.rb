class ManagementController < ApplicationController
	def members
		@members = View_member.order('prsn_fullname');
	end

	# -----------------------------------------------------------------
	private
	def getMemberData(personID,dataField)
		memberInfo = View_member.where('prsn_id=?',personID);

		data = nil;
		if (memberInfo.length>0)
			data = memberInfo[0][dataField];
		end

		return data;
	end
end
