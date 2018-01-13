class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.float :calories
      t.float :carbohydrates
      t.float :fats
      t.string :name
      t.float :proteins

      t.timestamps
    end
  end
end
