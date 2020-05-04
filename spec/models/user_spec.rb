require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      @user = User.new(name: "Dave Smith", email: "dave_smith@gmail.com", password: "hello1234", password_confirmation: "hello1234")
      expect(@user).to be_valid
    end

    it 'is not valid without password' do
      @user = User.new(name: "Dave Smith", email: "dave_smith@gmail.com", password: nil, password_confirmation: "hello1234")
      expect(@user).to_not be_valid
    end
  
    it 'is not valid without password_confirmation' do
      @user = User.new(name: "Dave Smith", email: "dave_smith@gmail.com", password: "hello1234", password_confirmation: nil)
      expect(@user).to_not be_valid
    end

    it "is not valid if password and password_confirmation don't match" do
      @user = User.new(name: "Dave Smith", email: "dave_smith@gmail.com", password: "hello1234", password_confirmation: "testing12")
      expect(@user).to_not be_valid
    end

    it 'is not valid if password is not valid length' do
      @user = User.new(name: "Dave Smith", email: "dave_smith@gmail.com", password: "hello", password_confirmation: "hello")
      expect(@user).to_not be_valid
    end
    
    it 'is not valid without email' do
      @user = User.new(name: "Dave Smith", email: nil, password: "hello1234", password_confirmation: "hello1234")
      expect(@user).to_not be_valid
    end

    it 'is not valid if email is not unique' do
      @user = User.create(name: "Dave Smith", email: "dave_smith@gmail.com", password: "hello1234", password_confirmation: "hello1234")
      @user = User.new(name: "Dave Smith", email: "dave_smith@gmail.com", password: "hello1234", password_confirmation: "hello1234")
      expect(@user).to_not be_valid
    end

    it 'is not valid without name' do
      @user = User.new(name: nil, email: "dave_smith@gmail.com", password: "hello1234", password_confirmation: "hello1234")
      expect(@user).to_not be_valid
    end
    
  end
end
