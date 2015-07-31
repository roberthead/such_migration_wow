require 'rails_helper'

RSpec.describe SlidesController, type: :controller do
  describe "GET #show" do
    let(:deck) { Deck.create!(name: "Foo Fighting") }
    let(:slide) { Slide.create!(deck: deck, header: "Title", body: "body", position: 1) }

    it "returns http success" do
      get :show, deck_id: deck, id: slide
      expect(response).to have_http_status(:success)
    end
  end
end
