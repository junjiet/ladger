class HomeController < ApplicationController
  def index
	record = User_account.where('prsn_id=?',80001);
	puts "password: #{record[0].password}";
  end
end
