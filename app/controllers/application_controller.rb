class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :common;

	private
	def common
		#url base of the app available for all controllers:
		@urlBase = getUrlBase;

		#redirection to login screen if not in session:
		if !(controller_name=='access' && action_name=='login') then
			if(session[:current_user].blank?)
				redirect_to controller: "access", action: "login"
			end
		end
	end	

	def getUrlBase
		#function to get the URL base of the app

		m=request.fullpath.split("/");
		my=m[1];

		if(my != 'ladger')
			my = '';
		else
			my = '/ladger';
		end
		return "#{request.protocol}#{request.host_with_port}#{my}";
	end

end
