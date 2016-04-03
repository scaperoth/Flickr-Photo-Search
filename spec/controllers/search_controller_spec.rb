require 'rails_helper'

RSpec.describe SearchController, type: :controller do

  describe "GET #tag" do
    it "returns http success" do
      get :tag
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #sort" do
    it "returns http success" do
      get :sort
      expect(response).to have_http_status(:success)
    end
  end

end
