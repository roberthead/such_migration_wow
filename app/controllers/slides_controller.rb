class SlidesController < ApplicationController
  def show
    @deck = Deck.find_by(slug: params[:deck_id])
    @slide = @deck.slides.find_by(slug: params[:id]) || @deck.slides.find(params[:id])
  end
end
