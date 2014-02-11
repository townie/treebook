require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "a user should enter first name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  test "a user should enter last name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end
  test "a user should enter profle name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile].empty?
  end

  test "a user should have a unique profile name" do
  	user = User.new
  	user.profile = users(:jason).profile
  	
  	assert !user.save
  	assert !user.errors[:profile].empty?
  end

  test "a user should have a profile without spaces" do
  	user = User.new
  	user.profile = "My Prfole with Spaces"

  	assert !user.save
  	assert !user.errors[:profile].empty?
  	assert user.errors[:profile].include?("Must be formated correctly.")
  end


end
