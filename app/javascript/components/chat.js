$(document).ready(() => {

  const updateChat = (data, sender) => {
    const formatDate = (date) => {
      return `${date.getDay()}-${date.getMonth()}-${date.getFullYear()} ${date.getHours()}:${date.getMinutes()}`;
    };

    $('.chat-box').append(`
      <div class="chat-bubble-wrapper">
        <div class="chat-bubble ${sender}">
          <div class="chat-username">${data.identifier}</div>
          <div class="chat-message">${data.message}</div>
        </div>

        <div class="chat-timestamp  ${sender}">${formatDate(new Date(data.created_at))}</div>
      </div>
    `);
  };

  $('#chat-form').on('ajax:success', function(data) {
    $('#chat-form')[0].reset();
  });

  const pusher = new Pusher('b1fdca9e6c16d5424839', {
    cluster: 'us2',
    encrypted: true
  });

  const notification = data => {
    chatBtn = document.getElementById(`chat-booking-${data.booking_id}`);
    if (chatBtn) {console.log(data)
      chatBtn.insertAdjacentHTML("beforeend", "<i class='fas fa-circle'></i>");
    }
  };

  const channel = pusher.subscribe('chat');

  let booking_id = $('.chat-box').data("booking_id")
  let current_user = $('.chat-box').data("current_user")

  channel.bind('new', function(data) {
    notification(data);
    let sender = data.user_id == current_user ? "me" : "him"
    if (data.booking_id == booking_id) {
      updateChat(data, sender);
      let chatBox = document.querySelector('.chat-box');
      chatBox.scrollTop = chatBox.scrollHeight - chatBox.clientHeight;
    }
  });
});


