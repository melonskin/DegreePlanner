require 'rails_helper'

RSpec.describe Course, type: :model do
    it { is_expected.to respond_to :department }
    it { is_expected.to respond_to :number }
    it { is_expected.to respond_to :name }
    it { is_expected.to respond_to :credit }
    it { is_expected.to respond_to :prerequisite }
end