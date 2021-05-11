class GossipsController < ApplicationController

  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end
  
  def new
  end

  def create
    @city = City.create(name: params[:city], zip_code: params[:zip_code])
    @user = User.create(first_name: params[:first_name], last_name: params[:last_name], description: params[:description], email: params[:email], age: params[:age], city_id: @city.id)
    @gossip = Gossip.create(title: params[:title], content: params[:content], user_id: @user.id)
    if @gossip.save
      render '/gossips/success'
    else
      render '/gossips/new'
    end
  end
end