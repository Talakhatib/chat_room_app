require 'rails_helper'

RSpec.describe MessagNotification, type: :model do
  context " testing the messag notification" do
     it "should success if all fields are available" do
      user = User.new(username: "test user")
      user.save
      room = Room.new(name: "test room")
      room.save
      message = Message.new(content:"test message",room: room,user: user)
      message.save
      messagnotification = MessagNotification.new(user: user,room: room,message: message).save
      expect(messagnotification).to eq(true) 
     end
    
  end
  
end
