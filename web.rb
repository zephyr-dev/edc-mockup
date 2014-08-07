require 'sinatra'
require 'haml'
require 'pry'
require 'rubygems'
require_relative 'models/init'

get '/' do
  @company = 1
  haml :index
end

get '/publish' do
  haml :publish
end

get '/hide_input' do
  haml :hide_input
end

get '/information/*' do |company_row|
  @company = Company.new(company_row)
  haml :index
end
