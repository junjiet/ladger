class AccessController < ApplicationController
	def login
		
	end

	def getAuthentication
		username = params[:username];
		password = params[:password];

		userAccount = User_account.where('username=?',username);
		pwdRecorded = userAccount[0].password;

		lh = LadgerHash.new
		pwdHash = lh.hash(password);

		@authenticated = (pwdRecorded==pwdHash);
	end

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