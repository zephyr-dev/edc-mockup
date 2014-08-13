require 'sinatra'
require 'sinatra/activerecord'
require 'haml'
require 'pry'
require 'rubygems'
require 'tux'
require_relative 'models/init'


db = URI.parse(ENV['DATABASE_URL'] || 'postgres://edc_mockup:edc_mockup@localhost/edc_development')

ActiveRecord::Base.establish_connection(
  :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
  :host     => db.host,
  :username => db.user,
  :password => db.password,
  :database => db.path[1..-1],
  :encoding => 'utf8'
)



get '/' do
  @company= Company.last
  haml :index
end

get '/publish' do
  @company= Company.last
  haml :publish
end

get '/information/*' do |obfuscated_id|
  @company = Company.find_by_obfuscated_id(obfuscated_id)
  haml :index
end

post '/publish' do
  @company = Company.find_by_obfuscated_id(params["obfuscated_id"])

  updates = params['update']
   column_index = Reference.get_column_index
    updates.each do |attribute, update|
      if update != ""
        @company.send("#{attribute}=", update)
      end
    end
  @company.updated = true
  @company.save

  haml :publish, locals: {:company => @company}
end

get '/download' do
  Company.generate_spreadsheet
  send_file 'updated.csv', type: :csv, filename: 'updated.csv'

end
