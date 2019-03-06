json.extract! @chat, :id, :identifier, :message, :user_id
json.url booking_chats_url(@chat, format: :json)
