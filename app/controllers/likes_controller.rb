class LikesController < ApplicationController
  def create
    @user = current_user
    @like = Like.create(gossip_id: params[:gossip_id], user_id: @user.id)
    if @like.save
      redirect_to '/gossips'
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to '/gossips'
  end
end
