require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  before { @post = user.posts.build(body: "This is a tweet") }

  subject { @post }

  it { should respond_to(:body) }
  it { should respond_to(:user) }

  context "validations" do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:body) }
    it { should validate_length_of(:body).is_at_most(140) }
  end
end
