require 'spec_helper'

describe UsersController do

  login_user

  describe "GET 'show'" do

    it "should be successful" do
      get :show, id: @user.id
      response.should be_success
    end

    it "should find the right user" do
      get :show, id: @user.id
      assigns(:user).should == @user
    end

    # it "should display the list of talks" do
    #   talk = FactoryGirl.create(:talk, speaker: @user)
    #   visit user_path(@user)
    #   page.should have_content(talk.title)
    # end

  end

end
