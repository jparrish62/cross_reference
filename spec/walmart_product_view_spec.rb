require 'rails_helper'
feature "Idex Page" do
  scenario "user signs in and is taken to index page" do
    user = FactoryGirl.create(:user)
    visit root_path
    save_and_open_page
    sign_in(user)
  end
end
