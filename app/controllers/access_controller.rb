class AccessController < ApplicationController
	def login
		
	end

	def getAuthentication
		username = params[:username];
		password = params[:password];

		userAccount = User_account.where('username=?',username);

		@authenticated = false;
		@errorMessage = 'Invalid username or password.';
		@activeStatus = nil;
		if userAccount.length>0 then
			pwdRecorded = userAccount[0].password;

			lh = LadgerHash.new;
			pwdHash = lh.hash(password);

			@authenticated = (pwdRecorded==pwdHash);

			if @authenticated then
				@activeStatus = userAccount[0].active;
				if @activeStatus==0 then
					@authenticated = false;
					@errorMessage = 'Account has been deactivated.';
				elsif @activeStatus==2 then
					@authenticated = false;
					@errorMessage = 'Account password needs to be changed before using the system.';
				end
			end
		end
	end

	#------------------------------------------------------------------
	private
	
	class LadgerHash
		require 'digest';
		def hash(raw)
			sha256 = Digest::SHA256.new;
			salt = sha256.hexdigest(raw);
			return sha256.hexdigest(raw+salt)[0..39];
		end
	end
end
