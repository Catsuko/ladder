class GamesController < ApplicationController
  def index
    @games = Game.all.order(updated_at: :desc)
  end

  def show
    @game = Game.find(params.require(:id))
  end

  def new
    @game = Game.new
  end

  def create
    Game.create!(params.require(:game).permit(:name))
    redirect_to games_path
  rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotUnique => e
    @game = e.try(:record) || Game.new
    render action: :new
  end
end
