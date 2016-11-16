require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "is invalid without a comment" do
    comment = FactoryGirl.build(:comment, body: nil)
    expect(comment).not_to be_valid
  end

  it "is valid with a comment" do
    comment = FactoryGirl.build(:comment, body:"String")
    expect(comment).to be_valid
  end

  it "is invalid without an id" do
    comment = FactoryGirl.build(:comment, commentable_id: nil)
    expect(comment).not_to be_valid
  end

  it "is valid with an id" do
    comment = FactoryGirl.build(:comment, commentable_id: 1)
    expect(comment).to be_valid
  end

  it "is invalid without commentable_type" do
    comment = FactoryGirl.build(:comment, commentable_type: nil)
    expect(comment).not_to be_valid
  end

  it "is valid with a commentable type" do
    comment = FactoryGirl.build(:comment, commentable_type: "String")
    expect(comment).to be_valid
  end
end
