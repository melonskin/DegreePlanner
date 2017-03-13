require 'rails_helper'

RSpec.describe PackageCourseship, type: :model do
    it { is_expected.to respond_to :course_id }
    it { is_expected.to respond_to :package_id }

end