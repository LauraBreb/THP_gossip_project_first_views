class StaticController < ApplicationController

  def index
    @gossips = Gossip.all
  end

  def team
  end

  def contact
  end

  def welcome
  end

  def show_gossip
    @gossip = Gossip.find(params[:id])
  end

  def show_author
    @author = User.find_by(first_name: params[:first_name])
  end

end