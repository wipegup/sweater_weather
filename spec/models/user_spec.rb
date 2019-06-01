require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }

  end

  describe 'relationships' do
    it {should have_many(:favorites)}
  end
  scenario 'creation generates key' do
    user = User.create(email: 'test@email.com',
                       password: 'testing')
    expect(user.api_key).not_to eq(nil)
  end
end
