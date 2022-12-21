import consumer from "./consumer"

  // const room_element = document.getElementById('room-id');
  // const room_id = room_element.getAttribute('data-room-id');
  
  
  consumer.subscriptions.create({channel: "RoomChannel",room_id: "" },{
    connected() {
      // console.log("connected to "+ room_id)
      // Called when the subscription is ready for use on the server
    },
  
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
  
    received(data) {
      // console.log(data)
      // const messageContainer = document.getElementById('messages');
      // messageContainer.innerHtml = messageContainer.innerHTML + data.html
    }
  });




