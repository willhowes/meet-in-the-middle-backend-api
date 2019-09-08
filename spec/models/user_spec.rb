# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name: 'Test User', email: 'test@user.com',
                     password: '123456', password_confirmation: '123456')
  end

  it 'Should be valid.' do
    expect(@user.valid?).to eq true
  end

  describe 'Name Validation:' do
    it 'Name should exist.' do
      @user.name = '      '
      expect(@user.valid?).to eq false
    end

    it "Name shouldn't be too long." do
      @user.name = 'a' * 51
      expect(@user.valid?).to eq false
    end
  end

  describe 'Email Validation:' do
    it 'Email should exist' do
      @user.email = '      '
      expect(@user.valid?).to eq false
    end

    it 'Email should not be too long' do
      @user.email = 'a' * 244 + '@example.com'
      expect(@user.valid?).to eq false
    end

    it 'Email should accept valid formats' do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                           first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user.valid?).to eq true
      end
    end

    it 'Email should not accept invalid formats' do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                             foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user.valid?).to eq false
      end
    end

    it 'Email should be unique' do
      duplicate_user = @user.dup
      duplicate_user.email = @user.email.upcase
      @user.save
      expect(duplicate_user.valid?).to eq false
    end

    it 'Email should be saved as lower-case' do
      mixed_case_email = 'BaD@EXaMPLE.COM'
      @user.email = mixed_case_email
      @user.save
      expect(mixed_case_email.downcase).to eq @user.reload.email
    end
  end

  describe 'Password Validation:' do
    it 'Password should exist' do
      @user.password = @user.password_confirmation = '       '
      expect(@user.valid?).to eq false
    end

    it 'Password should have a minimum length' do
      @user.password = @user.password_confirmation = 'aaaaa'
      expect(@user.valid?).to eq false
    end
  end
end
