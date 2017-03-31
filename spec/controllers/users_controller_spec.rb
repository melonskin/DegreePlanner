require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      new_user_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "login validation" do
    it("should redirect show when not logged in") do
      get :show, :id => rand() * 10
      assert_redirected_to(login_path)
    end
  end
end
