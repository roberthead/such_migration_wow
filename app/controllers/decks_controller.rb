class DecksController < ApplicationController
  def index
    @decks = Deck.all
  end

  def show
    deck = Deck.find_by(slug: params[:id]) || Deck.find(params[:id])
    redirect_to [deck, deck.slides.first]
  end
end
