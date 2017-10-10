class GuessController < ApplicationController
  def create
    game = Game.find_by_id!(params[:game_id])
    game.guesses.create(guess_params).save
    redirect_to(game)
  end

  private

  def guess_params
    params.permit(:letter, :game_id)
  end
end
