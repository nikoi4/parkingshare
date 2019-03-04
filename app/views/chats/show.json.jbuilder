json.extract! @chat, :id, :identifier, :message
json.url booking_chats_url(@chat, format: :json)
