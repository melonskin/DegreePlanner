require 'rails_helper'

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

  it "name should not be too long" do 
    setup
    @user.name = "a"*51
    expect(@user.valid?).to be false
  end

  it "email should not be too long" do 
    setup
    @user.email = "a"*250 +"@tamu.edu"
    expect(@user.valid?).to be false
  end

  it "email address should be unique" do 
    setup
    dup_user = @user.dup
    dup_user.email = @user.email.upcase
    @user.save
    expect(dup_user.valid?).to be false
  end

  it "email should be saved as lower case" do 
    setup
    mixed_email = "tTMM@TaMu.EDu"
    @user.email = mixed_email
    @user.save
    expect(@user.email).to eq mixed_email.downcase
  end

  it "password should be present" do 
    setup
    @user.password = @user.password_confirmation = " "*6
    expect(@user.valid?).to be false
  end

  it "password should be no less than 6" do 
    setup
    @user.password = @user.password_confirmation = "a"*5
    expect(@user.valid?).to be false
  end
end

