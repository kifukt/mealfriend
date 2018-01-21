json.extract! intake, :id, :user_id, :ingredient_id, :amount, :created_at, :updated_at
# json.intakes current_user.intakes do |intake|
#     json.id intake.id
#     json.ingredient_id intake.ingredient_id
#     json.amount intake.amount
#     json.created_at intake.created_at.to_s(:db)
# end