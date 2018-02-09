# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

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

# ingredients = Ingredient.create(
#     [
#         {
#             name: 'egg',
#             calories: 155,
#             fats: 11,
#             carbohydrates: 1.1,
#             proteins: 13
#         },
#         {
#             name: 'rice',
#             calories: 130,
#             fats: 0.3,
#             carbohydrates: 28,
#             proteins: 2.7
#         }
#     ]
# )



ingredients = Ingredient.create(
[
{
name: 'cucumber',
calories: 15.5,
fats: 0.1,
carbohydrates: 3.6,
proteins: 0.7
},
{
name: 'tomato',
calories: 17.7, 
fats: 0.2,
carbohydrates: 3.9,
proteins: 0.9
},
{
name: 'pepper chili',
calories: 40,
fats: 0.2,
carbohydrates: 9,
proteins: 2
},
{
name: 'mushroom',
calories: 28, 
fats: 0.5,
carbohydrates: 5,
proteins: 2.2
},
{
name: 'onion',
calories: 39, 
fats: 0.1,
carbohydrates: 9,
proteins: 1.1
},
{
name: 'spinach',
calories: 23, 
fats: 0.4,
carbohydrates: 3.6,
proteins: 2.9
},
{
name: 'rucola',
calories: 25,
fats: 0.7,
carbohydrates: 3.7,
proteins: 2.6
},
{
name: 'lettuce',
calories: 14,
fats: 0.2,
carbohydrates: 2.9,
proteins: 1.4,
},
{
name: 'Chinese leaves',
calories: 12,
fats: 0.2,
carbohydrates: 2.2,
proteins: 1.1,
},
{
name: 'sweetcorn',
calories: 365,
fats: 4.7,
carbohydrates: 74,
proteins: 9
},
{
name: 'bean',
calories: 318,
fats: 1.6,
carbohydrates: 61.6,
proteins: 21.4
},
{
name: 'chickpea',
calories: 364,
fats: 6,
carbohydrates: 61,
proteins: 19
},
{
name: 'lentil',
calories: 116,
fats: 0.4,
carbohydrates: 20,
proteins: 9
},
{
name: 'grease',
calories: 897,
fats: 100,
carbohydrates: 0,
proteins: 0.1
},
{
name: 'olive oil',
calories: 884,
fats: 100,
carbohydrates: 0,
proteins: 0
},
{
name: 'butter',
calories: 716,
fats: 81,
carbohydrates: 0.1,
proteins: 0.9
},
{
name: 'linseed oil',
calories: 884,
fats: 100,
carbohydrates: 0,
proteins: 0.1
},
{
name: 'peanut',
calories: 567,
fats: 49,
carbohydrates: 16,
proteins: 26
},
{
name: 'walnut',
calories: 657,
fats: 60.3,
carbohydrates: 18,
proteins: 6.5
},
{
name: 'cashew nut',
calories: 553,
fats: 44,
carbohydrates: 30,
proteins: 18
},
{
name: 'egg',
calories: 155,
fats: 11,
carbohydrates: 1.1,
proteins: 13
},
{
name: 'chicken breast',
calories: 164,
fats: 3.6,
carbohydrates: 0,
proteins: 31
},
{
name: 'turkey breast',
calories: 84,
fats: 0.7,
carbohydrates: 0,
proteins: 19.2
},
{
name: 'pork',
calories: 230,
fats: 11.6,
carbohydrates: 0,
proteins: 20.6
},
{
name: 'beef',
calories: 250,
fats: 15,
carbohydrates: 0,
proteins: 26
},
{
name: 'mackerel',
calories: 261,
fats: 18,
carbohydrates: 0,
proteins: 24
},
{
name: 'herring',
calories: 217,
fats: 15.4,
carbohydrates: 0,
proteins: 19.8
},
{
name: 'tuna',
calories: 110,
fats: 0.9,
carbohydrates: 0,
proteins: 25.1
},
{
name: 'trout',
calories: 190,
fats: 8,
carbohydrates: 0,
proteins: 27
},
{
name: 'salmon',
calories: 208,
fats: 13,
carbohydrates: 0,
proteins: 20
},
{
name: 'pasta',
calories: 131,
fats: 1.1,
carbohydrates: 25,
proteins: 5
},
{
name: 'penne',
calories: 118,
fats: 4,
carbohydrates: 17,
proteins: 6
},
{
name: 'spaghetti',
calories: 157,
fats: 0.9,
carbohydrates: 31,
proteins: 6
},
{
name: 'rice',
calories: 130,
fats: 0.3,
carbohydrates: 28,
proteins: 2.7
},
{
name: 'barley groats',
calories: 109,
fats: 0.7,
carbohydrates: 23,
proteins: 2.3
},
{
name: 'bulgur',
calories: 360,
fats: 1.8,
carbohydrates: 69,
proteins: 12.5
},
{
name: 'cuscus',
calories: 376,
fats: 0.7,
carbohydrates: 77,
proteins: 13
},
{
name: 'potato',
calories: 76,
fats: 0.1,
carbohydrates: 17,
proteins: 2
},
{
name: 'broccoli',
calories: 33,
fats: 0.4,
carbohydrates: 7,
proteins: 2.8
},
{
name: 'cauliflower',
calories: 24,
fats: 0.3,
carbohydrates: 5,
proteins: 1.9
},
{
name: 'white bread',
calories: 262,
fats: 1.4,
carbohydrates: 54.3,
proteins: 8.5
},
{
name: 'wholemeal bread',
calories: 247,
fats: 3.4,
carbohydrates: 41,
proteins: 13
},
{
name: 'milk',
calories: 42,
fats: 1,
carbohydrates: 5,
proteins: 3.4
},
{
name: 'camembert',
calories: 300,
fats: 24,
carbohydrates: 0.5,
proteins: 20
},
{
name: 'gouda',
calories: 356,
fats: 27,
carbohydrates: 2.2,
proteins: 25
},
{
name: 'mozzarella',
calories: 280,
fats: 17,
carbohydrates: 3.1,
proteins: 28
},
{
name: 'feta cheese',
calories: 264,
fats: 21,
carbohydrates: 4.1,
proteins: 14
},
{
name: 'apple',
calories: 52,
fats: 0.2,
carbohydrates: 14,
proteins: 0.3
},
{
name: 'banana',
calories: 88,
fats: 0.3,
carbohydrates: 23,
proteins: 1.1
},
{
name: 'pear',
calories: 57,
fats: 0.1,
carbohydrates: 15,
proteins: 0.4
},
{
name: 'orange',
calories: 47,
fats: 0.1,
carbohydrates: 12,
proteins: 0.9
},
{
name: 'tangerine',
calories: 53,
fats: 0.3,
carbohydrates: 13,
proteins: 0.8
},
{
name: 'strawberry',
calories: 32,
fats: 0.3,
carbohydrates: 7.7,
proteins: 0.7
},
{
name: 'cherry',
calories: 50,
fats: 0.3,
carbohydrates: 12,
proteins: 1
},
{
name: 'colza oil',
calories:  884,
fats: 100,
carbohydrates: 0,
proteins: 0
}
]
)


intakes = Intake.create(
    [
        {
            user: users.first,
            ingredient: ingredients.first,
            amount: 150
        },
        {
            user: users.last,
            ingredient: ingredients.last,
            amount: 250
        }
    ]
)

diaries = Diary.create(
    [
        {
            user: users.last,
            weight: 55
        },
        {
            user: users.first,
            weight: 81
        }
    ]
)