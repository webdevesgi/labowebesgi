require 'spec_helper'

describe User do

  let(:valid_user_attributes) { FactoryGirl.build(:user).attributes }
  let(:valid_email_addresses) { %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp] }
  let(:not_valid_email_addresses) { %w[user@foo,com user_at_foo.org example.user@foo.] }

  it "should create a new instance given a valid attribute" do
    FactoryGirl.create(:user)
  end

  it "should respond to its full name" do
    user = FactoryGirl.build(:user)
    user.full_name.should eq("#{user.firstname} #{user.lastname}")
  end

  it "should create a new instance with one subscribed event" do
    user = FactoryGirl.create(:user_with_subscribed_events)
    user.events_subscribed.should have(1).items
  end

  it "should require an email address" do
    no_email_user = FactoryGirl.build(:user_missing_email)
    no_email_user.should_not be_valid
  end

  it "should accept valid email addresses" do
    valid_email_addresses.each do |address|
      valid_email_user = FactoryGirl.build(:user, email: address)
      valid_email_user.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    not_valid_email_addresses.each do |address|
      invalid_email_user = FactoryGirl.build(:user, email: address)
      invalid_email_user.should_not be_valid
    end
  end

  it "should reject duplicate email addresses" do
    first_user = FactoryGirl.create(:user)
    user_with_duplicate_email = FactoryGirl.build(:user, email: first_user.email)
    user_with_duplicate_email.should_not be_valid
  end

  it "should reject email addresses identical up to case" do
    upcased_email = valid_user_attributes['email'].upcase
    first_user = FactoryGirl.create(:user, email: upcased_email)
    user_with_duplicate_email = FactoryGirl.build(:user, email: upcased_email)
    user_with_duplicate_email.should_not be_valid
  end

  describe "passwords" do

    before(:each) do
      @user = FactoryGirl.build(:user)
    end

    it "should have a password attribute" do
      @user.should respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      @user.should respond_to(:password_confirmation)
    end
  end

  describe "password validations" do

    it "should require a password" do
      FactoryGirl.build(:user_missing_password).should_not be_valid
    end

    it "should require a matching password confirmation" do
      FactoryGirl.build(:user_different_password_confirmation).should_not be_valid
    end

    it "should reject short passwords" do
      FactoryGirl.build(:user_too_short_password).should_not be_valid
    end

  end

  describe "password encryption" do

    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end

    it "should set the encrypted password attribute" do
      @user.encrypted_password.should_not be_blank
    end

  end

  describe "optional attributes" do

    context "website" do

      it "is valid with valid website" do
        FactoryGirl.build(:user, website: Faker::Internet.url).should be_valid
      end

      it "is valid without website" do
        FactoryGirl.build(:user, website: nil).should be_valid
      end

      it "is invalid with valid inwebsite" do
        FactoryGirl.build(:user, website: 'not_invalid').should_not be_valid
      end

    end

    context "blog" do

      it "is valid with valid blog" do
        FactoryGirl.build(:user, blog: Faker::Internet.url).should be_valid
      end

      it "is valid without blog" do
        FactoryGirl.build(:user, blog: nil).should be_valid
      end

      it "is invalid with valid inwebsite" do
        FactoryGirl.build(:user, blog: 'not_invalid').should_not be_valid
      end

    end

  end

end
