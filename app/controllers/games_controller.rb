class GamesController < ApplicationController
  # view a collection of scenarios
  def view
    @game = Game.find params[:id]
  end

  # show all the games (collection of scenarios)
  def index
    @games = Game.all
  end
end
