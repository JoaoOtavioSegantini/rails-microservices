require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  it { is_expected.to validate_presence_of(:qtd) }
  it { is_expected.to belong_to(:product) }
  it { is_expected.to belong_to(:order) }
end
