class GossipsController < ApplicationController

  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end
  
  def new
    @alert = false
  end

  def create
    @city = City.create(name: params[:city], zip_code: params[:zip_code])
    @user = User.create(first_name: params[:first_name], last_name: params[:last_name], description: params[:description], email: params[:email], age: params[:age], city_id: @city.id)
    @gossip = Gossip.create(title: params[:title], content: params[:content], user_id: @user.id)
    if @gossip.save
      render '/gossips/success'
    else
      @alert = true
      render '/gossips/new'
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    puts "$"*50
    puts params
    puts "$"*50
    post_params = params.require(:gossip).permit(:title, :content)
    if @gossip.update(post_params)
      redirect_to '/gossips'
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to '/gossips'
  end
end