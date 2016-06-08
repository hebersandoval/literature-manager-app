require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid" do
    user = User.new(name: "John Doe", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = User.new(email: "user@example.com")
    expect(user).to be_invalid
  end

  it "is invalid when name is too long" do
    user = User.new
    user.name = "a" * 51
    expect(user).to be_invalid
  end

  it "is invalid without an email address" do
    user = User.new(email: nil)
    expect(user).to be_invalid
    # user.valid?
    # expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid when email is too long" do
    user = User.new
    user.email = "a" * 244 + "@example.com"
    expect(user).to be_invalid
  end

  it "is invalid with a unformated email" do
    # user = User.new(name: "John Doe", email: "")
    # expect(user).to be_invalid
  end

  it "is invalid when non-unique" do
    # User.create(name: "John Doe", email: "user@example.com")
    # user = User.new(name: "John Doe", email: "john@example.com")
    # expect(user).to be_invalid
  end

  it 'password length less than 6 characters is invalid' do
    user = User.new(name: "John Doe", email: "user@example.com", password: '12345')
    expect(user).to be_invalid
  end
end

# checks for email duplication

 # it "is invalid with a duplicate email address" do
 #   User.create(
 #     firstname: 'Joe', lastname: 'Tester',
 #     email: 'tester@example.com'
 #   )
 #   user = User.new(
 #     firstname: 'Jane', lastname: 'Tester',
 #     email: 'tester@example.com'
 #   )
 #   user.valid?
 #   expect(user.errors[:email]).to include("has already been taken")
 # end
