require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:user2) { FactoryGirl.create(:user) }
  let(:message) { FactoryGirl.create(:message) }

  subject { message }

  it { should respond_to(:sender_id) }
  it { should respond_to(:receiver_id) }

  context "validations" do
    it{ should validate_presence_of(:sender_id) }
    it{ should validate_presence_of(:receiver_id) }
  end

  describe "message methods" do
    it { should respond_to(:sender) }
    it { should respond_to(:receiver) }
    it { should respond_to(:body) }
  end
end
