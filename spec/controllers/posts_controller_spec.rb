require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:valid_attributes) {
    {body: "This is a tweet", user: @user}
  }

  let(:invalid_attributes) {
    {body: "", title: ""}
  }

  describe "As a logged in user" do
    login_user

    describe "GET #index" do
      it "assigns all posts as @posts" do
        post = Post.create! valid_attributes
        get :index, {}
        expect(assigns(:posts)).to eq([post])
      end
    end

    describe "GET #new" do
      it "assigns a new post as @post" do
        get :new, {}
        expect(assigns(:post)).to be_a_new(Post)
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Post" do
          expect {
            post :create, {:post => valid_attributes}
          }.to change(Post, :count).by(1)
        end

        it "assigns a newly created post as @post" do
          post :create, {:post => valid_attributes}
          expect(assigns(:post)).to be_a(Post)
          expect(assigns(:post)).to be_persisted
        end

        it "redirects to the post index" do
          post :create, {:post => valid_attributes}
          expect(response).to redirect_to(action: :index, notice: 'Post was successfully created.')
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved post as @post" do
          post :create, {:post => invalid_attributes}
          expect(assigns(:post)).to be_a_new(Post)
        end

        it "re-renders the 'new' template" do
          post :create, {:post => invalid_attributes}
          expect(response).to render_template("new")
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested post" do
        post = Post.create! valid_attributes
        expect {
          delete :destroy, {:id => post.to_param}
        }.to change(Post, :count).by(-1)
      end

      it "redirects to the posts list" do
        post = Post.create! valid_attributes
        delete :destroy, {:id => post.to_param}
        expect(response).to redirect_to(posts_url)
      end
    end

  end
end
