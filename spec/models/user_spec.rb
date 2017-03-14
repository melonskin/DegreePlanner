require 'rails_helper'



class UserTest < ActiveSupport::TestCase
  
  RSpec.describe User, type: :model do

    def setup
      @user = User.new(name: "Example User", email: "usertest@tamu.edu",
                     password: "foobar", password_confirmation: "foobar")
    end

    it "should be valid" do
      setup
      assert @user.valid?
    end

    it "name should be present" do
        setup
        @user.name = ""
        expect(@user.valid?).to be false
    end

    it "email should be present" do
        setup
      @user.email = "     "
      expect(@user.valid?).to be false
    end
  
    it { is_expected.to respond_to :name }
    it { is_expected.to respond_to :email }
    it "email should end with tamu.edu" do 
        setup
        assert @user.valid?, "#{@user.email.inspect} should be valid"
    end

    it "invalid email should not end with tamu.edu" do 
        setup

        invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
        invalid_addresses.each do |invalid_address|
            @user.email = invalid_address
            expect(@user.valid?).to be false 
            # "#{invalid_address.inspect} should be invalid"
        end
    end

  end

end
