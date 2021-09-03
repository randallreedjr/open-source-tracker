require 'rails_helper'

RSpec.describe "Contributions", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/contributions/index"
      expect(response).to have_http_status(:success)
    end
  end

end
