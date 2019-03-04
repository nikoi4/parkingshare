$(document).ready(() => {
  let username = '';

  const updateChat = function(data) {
    $('.chat-box').append(`
      <div class="col-12">
        <div class="chat bg-secondary d-inline-block text-left text-white mb-2">
          <div class="chat-bubble">
            <small class="chat-username">${data.identifier}</small>
            <p class="m-0 chat-message">${data.message}</p>
          </div>
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
  channel.bind('new', function(data) {
    if (data.booking_id == $('.chat-box').data("booking_id")) {
      updateChat(data);
    }
  });
});
