require 'gossip'

class ApplicationController < Sinatra::Base
  
	get '/' do
  	erb :index, locals: {gossips: Gossip.all}
  end
  
	get '/gossips/new/' do
    erb :new_gossip
    ## Sinon problème d'affichage
    # redirect '/'
  end

	post '/gossips/new/' do
	  Gossip.new(params["gossip_author"], params["gossip_content"]).save
	end

	get '/gossips/:id/' do
  	erb :show, locals: { gossip_id: params[:id], wanted_gossip: Gossip.find(params[:id].to_i) }
	end

end