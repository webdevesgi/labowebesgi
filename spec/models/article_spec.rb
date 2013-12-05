require 'spec_helper'

describe Article do

  it "should create a new instance given a valid attribute" do
    FactoryGirl.create(:article)
  end

end
