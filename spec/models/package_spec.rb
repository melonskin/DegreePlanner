require 'rails_helper'

RSpec.describe Package, type: :model do
    it { is_expected.to respond_to :number }
    it { is_expected.to respond_to :no_required }
    it { is_expected.to respond_to :program_id }
    
end