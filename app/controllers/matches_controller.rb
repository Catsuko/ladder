class MatchesController < ApplicationController
  def new
    game = Game.find(params.require(:game_id))
    template = game.matches.first
    @match = Match.new
  end

  def create
    Match.create!(create_params)
    redirect_to game_path(id: params.require(:game_id))
  rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotUnique => e
    @match = e.try(:record) || Match.new
    render :edit
  end

private

  def create_params
    params.require(:match)
    .permit(match_players_attributes: %i[player_id rank])
    .merge(game_id: params.require(:game_id))
  end
end