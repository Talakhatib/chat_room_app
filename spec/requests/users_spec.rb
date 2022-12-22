require 'rails_helper'

RSpec.describe "Users", type: :request do
  context "user controller " do

    it "new" do 
      get new_user_path
    end

    it "create " do 
      post users_path ,:params => { :user => { :username => "Any Name"}}
    end
    
  end
end
