require 'rails_helper'

RSpec.describe Student, type: :model do
    it { is_expected.to respond_to :firstname }
    it { is_expected.to respond_to :lastname }
    it { is_expected.to respond_to :is_f1 }
    it { is_expected.to respond_to :program_id }
    it { is_expected.to respond_to :user_id }
    it { is_expected.to respond_to :yearstart }
    it { is_expected.to respond_to :yearend }
    it { is_expected.to respond_to :semstart }
    it { is_expected.to respond_to :semend }
end