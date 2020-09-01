#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "barbershop.db"}

class Client < ActiveRecord::Base

end

class Barber < ActiveRecord::Base

end

before do # Добавляет данный код во все get и post запросы

  @barbers = Barber.all # Теперь данная переменная содержит все данные сущности Barber

end

get '/' do
  erb :index
end

get '/visit' do


  erb :visit
end

post '/visit' do

  @username = params[:username]
  @phone = params[:phone]
  @datetime = params[:datetime]
  @barber = params[:barber]
  @color = params[:color]

  erb "Спасибо, вы записаны."

end