require 'rails_helper'

RSpec.describe Coursesection, type: :model do
    it { is_expected.to respond_to :department }
    it { is_expected.to respond_to :number }
    it { is_expected.to respond_to :section }
    it { is_expected.to respond_to :instructor }
    it { is_expected.to respond_to :term }
    it { is_expected.to respond_to :year }
    it { is_expected.to respond_to :gpa }
    it { is_expected.to respond_to :a }
    it { is_expected.to respond_to :b }
    it { is_expected.to respond_to :c }
    it { is_expected.to respond_to :d }
    it { is_expected.to respond_to :f }
    it { is_expected.to respond_to :q }
    it { is_expected.to respond_to :course_id }

end