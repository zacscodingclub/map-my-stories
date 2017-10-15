require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a first name, last name, email, and password" do
    user = User.new(
      username:   "bloblaw",
      first_name: "Bob",
      last_name:  "Loblaw",
      email:      "bob@example.com",
      password:   "test-1234"
    )

    expect(user).to be_valid
  end

  it "is invalid without a username" do
    user = User.new(username: nil)
    user.valid?
    expect(user.errors[:username]).to include("can't be blank")
  end

  it "is invalid without a first name" do
    user = User.new(first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end

  it "is invalid without a last name" do
    user = User.new(last_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end

  it "is invalid without an email address" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid with a duplicate username" do
    User.create(
      username:   "bloblaw",
      first_name: "Bob",
      last_name:  "Loblaw",
      email:      "bob@example.com",
      password:   "test-1234"
    )
    user = User.new(
      username:   "bloblaw",
      first_name: "Test",
      last_name:  "Account",
      email:      "bob@example.com",
      password:   "test-1234"
    )
    user.valid?

    expect(user.errors[:username]).to include("has already been taken")
  end
  
  it "is invalid with a duplicate email address" do
    User.create(
      username:   "bloblaw",
      first_name: "Bob",
      last_name:  "Loblaw",
      email:      "bob@example.com",
      password:   "test-1234"
    )
    user = User.new(
      username:   "test2124",
      first_name: "Test",
      last_name:  "Account",
      email:      "bob@example.com",
      password:   "test-1234"
    )
    user.valid?

    expect(user.errors[:email]).to include("has already been taken")
  end
end
