require 'sinatra'

get '/' do
  haml :index
end

get '/publish' do
  haml :publish
end

get '/hide_input' do
  haml :hide_input
end
