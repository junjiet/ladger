class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :common;

	private
	def common
		@urlBase = getUrlBase;
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
