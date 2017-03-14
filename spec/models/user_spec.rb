require 'rails_helper'

RSpec.describe User, type: :model do
    it { is_expected.to respond_to :name }
    it { is_expected.to respond_to :email }
   
end
