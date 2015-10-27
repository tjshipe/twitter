require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  before { @post = user.posts.build(body: "This is a tweet") }

  subject { @post }

  it { should respond_to(:body) }
  it { should respond_to(:user) }
end
