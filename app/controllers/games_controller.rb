#:nodoc:
class GamesController < ApplicationController
  def index
  end

  def create
    # @game = Game.create!
    @game = Game.new
    @game.word = Game.choose_word
    @game.save
    redirect_to(@game)
  end

  def show
    @game = Game.find_by_id(params[:id])
  end
end
