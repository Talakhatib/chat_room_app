require 'rails_helper'

RSpec.describe Message, type: :model do
  context "validation of message" do

    it "ensure validation of user" do 
      room = Room.new(name: "test room")
      room.save
      message = Message.new(content:"testing message",room: room).save
      expect(message).to eq(false) 
    end

    it "ensure validation of room" do 
      user = User.new(username: "test user")
      user.save
      message = Message.new(content:"testing message",user: user).save
      expect(message).to eq(false) 
    end

    it "ensure content" do
      user = User.new(username: "test user")
      user.save
      room = Room.new(name: "test room")
      room.save
      message = Message.new(room: room,user: user).save
      expect(message).to eq(false) 
    end

    it "save should success" do 
      user = User.new(username: "test user")
      user.save
      room = Room.new(name: "test room")
      room.save
      message = Message.new(content:"test message",room: room,user: user).save
      expect(message).to eq(true) 
    end
    
  end
  
end
