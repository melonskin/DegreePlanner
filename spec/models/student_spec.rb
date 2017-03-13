require 'rails_helper'

RSpec.describe Student, type: :model do
    it { is_expected.to respond_to :firstname }
    it { is_expected.to respond_to :lastname }
    it { is_expected.to respond_to :email }
    it { is_expected.to respond_to :password }
    it { is_expected.to respond_to :is_f1 }
    it { is_expected.to respond_to :program_id }
end