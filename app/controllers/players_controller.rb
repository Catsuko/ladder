class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  def create
    Player.create!(params.require(:player).permit(:discord_id))
    redirect_to players_path
  rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotUnique => e
    @player = e.record
    render action: :new
  end
end