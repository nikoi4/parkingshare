json.extract! @chat, :id, :identifier, :message, :user_id, :created_at
json.url booking_chats_url(@chat, format: :json)
