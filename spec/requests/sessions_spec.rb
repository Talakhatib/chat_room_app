require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "sessions controller " do
    it " create  " do 
      user = User.new(username: "test user")
      user.save
      post signin_path , :params=>{:session=>{:username => user.username}}
    end

    it "destroy" do 
      user = User.new(username: "test user")
      user.save
      post signin_path , :params=>{:session=>{:username => user.username}}
      delete signout_path
    end
  end
end
