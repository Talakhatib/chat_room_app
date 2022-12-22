require 'rails_helper'

RSpec.describe "Messages", type: :request do
  describe "messages controller" do

    it "create" do
      user = User.new(username: "test user")
      user.save
      post signin_path , :params=>{:session=>{:username => user.username}}
      room = Room.new(name:"room1")
      room.save
      post room_messages_path(room.id) , :params => {:message => {:content => "testing message"}}
    end
    
  end
end
