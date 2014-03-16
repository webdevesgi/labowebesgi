require 'spec_helper'

describe ArticlesController do

  before(:each) do
    @article = FactoryGirl.create(:article)
  end

  describe "GET index" do
    it "assigns all articles as @articles" do
      get :index
      assigns(:articles).should eq(Article.all)
    end
  end

  describe "GET show" do
    it "assigns the requested article as @article" do
      get :show, { :id => @article.to_param }
      assigns(:article).should eq(@article)
    end
  end

end
