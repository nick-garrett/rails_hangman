#:nodoc:
class GamesController < ApplicationController
  def index
  end

  def create
    @game = Game.create(word: Word.choose_word)
    redirect_to(@game) if @game.save!
  end

  def show
    @game = Game.find_by(id: params[:id])
    unless @game.word
      flash[:error] = 'Unitialized db.'
      redirect_to '/'
      return
    end
    redirect_to '/' unless @game
  end
end
