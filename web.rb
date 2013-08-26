require 'sinatra'

get '/' do
  haml :index
end

get '/publish' do
  haml :publish
end
