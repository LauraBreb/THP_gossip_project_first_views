class StaticController < ApplicationController
  def team
  end

  def contact
  end

  def welcome
  end

  def show_author
    @author = User.find_by(first_name: params[:first_name])
  end

end