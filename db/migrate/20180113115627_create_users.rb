class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :login
      t.date :birthdate
      t.integer :height
      t.boolean :sex

      t.timestamps
    end
  end
end
