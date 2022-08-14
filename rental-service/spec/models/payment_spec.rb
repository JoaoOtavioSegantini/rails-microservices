require 'rails_helper'

RSpec.describe Payment, type: :model do
  it { is_expected.to validate_presence_of(:amount) }
  it { is_expected.to validate_presence_of(:payment_type) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to belong_to(:order) }
end
