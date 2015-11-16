require 'rails_helper'

describe "searching on my feed page" do
	let(:user) { FactoryGirl.create(:user) }
	let!(:post) { FactoryGirl.create(:post, user: user) }
	let!(:post2) { FactoryGirl.create(:post, user: user, body: "Not in search") }

	before do
		visit "/"
		fill_in	"Email", with: user.email
		fill_in "Password", with: 'password'
		click_on "Log in"
		expect(page).to have_content "My Feed"
	end

	it "filters by search term" do
		expect(page).to have_content "This is a tweet"
		fill_in "Search", with: "This is a tweet"
		click_on "Search"
		expect(page).not_to have_content "Not in search"
	end

end