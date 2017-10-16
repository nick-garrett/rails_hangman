class GamesController < ApplicationController
  def index
  end

  def create
    @game = Game.create(word: Word.choose_word)
    redirect_to(@game) if @game.valid?
  end

  def show
    @game = Game.find(params[:id])
  end
end
