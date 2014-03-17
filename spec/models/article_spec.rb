require 'spec_helper'

describe Article do

  it "should create a new instance given a valid attribute" do
    FactoryGirl.create(:article)
  end

  it "is invalid without title" do
    FactoryGirl.build(:article, title: nil).should_not be_valid
  end

  it "is invalid without content" do
    FactoryGirl.build(:article, content: nil).should_not be_valid
  end

  describe "User association" do

    it "retrieves its author" do
      author = FactoryGirl.create(:user)
      FactoryGirl.build(:article, user: author).user.should eq(author)
    end

  end

end
