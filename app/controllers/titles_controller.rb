class TitlesController < ApplicationController
  def index
    @game = Game.find(params.require(:game_id))
    @titles = @game.titles
  end

  def new
    game = Game.find(params.require(:game_id))
    @title = Title.new(rank: game.titles.next_free_rank)
    render :edit
  end

  def edit
    @title = Title.find(params.require(:id))
  end

  def create
    create_params = params.require(:title).permit(:name, :rank)
    Title.create!(create_params.merge(params.permit(:game_id)))
    redirect_to game_titles_path
  rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotUnique => e
    @title = e.try(:record) || Title.new
    render :edit
  end

  def update
    @title = Title.find(params.require(:id))
    @title.update(params.require(:title).permit(:name, :rank))
    redirect_to game_titles_path(game_id: @title.game_id)
  rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotUnique => e
    @title = e.try(:record) || @title
    render :edit
  end

  def destroy
    title = Title.find(params.require(:id)).destroy!
    redirect_to game_titles_path(game_id: title.game_id)
  end

end