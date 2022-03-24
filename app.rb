require 'sinatra/base'
require 'sinatra/reloader'
require './lib/date_calculator.rb'

class BirthdayGreeter < Sinatra::Base

  get '/' do
    erb(:index)
  end

  post '/greeting' do
    p params
    @name = params[:name1]
    @day = params[:day]
    @month = params[:month]
    date_calculator = DateCalculator.new
    @days_left = date_calculator.days_to_go_until(@day, @month)
    erb(:greeting)
  end



  run! if app_file == $0
end