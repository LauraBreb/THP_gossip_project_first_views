class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new , :create]

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
    @user = current_user
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
    puts "$" * 50
    puts params
    puts "$" * 50
    @gossip = Gossip.find(params[:id])
    post_params = params.require(:gossip).permit(:title, :content)
    if @gossip.update(post_params)
      flash.now[:success]
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

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Vous devez d'abord vous connecter à votre session"
      redirect_to new_session_path
    end
  end
end