require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end

    describe "Check articles" do
      before(:each) do
        @articles = FactoryGirl.create_list(:article, 10)
      end

      it "should assign articles" do
        get 'index'
        assigns(:articles).should == @articles.last(3).reverse
      end
    end

    describe "Check next event" do
      before(:each) do
        @next_event = FactoryGirl.create(:future_event)
      end

      it "should assign next_event" do
        get 'index'
        assigns(:next_event).should == @next_event
      end
    end
  end

end
