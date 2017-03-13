require 'rails_helper'

RSpec.describe Program, type: :model do
    it { is_expected.to respond_to :name }
    it { is_expected.to respond_to :acronym }
    it { is_expected.to respond_to :is_thesis }
end