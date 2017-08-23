class AccessController < ApplicationController
	def login

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