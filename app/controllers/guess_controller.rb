class GuessController < ApplicationController

  def create
    game = Game.find_by_id!(params[:game_id])
    # guess = Guess.create(letter: params.require(:guess))
    game.guesses.build(letter: params.require(:guess).downcase, game_id: game.id).save
    redirect_to(game)
  end

  private

  def guess_params
    params.require(:guess).permit(:letter)
  end
end
