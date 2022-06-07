require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'Should be a user' do
      expect(User.new).to be_a User
    end


    it 'Should be valid' do
      user = User.new(:first_name => 'Darren', :last_name => 'Kelly', :email => 'DPK@G.com', :password => 'sdgdfh43ujh573',
        :password_confirmation => 'sdgdfh43ujh573')
      expect(user).to be_valid
    end

    it 'Should not be valid without first name' do
      user = User.new(
        :first_name => nil, 
        :last_name => 'Kelly', 
        :email => 'DPK@G.com', 
        :password => 'sdgdfh43ujh573',
        :password_confirmation => 'sdgdfh43ujh573')
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include "First name can't be blank"
    end

    it 'Should not be valid without last name' do
      user = User.new(
        :first_name => 'Darren', 
        :last_name => nil, 
        :email => 'DK@G.com', 
        :password => 'sdgdfh43ujh573', 
        :password_confirmation => 'sdgdfh43ujh573')
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include "Last name can't be blank"
    end

    it 'Should not be valid without email' do
      user = User.new(
        :first_name => 'Darren', 
        :last_name => 'Kelly', 
        :email => nil, 
        :password => 'sdgdfh43ujh573', 
        :password_confirmation => 'sdgdfh43ujh573')
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include "Email can't be blank"
    end

    it 'Should not be valid without password' do
      user = User.new(
        :first_name => 'Darren', 
        :last_name => 'Kelly', 
        :email => 'DPK@G.com', 
        :password => nil, 
        :password_confirmation => 'sdgdfh43ujh573')
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include "Password can't be blank"
    end

    it 'Should not be valid with password less than 3 chars' do
      user = User.new(
        :first_name => 'Darren', 
        :last_name => 'Kelly', 
        :email => 'DPK@G.com', 
        :password => 'sd', 
        :password_confirmation => 'sd')
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include "Password confirmation is too short (minimum is 3 characters)"
    end

    it 'Should not be valid if passwords don\'t match' do
      user = User.new(
        :first_name => 'Darren', 
        :last_name => 'Kelly', 
        :email => 'DPK@G.com', 
        :password => 'sdgdfh43ujh573', 
        :password_confirmation => 'sdgdfh43ujh')
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'Should not be valid with duplicate email' do
      user = User.new(
        :first_name => 'Darren', 
        :last_name => 'Kelly', 
        :email => 'DPK@G.com', 
        :password => 'sdgdfh43ujh573', 
        :password_confirmation => 'sdgdfh43ujh573')
        user.save
      user2 = User.new(
        :first_name => 'Tatiana', 
        :last_name => 'Aniks', 
        :email => 'DPK@G.com', 
        :password => 'sdgdfh43ujh573', 
        :password_confirmation => 'sdgdfh43ujh573')
      expect(user2).to_not be_valid
      expect(user2.errors.full_messages).to include "Email has already been taken"
    end
  end

  describe '.authenticate_with_credentials' do

    @user = User.new(
      :first_name => 'test', 
      :last_name => 'tester', 
      :email => 'testemail@g.com'.strip.downcase, 
      :password => 'password', 
      :password_confirmation => 'password')
    @user.save

    it 'Should just work' do
      expect(User.authenticate_with_credentials('testemail@g.com', 'password')).to be_truthy
    end

    it 'Should return nil for no password' do
      expect(User.authenticate_with_credentials('testemail@g.com', nil)).to be_nil
    end
    it 'Should return nil for no user email' do
      expect(User.authenticate_with_credentials('testemail@g.com', nil)).to be_nil
    end
    it 'Should return true even with white space' do
      expect(User.authenticate_with_credentials('  testemail@g.com   ', 'password')).to be_truthy
    end
    it 'Should return true even with Upper case' do
      expect(User.authenticate_with_credentials('TestEmail@G.com', 'password')).to be_truthy
    end

  end
end
