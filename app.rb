require 'rubygems'
require 'sinatra'
require 'aasm'
require File.join(File.dirname(__FILE__), 'database')
require 'pony'

get '/' do
  @users = User.all
  haml :index
end

get '/users/beta/new' do
  haml :beta_new
end

post '/users/beta' do
  @name, @email, @password = params[:name], params[:email], params[:password]
  if params_ok?
    Pony.mail :to       => @email,
              :bcc      => 'chip@invoicethat.com',
              :from     => 'chip@invoicethat.com',
              :subject  => 'Welcome to invoicethat.com',
              :body     => haml(:beta_welcome),
              :content_type => 'text/html'
    "An email was sent to #{@name} with email #{@email} and password #{@password}"
  else
    #params.inspect
    "Dude, you forgot to fill out the form completely"
  end
end

def params_ok?
  @name != '' && @email != '' && @password != ''
end