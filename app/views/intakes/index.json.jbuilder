# json.array! @intakes, partial: 'intakes/intake', as: :intake
json.intakes current_user.intakes do |intake|
    json.ingredient intake.ingredient.name
    json.amount intake.amount
    json.created_at intake.created_at.to_s(:db)
end