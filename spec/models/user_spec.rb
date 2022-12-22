require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations of user model" do

    it "ensure username" do
      user = User.new().save
      expect(user).to eq(false) 
    end

    it "should success save" do
      user = User.new(username: "Test").save
      expect(user).to eq(true) 
    end
    
  end
  
end
