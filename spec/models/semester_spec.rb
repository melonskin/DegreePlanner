require 'rails_helper'

RSpec.describe Semester, type: :model do
    it { is_expected.to respond_to :term }
    it { is_expected.to respond_to :year }
end