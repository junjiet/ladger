class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :common;

	class MissingInformationError < ArgumentError
	end
	class InvalidInformationError < ArgumentError
	end

	private
	def common
		#url base of the app available for all controllers:
		@urlBase = getUrlBase;

		#redirection to login screen if not in session:
		if !(controller_name=='access' && (action_name=='signIn' || action_name=='getAuthentication')) then
			if(session[:username].blank?)
				redirect_to controller: "access", action: "signIn";
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

	def getWebErrorMessage(errorCode)
		#latest errorCode: WEB-0001, WEB-0103
		message = '';
		case errorCode
			when 'WEB-0000'
				message = 'Unexpected error encountered.';
			when 'WEB-0001'
				message = 'Insufficient privilege.';
			when 'WEB-0102'
				message = 'Format of the information is not supported.';
			when 'WEB-0103'
				message = 'Required information is missing.';
			else
				message = 'Unknown error code.';
		end

		return message;
	end

end
