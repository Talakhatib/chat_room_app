require 'rails_helper'

RSpec.describe "Rooms", type: :request do
  describe "room controller " do
    it " index" do 
      user = User.new(username: "test user")
      user.save
      post signin_path , :params=>{:session=>{:username => user.username}}
      get rooms_path
    end

    it " show " do 
      user = User.new(username: "test user")
      user.save
      post signin_path , :params=>{:session=>{:username => user.username}}
      room = Room.new(name: "room test")
      room.save 
      get room_path(room.id)
    end
    it  "create" do 
    post rooms_path,:params=>{:room=>{:name => "test room"}}
    end

  end
end
