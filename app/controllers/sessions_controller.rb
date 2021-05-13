class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      log_in(user)
      redirect_to '/gossips', notice: "vous êtes maintenant connecté à votre session"
    else
      flash.alert = 'email ou mot de passe invalides'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/gossips', notice: "vous avez été déconnecté !"
  end
end
