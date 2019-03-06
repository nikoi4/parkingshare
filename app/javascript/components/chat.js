$(document).ready(() => {
  let username = '';

  const updateChat = (data, sender) => {
    $('.chat-box').append(`
      <div class="chat-bubble-wrapper">
        <div class="chat-bubble ${sender}">
          <div class="chat-username">${data.identifier}</div>
          <div class="chat-message">${data.message}</p>
        </div>
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

  const channel = pusher.subscribe('chat');
  let booking_id = $('.chat-box').data("booking_id")
  let current_user = $('.chat-box').data("current_user")
  channel.bind('new', function(data) {
    let sender = data.user_id == current_user ? "me" : "him"
    if (data.booking_id == booking_id) {
      updateChat(data, sender);
    }
  });
});
