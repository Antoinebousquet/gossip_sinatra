require 'gossip'

class ApplicationController < Sinatra::Base
  
	get '/' do
  	erb :index, locals: {gossips: Gossip.all}
  end
  
	get '/gossips/new/' do
    erb :new_gossip
  end

	post '/gossips/new/' do
	  Gossip.new(params["gossip_author"], params["gossip_content"]).save
  	redirect '/'
	end

	get '/gossips/:id/' do
  	end_url = params['id']
		url_entiere = Gossip.find(end_url)
		erb :show
	end

end