require 'rubygems'
require 'sinatra'
require 'aasm'
require File.join(File.dirname(__FILE__), 'database')

get '/' do
  @users = User.all
  haml :index
end

get '/users/beta/new' do
  haml :beta_new
end

post '/users/beta' do
  params.inspect
end
