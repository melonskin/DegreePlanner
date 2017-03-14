require 'rails_helper'

RSpec.describe User, type: :model do
    it { is_expected.to respond_to :name }
    it { is_expected.to respond_to :email }
    it "email should end with tamu.edu" do 
        lindeman = User.create!(name: "Andy", email: "Lindeman@tamu.edu")
        assert lindeman.valid?, "#{lindeman.email.inspect} should be valid"
    end

    # it "invalid email should not end with tamu.edu" do 
    #     @user = User.new(name: "Example User", email: "user@tamu.edu")

    #     invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
    #                        foo@bar_baz.com foo@bar+baz.com]
    #     invalid_addresses.each do |invalid_address|
    #         @user.email = invalid_address
    #         @user.valid? should eq(false), "#{invalid_address.inspect} should be invalid"
    #     end
    # end

end
