
RSpec.describe Course, type: :model do
    it { is_expected.to respond_to :department }
    it { is_expected.to respond_to :number }
    it { is_expected.to respond_to :name }
    it { is_expected.to respond_to :credit }
    it { is_expected.to respond_to :description }
    it { is_expected.to respond_to :is_fall }
    it { is_expected.to respond_to :is_spring }
    it { is_expected.to respond_to :is_summer }

end

