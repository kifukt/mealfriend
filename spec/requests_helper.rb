require "rails_helper"

module RequestsHelper
    def self.prepare_requests
        User.destroy_all
        Diary.destroy_all
        Intake.destroy_all
        Ingredient.destroy_all

        #Create_new_user
        user = User.new(
            login: 'jankowalski',
            password: 'password',
            height: 179,
            birthdate: DateTime.strptime("09/01/1995 17:00", "%m/%d/%Y %H:%M"),
            sex: true
        )
        user.save!
        user.regenerate_token
        user.reload

        ingredient = Ingredient.new(
            name: 'egg',
            calories: 155,
            fats: 11,
            carbohydrates: 1.1,
            proteins: 13
        )
        ingredient.save!

        diary = Diary.new(
            user: user,
            weight: 81
        )
        diary.save!

        intake = Intake.new(
            user: user,
            ingredient: ingredient,
            amount: 150
        )
        intake.save!

        return {
            user: user,
            ingredient: ingredient,
            diary: diary,
            intake: intake
        }
    end
end

