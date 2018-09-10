require 'rails_helper'

RSpec.describe ContactController, type: :controller do

  describe "GET show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST deliver" do
    it "returns http success" do
      post :deliver
      expect(response).to have_http_status(:success)
    end
  end

end
