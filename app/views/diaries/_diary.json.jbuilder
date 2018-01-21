#json.extract! diary, :id, :user_id, :weight, :created_at, :updated_at
json.diaries current_user.diaries do |diary|
    json.id diary.id
    json.weight diary.weight
    json.created_at diary.created_at.to_s(:db)
end
