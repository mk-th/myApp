class EmailsController < ApplicationController
require 'json'
  def index
  	name = params[:firstname].to_s + params[:lastname].to_s
  	j = [{:name => name}].to_json
  	if(name)
		ep = EmailPermutator.new(j, "name", true, "domain.com", nil, "all")
		ep.genemails
		@emails = JSON.parse(ep.emaillist)
  	else
		@emails = "No Name Found :-P"  		
  	end
  end

end
