class ManagementController < ApplicationController
  def members
  	@members = View_member.order('prsn_fullname');
  end
end
