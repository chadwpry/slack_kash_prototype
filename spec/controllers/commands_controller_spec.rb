require 'rails_helper'

RSpec.describe CommandsController, type: :controller do

  describe "GET #kuestion" do
    it "returns http success" do
      get :kuestion
      expect(response).to have_http_status(:success)
    end
  end

end
