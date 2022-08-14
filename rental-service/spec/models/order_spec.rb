require 'rails_helper'

RSpec.describe Order, type: :model do
  
  it { is_expected.to validate_presence_of(:status) }
  it { is_expected.to validate_presence_of(:balance) }
  it { is_expected.to validate_presence_of(:order_date) }
  it { is_expected.to validate_presence_of(:total) }
  it { is_expected.to have_many(:order_items).dependent(:destroy) }
  it { is_expected.to belong_to(:customer) }
  it { is_expected.to have_many(:payments).dependent(:destroy) }
end
