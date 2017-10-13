# frozen_string_literal: true

#:nodoc:
class GuessesController < ApplicationController
  def create
    game = Game.find_by(id: params[:game_id])
    redirect_to '/' unless game
    guess = game.guesses.create(guess_params)
    # TODO: flash conventions, full_messages
    flash[:error] = guess.errors.first.last unless guess.save
    redirect_to(game)
  end

  private

  def guess_params
    params.require(:guess).permit(:letter)
  end
end
