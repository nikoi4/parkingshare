json.extract! @chat, :id, :identifier, :message, :user_id, :created_at, :booking_id
json.url booking_chats_url(@chat, format: :json)
