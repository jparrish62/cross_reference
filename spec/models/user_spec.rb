require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid user_name" do
    user = FactoryGirl.create(:user, user_name: "john")
    expect(user).to be_valid
  end

  it "has a valid email" do
    user = FactoryGirl.create(:user, email: 'john@gmail.com')
    expect(user).to be_valid
  end

  it "has a valid password" do
    user = FactoryGirl.create(:user, password: '12345678')
    expect(user).to be_valid
  end

end
