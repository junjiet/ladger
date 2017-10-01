class HomeController < ApplicationController
  def index
  	@members = View_member.where(active_status: 1);
  end
end
