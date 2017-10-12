#:nodoc:
class GamesController < ApplicationController
  def index
  end

  def create
    @game = Game.create(word: Word.choose_word)
    redirect_to(@game) if @game.save!
  end

  def show
    @game = Game.find(params[:id])
  end
end
