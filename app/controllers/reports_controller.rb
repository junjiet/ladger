class ReportsController < ApplicationController
	def index
	end
	def members
		@members = View_member.where('active_status=1').order('prsn_fullname');
	end
end
