require 'rails_helper'

RSpec.describe Room, type: :model do
  context "validation of room model" do

    it "ensure name of room" do 
     room = Room.new(name: "").save
     expect(room).to eq(false) 
    end

    it "save should success" do 
     room = Room.new(name: "room test").save 
     expect(room).to eq(true) 
    end
    
  end
  
end
