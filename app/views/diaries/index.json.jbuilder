# json.array! @diaries, partial: 'diaries/diary', as: :diary
json.diaries current_user.diaries do |diary|
    json.weight diary.weight
    json.created_at diary.created_at.to_s(:db)
end
