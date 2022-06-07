require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'Should be a user' do
      expect(User.new).to be_a User
    end


    it 'Should be valid' do
      user = User.new(:first_name => 'Darren', :last_name => 'Kelly', :email => 'DK@G.com', :password => 'sdgdfh43ujh573', :password_confirmation => 'sdgdfh43ujh573')
      expect(user).to be_valid
    end

    it 'Should not be valid without first name' do
      user = User.new(
        :first_name => nil, 
        :last_name => 'Kelly', 
        :email => 'DK@G.com', 
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
        :email => 'DK@G.com', 
        :password => nil, 
        :password_confirmation => 'sdgdfh43ujh573')
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include "Password can't be blank"
    end

    it 'Should not be valid with password less than 3 chars' do
      user = User.new(
        :first_name => 'Darren', 
        :last_name => 'Kelly', 
        :email => 'DK@G.com', 
        :password => 'sd', 
        :password_confirmation => 'sd')
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include "Password confirmation is too short (minimum is 3 characters)"
    end

    it 'Should not be valid if passwords don\'t match' do
      user = User.new(
        :first_name => 'Darren', 
        :last_name => 'Kelly', 
        :email => 'DK@G.com', 
        :password => 'sdgdfh43ujh573', 
        :password_confirmation => 'sdgdfh43ujh')
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'Should not be valid with duplicate email' do
      user = User.new(
        :first_name => 'Darren', 
        :last_name => 'Kelly', 
        :email => 'DK@G.com', 
        :password => 'sdgdfh43ujh573', 
        :password_confirmation => 'sdgdfh43ujh573')
        user.save
      user2 = User.new(
        :first_name => 'Tatiana', 
        :last_name => 'Aniks', 
        :email => 'DK@G.com', 
        :password => 'sdgdfh43ujh573', 
        :password_confirmation => 'sdgdfh43ujh573')
      expect(user2).to_not be_valid
      expect(user2.errors.full_messages).to include "Email has already been taken"
    end

  end

end
