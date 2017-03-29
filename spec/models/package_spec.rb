require 'rails_helper'

RSpec.describe Package, type: :model do
    it { is_expected.to respond_to :name }
    it { is_expected.to respond_to :no_required }
    it { is_expected.to respond_to :program_id }
    
end