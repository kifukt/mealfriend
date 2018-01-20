json.diaries current_user.diaries do |diary|
    json.weight diary.weight
    json.created_at diary.created_at.to_s(:db)
end
json.intakes current_user.intakes do |intake|
    json.ingredient intake.ingredient.name
    json.amount intake.amount
    json.created_at intake.created_at.to_s(:db)
end