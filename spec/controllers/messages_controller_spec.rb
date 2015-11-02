require 'rails_helper'

RSpec.describe MessagesController, type: :controller do


  let(:sender) { FactoryGirl.create(:user) }
  let(:receiver) { FactoryGirl.create(:user) }
  let(:valid_attributes) {
    {body: "This is a message"}
  }
  let(:invalid_attributes) {
    {body: ""}
  }

  describe "As a logged in user" do
    login_user

    describe "GET #index" do
      it "assigns all messages as @messages" do
        message = Message.create!(body: "This is a message", sender: sender, receiver: @user)
        get :index, {}
        expect(assigns(:messages).to_a).to eq([message])
      end
    end

    describe "GET #new" do
      it "assigns a new message as @message" do
        get :new, {user_id: receiver.id}
        expect(assigns(:message)).to be_a_new(Message)
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new message" do
          expect {
            post :create, {user_id: receiver.id, :message => valid_attributes}
          }.to change(Message, :count).by(1)
        end

        it "assigns a newly created message as @message" do
          post :create, {user_id: receiver.id, :message => valid_attributes}
          expect(assigns(:message)).to be_a(Message)
          expect(assigns(:message)).to be_persisted
        end

        it "redirects to the message index" do
          post :create, {user_id: receiver.id, :message => valid_attributes}
          expect(response).to redirect_to(user_path(receiver))
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved message as @message" do
          post :create, {user_id: receiver.id, :message => invalid_attributes}
          expect(assigns(:message)).to be_a_new(Message)
        end

        it "re-renders the 'new' template" do
          post :create, {user_id: receiver.id, :message => invalid_attributes}
          expect(response).to render_template("new")
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested post" do
        message = Message.create!(body: "This is a message", sender: sender, receiver: @user)
        expect {
          delete :destroy, {:id => message.id}
        }.to change(Message, :count).by(-1)
      end

      it "redirects to the posts list" do
        message = Message.create!(body: "This is a message", sender: sender, receiver: @user)
        delete :destroy, {:id => message.id}
        expect(response).to redirect_to(messages_url)
      end
    end

  end

end
