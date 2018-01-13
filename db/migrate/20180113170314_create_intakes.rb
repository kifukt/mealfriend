class CreateIntakes < ActiveRecord::Migration[5.1]
  def change
    create_table :intakes do |t|
      t.references :user, foreign_key: true
      t.references :ingredient, foreign_key: true
      t.float :amount

      t.timestamps
    end
  end
end
