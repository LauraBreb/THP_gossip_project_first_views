class UsersController < ApplicationController
  def new
  end

  def create
    @city = City.create(name: params[:city], zip_code: params[:zip_code])
    @user = User.create(email: params[:email], password: params[:password], first_name: params[:first_name], last_name: params[:last_name], description: params[:description], age: params[:age], city_id: @city.id)
    if @user.save
      log_in(@user)
      flash.now[:success]
      redirect_to '/gossips'
    else
      @alert = true
      render '/users/new'
    end
  end
end
