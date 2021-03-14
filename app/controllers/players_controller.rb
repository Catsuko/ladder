class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.create!(params.require(:player).permit(:name))
    redirect_to root_path
  rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotUnique
    render :new
  end
end