class GuessController < ApplicationController
  def create
    game = Game.find_by_id!(params[:game_id])
    guess = game.guesses.create(guess_params)

    flash[:fail] = guess.errors.first.last unless guess.save
    redirect_to(game)
  end

  private

  def guess_params
    params.permit(:letter, :game_id)
  end
end
