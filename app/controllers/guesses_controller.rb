# frozen_string_literal: true

#:nodoc:
class GuessesController < ApplicationController
  def create
    # TODO: what happens when it doesn't exist, find_by, find_by_id (don't use), find
    game = Game.find(params[:game_id])
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
