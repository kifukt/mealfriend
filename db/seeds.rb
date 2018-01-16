# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create(
    [
        {
            login: 'jankowalski',
            password: 'password',
            height: 179,
            birthdate: DateTime.strptime("09/01/1995 17:00", "%m/%d/%Y %H:%M"),
            sex: true
        },
        {
            login: 'joannakowalska',
            password: 'password',
            height: 165,
            birthdate: DateTime.strptime("01/08/1998 17:00", "%m/%d/%Y %H:%M"),
            sex: true
        }
    ]
)

ingredients = Ingredient.create(
    [
        {
            name: 'egg',
            calories: 155,
            fats: 11,
            carbohydrates: 1.1,
            proteins: 13
        },
        {
            name: 'rice',
            calories: 130,
            fats: 0.3,
            carbohydrates: 28,
            proteins: 2.7
        }
    ]
)

# intakes = Intake.create(
#     [
#         {
#             login: 'jankowalski',
#             name: 'rice',
#             amount: 150
#         },
#         {
#             login: 'jankowalski',
#             name: 'egg',
#             amount: 100
#         }
#     ]
# )

# diaries = Diary.create(
#     [
#         {
#             login: 'joannakowalska',
#             weight: 55
#         },
#         {
#             login: 'jankowalski',
#             weight: 81
#         }
#     ]
# )