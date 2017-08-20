class HomeController < ApplicationController
  def index
  	record = Person.where('prsn_id=?',80001);
  	puts "test records: #{record.length()}";
  end
end
